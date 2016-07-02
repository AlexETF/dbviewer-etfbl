package net.etfbl.dbviewer.database;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class ConnectionPool {

    private String driver;
    private String jdbcURL;
    private String username;
    private String password;
    private int preconnectCount;
    private int connectCount;
    private int maxIdleConnections;
    private int maxConnections;
    private ArrayList<Connection> usedConnections;
    private ArrayList<Connection> freeConnections;

    public static ConnectionPool getConnectionPool() {
        return connectionPool;
    }
    private static ConnectionPool connectionPool;

    static {

        Properties prop = new Properties();
        InputStreamReader is = null;
        String driver;
        String jdbcURL;
        String username;
        String password;
        int preconnectCount = 0;
        int maxIdleConnections = 10;
        int maxConnections = 10;

        try {
            is = new InputStreamReader(ConnectionPool.class.getResourceAsStream("/db.properties"));
            prop.load(is);
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        }
        driver = prop.getProperty("driver");
        jdbcURL = prop.getProperty("url");
        username = prop.getProperty("username");
        password = prop.getProperty("password");
        try {
            preconnectCount = Integer.parseInt(prop.getProperty("preconnectCount"));
            maxIdleConnections = Integer.parseInt(prop.getProperty("maxIdleConnections"));
            maxConnections = Integer.parseInt(prop.getProperty("maxConnections"));
            
            connectionPool = new ConnectionPool(driver,
                    jdbcURL, username, password,
                    preconnectCount, maxIdleConnections,
                    maxConnections);
        } catch (Exception ex) {
            ex.printStackTrace(System.err);
        }
    }

    protected ConnectionPool(String aDriver,
            String aJdbcURL, String aUsername,
            String aPassword, int aPreconnectCount,
            int aMaxIdleConnections,
            int aMaxConnections)
            throws ClassNotFoundException, SQLException {

        freeConnections = new ArrayList<Connection>();
        usedConnections = new ArrayList<Connection>();
        driver = aDriver;
        jdbcURL = aJdbcURL;
        username = aUsername;
        password = aPassword;
        preconnectCount = aPreconnectCount;
        maxIdleConnections = aMaxIdleConnections;
        maxConnections = aMaxConnections;

        Class.forName(driver);
        for (int i = 0; i < preconnectCount; i++) {
            Connection conn = DriverManager.getConnection(
                    jdbcURL, username, password);
            conn.setAutoCommit(true);
            freeConnections.add(conn);
        }
        connectCount = preconnectCount;
    }

    public synchronized Connection checkOut()
            throws SQLException {

        Connection conn = null;
        if (freeConnections.size() > 0) {
            conn = (Connection) freeConnections.get(0);
            freeConnections.remove(0);
            usedConnections.add(conn);
        } else {
            if (connectCount < maxConnections) {
                conn = DriverManager.getConnection(
                        jdbcURL, username, password);
                usedConnections.add(conn);
                connectCount++;
            } else {
                try {
                    wait();
                    conn = (Connection) freeConnections.get(0);
                    freeConnections.remove(0);
                    usedConnections.add(conn);
                } catch (InterruptedException ex) {
                    ex.printStackTrace(System.err);
                }
            }
        }
        return conn;
    }

    public synchronized void checkIn(Connection aConn) {
        if (aConn == null) {
            return;
        }
        if (usedConnections.remove(aConn)) {
            freeConnections.add(aConn);
            while (freeConnections.size() > maxIdleConnections) {
                int lastOne = freeConnections.size() - 1;
                Connection conn = (Connection) freeConnections.get(lastOne);
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
                freeConnections.remove(lastOne);
            }
            notify();
        }
    }

}

package net.etfbl.dbviewer.database.mysql.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import net.etfbl.dbviewer.database.ConnectionPool;
import static net.etfbl.dbviewer.database.mysql.dao.HijerarhijaTabelaDAO.SQL_SELECT_ALL;
import net.etfbl.dbviewer.database.mysql.dto.HijerarhijaTabelaDTO;
import net.etfbl.dbviewer.database.mysql.dto.TabelaDTO;

import net.etfbl.dbviewer.model.MetaModelSchemaElement;

public class TabeleDAO {

    static final String SQL_ADD_TABLE = "INSERT INTO tabele (TBL_KOD,TBL_NAZIV,TBL_SLICICA,TBL_HIT_RATE) VALUES (?,?,null,0)";
    static final String SQL_SELECT_ALL = "SELECT * FROM tabele";
    static final String SQL_SELECT_TABLE = "SELECT * FROM tabele WHERE TBL_KOD = ?";
    static final String SQL_GET_PRIMARY_KEY = "SELECT GROUP_CONCAT(COLUMN_NAME) as 'Keys', TABLE_NAME"
            + " FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE"
            + " WHERE"
            + " TABLE_SCHEMA = ?"
            + " AND CONSTRAINT_NAME='PRIMARY' and TABLE_NAME = ?;";

    public static List<String> getPrimaryKeys(MetaModelSchemaElement element) {
        List<String> primaryKeys = new ArrayList<String>();
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_GET_PRIMARY_KEY);
            System.out.println("Schema: " + ConnectionPool.getConnectionPool().getDatabaseName());
            stmt.setString(1, ConnectionPool.getConnectionPool().getDatabaseName());
            //think about name and code
            stmt.setString(2, element.getName());
            ResultSet results = stmt.executeQuery();
            if (results.next()) {
                String keys = results.getString("Keys");
                System.out.println("Keys: " + keys);
                if (keys != null) {
                    String[] split = keys.trim().split(",");
                    for (String s : split) {
                        System.out.println("Found key: " + s);
                        primaryKeys.add(s);
                    }
                }
            }
            stmt.close();
            return primaryKeys;
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
            return primaryKeys;
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
    }

    public static boolean addTable(MetaModelSchemaElement element) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_ADD_TABLE);
            stmt.setString(1, element.getName());
            stmt.setString(2, element.getName());
            stmt.executeUpdate();
            stmt.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
            return false;
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
    }

    public static List<TabelaDTO> getAll() {
        List<TabelaDTO> tables = new ArrayList<TabelaDTO>();
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.createStatement();
            ResultSet results = stmt.executeQuery(SQL_SELECT_ALL);
            tables.addAll(getFromResultSet(results));
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return tables;
    }

    public static TabelaDTO getTable(String tableCode) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_SELECT_TABLE);
            stmt.setString(1, tableCode);
            ResultSet set = stmt.executeQuery();
            List<TabelaDTO> table = getFromResultSet(set);
            if (table.size() > 0) {
                return table.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return null;
    }

    private static List<TabelaDTO> getFromResultSet(ResultSet result) throws SQLException {
        List<TabelaDTO> tables = new ArrayList<TabelaDTO>();
        while (result.next()) {
            String code = result.getString("TBL_KOD");
            String label = result.getString("TBL_NAZIV");
            int hitRate = result.getInt("TBL_HIT_RATE");
            Blob picture = result.getBlob("TBL_SLICICA");
            tables.add(new TabelaDTO(code, label, picture, hitRate));
        }
        return tables;
    }

}

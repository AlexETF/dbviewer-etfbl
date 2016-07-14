package net.etfbl.dbviewer.database.mysql.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import net.etfbl.dbviewer.database.ConnectionPool;
import net.etfbl.dbviewer.database.mysql.dto.HijerarhijaTabelaDTO;


public class HijerarhijaTabelaDAO {

    static final String SQL_ADD_ENTRY = "INSERT INTO hijerarhija_tabela (TAB_TBL_KOD, TBL_KOD, HIJ_NIVOST, HIJ_PARPOZ, HIJ_CHRBR) VALUES (?,?,?,?,?)";
    static final String SQL_SELECT_AT_LEVEL = "SELECT * FROM hijerarhija_tabela WHERE HIJ_NIVOST = ?";
    static final String SQL_SELECT_FOR_TABLE_AT_LEVEL = "SELECT * FROM hijerarhija_tabela WHERE HIJ_NIVOST = ? AND TAB_TBL_KOD = ? ORDER BY HIJ_CHRBR ASC";
    
    static final String SQL_SELECT_ALL = "SELECT * FROM hijerarhija_tabela";
    static final String SQL_GET_MIN_LEVEL = "SELECT min(HIJ_NIVOST) FROM hijerarhija_tabela";
    static final String SQL_GET_MAX_LEVEL = "SELECT max(HIJ_NIVOST) FROM hijerarhija_tabela";
    
    public static boolean addEntry(String tblParent, String tblChild, int treeLevel, int parentPosition, int position) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_ADD_ENTRY);
            stmt.setString(1, tblParent);
            stmt.setString(2, tblChild);
            stmt.setInt(3, treeLevel);
            stmt.setInt(4, parentPosition);
            stmt.setInt(5, position);
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
    
    public static List<HijerarhijaTabelaDTO> getAllAtLevel(int treeLevel){
        List<HijerarhijaTabelaDTO> hijerarhija = new ArrayList<HijerarhijaTabelaDTO>();
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_SELECT_AT_LEVEL);
            stmt.setInt(1, treeLevel);
            ResultSet results = stmt.executeQuery();
            hijerarhija.addAll(getFromResultSet(results));
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return hijerarhija;
    }
    
    public static List<HijerarhijaTabelaDTO> getForTableAtLevel(String tableName, int treeLevel){
        List<HijerarhijaTabelaDTO> hijerarhija = new ArrayList<HijerarhijaTabelaDTO>();
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_SELECT_FOR_TABLE_AT_LEVEL);
            stmt.setInt(1, treeLevel);
            stmt.setString(2, tableName);
            ResultSet results = stmt.executeQuery();
            hijerarhija.addAll(getFromResultSet(results));
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return hijerarhija;
    }
    
    public static int getMaxTreeLevel(){
        List<HijerarhijaTabelaDTO> hijerarhija = new ArrayList<HijerarhijaTabelaDTO>();
        Connection conn = null;
        Statement stmt = null;
        int max = -1;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.createStatement();
            ResultSet results = stmt.executeQuery(SQL_GET_MAX_LEVEL);
            if(results.next()){
                max = results.getInt(1);
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return max;
    }
    
    public static int getMinTreeLevel(){
        List<HijerarhijaTabelaDTO> hijerarhija = new ArrayList<HijerarhijaTabelaDTO>();
        Connection conn = null;
        Statement stmt = null;
        int min = -1;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.createStatement();
            ResultSet results = stmt.executeQuery(SQL_GET_MIN_LEVEL);
            if(results.next()){
                min = results.getInt(1);
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return min;
    }
    
    public static List<HijerarhijaTabelaDTO> getAll(){
        List<HijerarhijaTabelaDTO> hijerarhija = new ArrayList<HijerarhijaTabelaDTO>();
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.createStatement();
            ResultSet results = stmt.executeQuery(SQL_SELECT_ALL);
            hijerarhija.addAll(getFromResultSet(results));
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return hijerarhija;
    }
    
    private static List<HijerarhijaTabelaDTO> getFromResultSet(ResultSet result) throws SQLException{
        List<HijerarhijaTabelaDTO> hijerarhija = new ArrayList<HijerarhijaTabelaDTO>();
        while(result.next()){
            String parent = result.getString("TAB_TBL_KOD");
            String child = result.getString("TBL_KOD");
            int treeLevel = result.getInt("HIJ_NIVOST");
            int parentPos = result.getInt("HIJ_PARPOZ");
            int childPos = result.getInt("HIJ_CHRBR");
            hijerarhija.add(new HijerarhijaTabelaDTO(parent, child, treeLevel, parentPos, childPos));
        }
        return hijerarhija;
    }
}

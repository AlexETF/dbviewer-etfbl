package net.etfbl.dbviewer.database.mysql.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.database.ConnectionPool;
import net.etfbl.dbviewer.database.mysql.dto.PoljeDTO;

public class PoljaDAO {

    static final String SQL_ADD_ATTRIBUTE = "INSERT INTO polja (TBL_KOD,POL_KOD,POL_LABELA) VALUES (?,?,?)";
    static final String SQL_SELECT_FOR_TABLE = "SELECT * FROM polja WHERE TBL_KOD = ?";
    
    public static boolean addAttribute(String tblCode, MetaModelSchemaAttribute attribute) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_ADD_ATTRIBUTE);
            stmt.setString(1, tblCode);
            stmt.setString(2, attribute.getName());
            stmt.setString(3, attribute.getName());
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

    public static List<PoljeDTO> getAllForTable(String tableCode){
        List<PoljeDTO> columns = new ArrayList<PoljeDTO>();
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.prepareStatement(SQL_SELECT_FOR_TABLE);
            stmt.setString(1, tableCode);
            ResultSet results = stmt.executeQuery();
            columns.addAll(getFromResultSet(results));
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return columns;
    }
    
    private static List<PoljeDTO> getFromResultSet(ResultSet result) throws SQLException{
        List<PoljeDTO> columns = new ArrayList<PoljeDTO>();
        while(result.next()){
            String tableCode = result.getString("TBL_KOD");
            String columnCode = result.getString("POL_KOD");
            String columnLabel = result.getString("POL_LABELA");
            columns.add(new PoljeDTO(tableCode, columnCode, columnLabel));
        }
        return columns;
    }
}

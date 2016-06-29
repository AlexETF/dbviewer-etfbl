package net.etfbl.dbviewer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import net.etfbl.dbviewer.database.ConnectionPool;

import net.etfbl.dbviewer.model.MetaModelSchemaElement;

public class TabeleDAO {
	static final String SQL_ADD_TABLE = "INSERT INTO tabele (TBL_KOD,TBL_NAZIV,TBL_SLICICA,TBL_HIT_RATE) VALUES (?,?,null,0)";
	
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
		} catch(Exception e) {
			e.printStackTrace(System.err); // LOG
			return false;
		} finally {
			ConnectionPool.getConnectionPool().checkIn(conn);
		}
	}
	
}

package net.etfbl.dbviewer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.database.ConnectionPool;

public class PoljaDAO {
	static final String SQL_ADD_ATTRIBUTE = "INSERT INTO polja (TBL_KOD,POL_KOD,POL_LABELA) VALUES (?,?,?)";
	
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
		} catch(Exception e) {
			e.printStackTrace(System.err); // LOG
			return false;
		} finally {
			ConnectionPool.getConnectionPool().checkIn(conn);
		}
	}
	
}

package net.etfbl.dbviewer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import net.etfbl.dbviewer.database.ConnectionPool;

public class HijerarhijaTabelaDAO {
	
    static final String SQL_ADD_ENTRY = "INSERT INTO hijerarhija_tabela (TAB_TBL_KOD,TBL_KOD,HIJ_NIVOST,HIJ_PARPOZ,HIJ_CHRBR) VALUES (?,?,?,?,?)";
	
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
		} catch(Exception e) {
			e.printStackTrace(System.err); // LOG
			return false;
		} finally {
			ConnectionPool.getConnectionPool().checkIn(conn);
		}
	}
}

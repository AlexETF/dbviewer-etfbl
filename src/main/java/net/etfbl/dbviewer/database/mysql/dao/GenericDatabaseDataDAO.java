/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.etfbl.dbviewer.database.ConnectionPool;
import net.etfbl.dbviewer.database.IDatabaseManager;
import net.etfbl.dbviewer.database.mysql.MySQLDatabaseManager;
import static net.etfbl.dbviewer.database.mysql.dao.HijerarhijaTabelaDAO.SQL_GET_MAX_LEVEL;
import net.etfbl.dbviewer.database.mysql.dto.GenericDatabaseColumnDTO;
import net.etfbl.dbviewer.database.mysql.dto.GenericDatabaseRowDTO;
import net.etfbl.dbviewer.database.mysql.dto.HijerarhijaTabelaDTO;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public class GenericDatabaseDataDAO {
    
    
    public static List<GenericDatabaseRowDTO> getData(MetaModelSchemaElement element){
        List<GenericDatabaseRowDTO> data = new ArrayList<GenericDatabaseRowDTO>();
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = ConnectionPool.getConnectionPool().checkOut();
            stmt = conn.createStatement();
            IDatabaseManager manager = new MySQLDatabaseManager();
            String query = manager.generateTableQuery(element, element.getAttributes());
            System.out.println("Generated query: " + query);
            ResultSet results = stmt.executeQuery(query);
            int count =  element.getAttributes().size();
            while(results.next()){
                GenericDatabaseRowDTO row = new GenericDatabaseRowDTO();
                for(int i = 0;i < count;i++){
                    String key = element.getAttributes().get(i).getName();
                    Object value = results.getObject(key);
                    if(value == null){
                        value = "NULL";
                    }
                    row.getRow().put(key, new GenericDatabaseColumnDTO(value));
                }
                data.add(row);
            }   
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(System.err); // LOG
        } finally {
            ConnectionPool.getConnectionPool().checkIn(conn);
        }
        return data;
    }
}

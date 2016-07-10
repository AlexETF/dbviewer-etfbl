/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql.dto;

import java.util.HashMap;

/**
 *
 * @author ZM
 */
public class GenericDatabaseRowDTO {
    
    private HashMap<String, GenericDatabaseColumnDTO> row;

    public HashMap<String, GenericDatabaseColumnDTO> getRow() {
        return row;
    }

    public void setRow(HashMap<String, GenericDatabaseColumnDTO> row) {
        this.row = row;
    }
    
    public GenericDatabaseRowDTO(){
        row = new HashMap<String, GenericDatabaseColumnDTO>();
    }
}

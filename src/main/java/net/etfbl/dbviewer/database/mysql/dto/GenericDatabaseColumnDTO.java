/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql.dto;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;

/**
 *
 * @author ZM
 */
public class GenericDatabaseColumnDTO {
    
    private Object data;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public GenericDatabaseColumnDTO(Object data) {
        this.data = data;
    }
    
    public SimpleStringProperty getString(){
        return new SimpleStringProperty(data.toString());
    }
      
}

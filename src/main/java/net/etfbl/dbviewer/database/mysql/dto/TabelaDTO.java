/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql.dto;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ZM
 */
public class TabelaDTO {
    
    private String code;
    private String label;
    private Blob picture;
    private int hitRate;
    private List<PoljeDTO> columns;
    
    public TabelaDTO(String code, String label, Blob picture, int hitRate) {
        this.code = code;
        this.label = label;
        this.picture = picture;
        this.hitRate = hitRate;
        this.columns = new ArrayList<PoljeDTO>();
    }
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Blob getPicture() {
        return picture;
    }

    public void setPicture(Blob picture) {
        this.picture = picture;
    }

    public int getHitRate() {
        return hitRate;
    }

    public void setHitRate(int hitRate) {
        this.hitRate = hitRate;
    }
    
    public List<PoljeDTO> getColumns() {
        return columns;
    }

    public void setColumns(List<PoljeDTO> columns) {
        this.columns = columns;
    }
}

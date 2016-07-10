/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql.dto;

/**
 *
 * @author ZM
 */
public class PoljeDTO {
    
    private String tabelaKod;
    private String poljeKod;
    private String poljeLabela;

    public PoljeDTO(String tabelaKod, String poljeKod, String poljeLabela) {
        this.tabelaKod = tabelaKod;
        this.poljeKod = poljeKod;
        this.poljeLabela = poljeLabela;
    }

    public String getTabelaKod() {
        return tabelaKod;
    }

    public void setTabelaKod(String tabelaKod) {
        this.tabelaKod = tabelaKod;
    }

    public String getPoljeKod() {
        return poljeKod;
    }

    public void setPoljeKod(String poljeKod) {
        this.poljeKod = poljeKod;
    }

    public String getPoljeLabela() {
        return poljeLabela;
    }

    public void setPoljeLabela(String poljeLabela) {
        this.poljeLabela = poljeLabela;
    }
    
    
}

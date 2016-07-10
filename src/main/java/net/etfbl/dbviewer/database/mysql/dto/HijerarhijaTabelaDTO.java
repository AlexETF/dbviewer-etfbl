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
public class HijerarhijaTabelaDTO {

    //TAB_TBL_KOD, TBL_KOD, HIJ_NIVOST, HIJ_PARPOZ, HIJ_CHRBR

    private String tabela;
    private String secTable;
    private int treeLevel;
    private int parentPos;
    private int childPos;

    public HijerarhijaTabelaDTO(String tabela, String secTable, int treeLevel, int parentPos, int childPos) {
        this.tabela = tabela;
        this.secTable = secTable;
        this.treeLevel = treeLevel;
        this.parentPos = parentPos;
        this.childPos = childPos;
    }

    public String getTabela() {
        return tabela;
    }

    public void setTabela(String tabela) {
        this.tabela = tabela;
    }

    public String getSecTable() {
        return secTable;
    }

    public void setSecTable(String secTable) {
        this.secTable = secTable;
    }

    public int getTreeLevel() {
        return treeLevel;
    }

    public void setTreeLevel(int treeLevel) {
        this.treeLevel = treeLevel;
    }

    public int getParentPos() {
        return parentPos;
    }

    public void setParentPos(int parentPos) {
        this.parentPos = parentPos;
    }

    public int getChildPos() {
        return childPos;
    }

    public void setChildPos(int childPos) {
        this.childPos = childPos;
    }
}

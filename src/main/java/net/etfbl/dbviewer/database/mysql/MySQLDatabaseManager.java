/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import net.etfbl.dbviewer.database.IDatabaseManager;
import net.etfbl.dbviewer.database.mysql.dao.HijerarhijaTabelaDAO;
import net.etfbl.dbviewer.database.mysql.dao.TabeleDAO;
import net.etfbl.dbviewer.database.mysql.dto.HijerarhijaTabelaDTO;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public class MySQLDatabaseManager implements IDatabaseManager {

    public String generateTableQuery(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> attributes) {
        StringBuilder builder = new StringBuilder();
        builder.append("SELECT " + attributes.get(0).getName());
        for (int i = 1; i < attributes.size(); i++) {
            builder.append(", " + attributes.get(i).getName());
        }
        builder.append(" FROM " + element.getName() + ";");
        return builder.toString();
    }

    public String generateParentChildReportQuery(MetaModelSchemaElement element, 
            List<MetaModelSchemaAttribute> attributes, 
            List<MetaModelSchemaAttribute> parentAttrs) {
        
        if (element.getParent() == null) {
            throw new IllegalArgumentException("Parent not found exception");
        }
        MetaModelSchemaElement parent = element.getParent();
        try {
            
            List<MetaModelSchemaAttribute> foreignKeys = new ArrayList<MetaModelSchemaAttribute>();
            List<String> keys = TabeleDAO.getPrimaryKeys(parent);
            for(String attr : keys){
                List<MetaModelSchemaAttribute> list = element.getAttributes().stream().filter(x -> x.getCode().equals(attr)).collect(Collectors.toList());
                foreignKeys.addAll(list);
            }
            if(foreignKeys.size() == 0){
                return null;
            }
            for(MetaModelSchemaAttribute attr: foreignKeys){
                System.out.println("***: " + attr.getCode());
            }
            StringBuilder builder = new StringBuilder();
            builder.append("SELECT ");
            for(MetaModelSchemaAttribute attr : parentAttrs){
                builder.append("p." + attr.getCode()+ ", ");
            }
            builder.append(" c." + attributes.get(0).getCode());
            for(int i = 1;i < attributes.size();i++){
                builder.append(", c." + attributes.get(i).getCode());
            }
            builder.append(" FROM " + element.getName() + " c INNER JOIN " + parent.getName() + " p ON");
            builder.append(" c." + foreignKeys.get(0).getCode() + " = p." + foreignKeys.get(0).getCode());
            for(int i = 1;i < foreignKeys.size();i++){
                 builder.append(" AND c." + foreignKeys.get(i).getCode() + " = p." + foreignKeys.get(i).getCode());
            }
            builder.append(";");
            System.out.println(builder.toString());
            return builder.toString();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public String generateHierarchialReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> attributes) {
        
        return null;
    }
    
    public List<HijerarhijaTabelaDTO> generateHierarcicalReportList(HijerarhijaTabelaDTO element){
        List<HijerarhijaTabelaDTO> list = new ArrayList<>();
        reqursionHierarchical(list, element);
        return list;
    }
    
    public void reqursionHierarchical(List<HijerarhijaTabelaDTO> list, HijerarhijaTabelaDTO hElement){
        list.add(hElement);
        for(HijerarhijaTabelaDTO element : HijerarhijaTabelaDAO.getChildren(hElement))
            reqursionHierarchical(list, element);
    }
}

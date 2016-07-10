/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database.mysql;

import java.util.List;
import net.etfbl.dbviewer.database.IDatabaseManager;
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
        for(int i = 1;i < attributes.size();i++){
            builder.append(", " + attributes.get(i).getName());
        }
        builder.append(" FROM " + element.getName() + ";");
        return builder.toString();
    }
    
    public String generateParentChildReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> attributes) {
        StringBuilder builder = new StringBuilder();
        builder.append("SELECT " + attributes.get(0).getName());
        for(int i = 1;i < attributes.size();i++){
            builder.append(", " + attributes.get(i).getName());
        }
        builder.append(" FROM " + element.getName() + ";");
        return builder.toString();
    }
}

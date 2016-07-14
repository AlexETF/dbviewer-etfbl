/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.database;

import java.util.List;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public interface IDatabaseManager {
    
    String generateTableQuery(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> attributes);
    String generateParentChildReportQuery(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> attributes, List<MetaModelSchemaAttribute> parentAttributes);
    String generateHierarchialReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> attributes);
}

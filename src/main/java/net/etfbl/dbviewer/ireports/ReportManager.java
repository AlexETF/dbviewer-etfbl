/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.ireports;

import java.util.List;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public interface ReportManager {
    void generateTableReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> columns);
    void generateParentChildReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> columns);
    void generateHierarchialReport(MetaModelSchemaElement element);
}

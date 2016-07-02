/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.controller.gui;

import javafx.scene.control.CheckBox;
import javafx.scene.control.TableColumn;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;

/**
 *
 * @author ZM
 */
public class MetaModelAttributeTableColumn extends TableColumn {
    
    private MetaModelSchemaAttribute attribute;
    private CheckBox selectedForReport;
    
    public MetaModelAttributeTableColumn(MetaModelSchemaAttribute attribute){
        super(attribute.getName());
        setGraphic((selectedForReport = new CheckBox()));
        setMinWidth(attribute.getName().length() * 16);
        this.attribute = attribute;   
        this.selectedForReport.setSelected(true);
    }
    
    public MetaModelSchemaAttribute getAttribute(){
        return attribute;
    }
    
    public boolean isSelectedForReport(){
        return selectedForReport.isSelected();
    }
}

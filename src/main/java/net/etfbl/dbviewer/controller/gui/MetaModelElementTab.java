/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.controller.gui;

import java.util.ArrayList;
import java.util.List;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Tab;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.BorderPane;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public class MetaModelElementTab extends Tab {
    
    private MetaModelSchemaElement element;
    private TableView<MetaModelSchemaAttribute> attributes;
    
    public MetaModelElementTab(MetaModelSchemaElement element){
        this.element = element;
        InitTab();
    }
    
    private void InitTab(){
        setText(element.getName());
        BorderPane pane = new BorderPane();
        attributes = new TableView<MetaModelSchemaAttribute>();
        for(MetaModelSchemaAttribute attr : element.getAttributes()){
            TableColumn column = new MetaModelAttributeTableColumn(attr);
            attributes.getColumns().add(column);
        }
        pane.setPadding(new Insets(10, 10, 10, 10));
        pane.setCenter(attributes);
        setClosable(true);
        setContent(pane);
    }

    public MetaModelSchemaElement getElement() {
        return element;
    }
    
    public List<MetaModelAttributeTableColumn> getCheckedColumns(){
        List<MetaModelAttributeTableColumn> checkedColumns = new ArrayList<MetaModelAttributeTableColumn>();
        for(TableColumn column : attributes.getColumns()){
            MetaModelAttributeTableColumn attributeColumn = (MetaModelAttributeTableColumn)column;
            if(attributeColumn.isSelectedForReport()){
                checkedColumns.add(attributeColumn);
            }
        }
        return checkedColumns;
    }
    
}

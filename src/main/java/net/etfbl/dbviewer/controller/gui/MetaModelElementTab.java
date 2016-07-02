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
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Tab;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
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
        HBox header = new HBox();
        Button btnAddRow = new Button("Add");
        Button btnDeleteRow = new Button("Delete");
        Button btnEditRow = new Button("Edit");
        btnAddRow.setMinWidth(75);
        btnDeleteRow.setMinWidth(75);
        btnEditRow.setMinWidth(75);
        header.getChildren().add(btnAddRow);
        header.getChildren().add(btnDeleteRow);
        header.getChildren().add(btnEditRow);
        header.setPadding(new Insets(5, 0, 5, 0));
        header.setSpacing(5);
        pane.setBottom(header);
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

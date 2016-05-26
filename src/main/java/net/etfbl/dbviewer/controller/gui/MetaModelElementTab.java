/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.controller.gui;

import javafx.geometry.Insets;
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
    
    MetaModelSchemaElement element;
    TableView attributes;
    
    public MetaModelElementTab(MetaModelSchemaElement element){
        this.element = element;
        InitTab();
    }
    
    private void InitTab(){
        setText(element.getName());
        BorderPane pane = new BorderPane();
        attributes = new TableView();
        for(MetaModelSchemaAttribute attr : element.getAttributes()){
            attributes.getColumns().add(new TableColumn(attr.getName()));
        }
        pane.setPadding(new Insets(10, 10, 10, 10));
        pane.setCenter(attributes);
        setClosable(true);
        setContent(pane);
    }

    public MetaModelSchemaElement getElement() {
        return element;
    }
    
    
}

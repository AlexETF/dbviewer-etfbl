/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.controller.gui;

import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public class MetaModelTabPaneController {

    private TabPane pane;

    public MetaModelTabPaneController(TabPane pane) {
        this.pane = pane;
    }

    public void setFocusForElement(MetaModelSchemaElement element) {
        MetaModelElementTab metaTab = getTabForElement(element);
        if (metaTab == null) {
            metaTab = new MetaModelElementTab(element);
        }
        if (!pane.getTabs().contains(metaTab)){
            pane.getTabs().add(metaTab);
        }
        pane.getSelectionModel().select(metaTab);
    }

    public boolean contains(MetaModelSchemaElement element) {
        for (Tab tab : pane.getTabs()) {
            if (((MetaModelElementTab) tab).getElement().equals(element)) {
                return true;
            }
        }
        return false;
    }

    public MetaModelElementTab getTabForElement(MetaModelSchemaElement element) {
        for (Tab tab : pane.getTabs()) {
            MetaModelElementTab metaTab = (MetaModelElementTab) tab;
            if (metaTab.getElement().equals(element)) {
                return metaTab;
            }
        }
        return null;
    }

    public void setSubElementTabs(MetaModelSchemaElement value) {
        pane.getTabs().clear();
        for(MetaModelSchemaElement element : value.getChildren()){
             pane.getTabs().add(new MetaModelElementTab(element));
        }
    }
    
    public MetaModelElementTab getFocusedTab(){
        return (MetaModelElementTab)pane.getSelectionModel().getSelectedItem();
    }

}

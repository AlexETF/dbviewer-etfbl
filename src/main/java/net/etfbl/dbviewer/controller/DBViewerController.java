/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TabPane;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeView;
import net.etfbl.dbviewer.bridge.DisplayMetaModelData;
import net.etfbl.dbviewer.model.MetaModelSchema;

/**
 *
 * @author ZM
 */
public class DBViewerController implements Initializable, DisplayMetaModelData {
    
    @FXML
    private TabPane tabPaneChildElements;

    @FXML
    private TabPane tabPaneRootElements;

    @FXML
    private TreeView<String> treeSchemeElements;

    @FXML
    private Label lblStatus;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        fillTree(10, 5);
    }    
    
    //For demonstration purposes
    private void fillTree(int subRootElements, int numLeaves){
        TreeItem<String> root = new TreeItem<String>("Root element");
        for(int i = 0;i < subRootElements;i++){
            TreeItem<String> child = new TreeItem<String>("Leaf " + (i + 1));
            for(int j = 0;j < numLeaves;j++){
                child.getChildren().add(new TreeItem<String>("Leaf " + (j + 1)));
            }
            root.getChildren().add(child);
        }
        root.setExpanded(true);
        treeSchemeElements.setRoot(root);
    }

    @Override
    public void displayElements(MetaModelSchema schema) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

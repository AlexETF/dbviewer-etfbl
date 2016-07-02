/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.controller;


import java.io.File;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TreeCell;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javafx.util.Callback;
import net.etfbl.dbviewer.ibridge.DisplayMetaModelData;
import net.etfbl.dbviewer.ibridge.ParseMetaModelStream;
import net.etfbl.dbviewer.controller.gui.MetaModelAttributeTableColumn;
import net.etfbl.dbviewer.controller.gui.MetaModelElementTab;
import net.etfbl.dbviewer.controller.gui.MetaModelTabPaneController;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;
import net.etfbl.dbviewer.parser.XSDSchemaParser;

public class DBViewerController implements Initializable, DisplayMetaModelData {

    @FXML
    private TabPane tabPaneChildElements;

    @FXML
    private Button btnGenerateParentReport;

    @FXML
    private Button btnGenerateChildReport;

    @FXML
    private TabPane tabPaneRootElements;

    @FXML
    private Button btnMoveUp;

    @FXML
    private TreeView<MetaModelSchemaElement> treeSchemeElements;

    @FXML
    private Button btnEditChildRow;

    @FXML
    private Label lblStatus;

    @FXML
    private Button btnLoadXsd;

    @FXML
    private Button btnAddParentRow;

    @FXML
    private Button btnGenerateSchemaReport;

    @FXML
    private Button btnEditParentRow;

    @FXML
    private Button btnMoveDown;

    @FXML
    private Button btnDeleteChildRow;

    @FXML
    private Button btnDeleteParentRow;

    @FXML
    private Button btnAddChildRow;

    /*
     Non FXML Fields
     */
    private ParseMetaModelStream parser;
    private MetaModelTabPaneController parentTabs;
    private MetaModelTabPaneController childrenTabs;

    @FXML
    void btnMoveDownPressed(ActionEvent event) {
        moveParentTabToChildTab();
    }

    @FXML
    void btnMoveUpPressed(ActionEvent event) {
        moveChildTabToParentTab();
    }

    @FXML
    void btnLoadXsdPressed(ActionEvent event) {
        openXsdFile();
    }
    
    @FXML
    void btnGenerateSchemaReportClicked(ActionEvent event) {
        generateHierarchialReport();
    }

    @FXML
    void btnGenerateParentReportClicked(ActionEvent event) {
        generateParentReport();
    }

    @FXML
    void btnEditParentRowClicked(ActionEvent event) {

    }

    @FXML
    void btnDeleteParentRowClicked(ActionEvent event) {

    }

    @FXML
    void btnAddParentRowClicked(ActionEvent event) {

    }

    @FXML
    void btnGenerateChildReportClicked(ActionEvent event) {
        generateParentChildReport();
    }

    @FXML
    void btnEditChildRowClicked(ActionEvent event) {

    }

    @FXML
    void btnDeleteChildRowClicked(ActionEvent event) {

    }

    @FXML
    void btnAddChildRowClicked(ActionEvent event) {

    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        parser = new XSDSchemaParser(this);
        //define tree cell facory for meta model elements
        treeSchemeElements.setCellFactory(new Callback<TreeView<MetaModelSchemaElement>, TreeCell<MetaModelSchemaElement>>() {
            @Override
            public TreeCell<MetaModelSchemaElement> call(TreeView<MetaModelSchemaElement> treeView) {
                return new TreeCell<MetaModelSchemaElement>() {
                    @Override
                    protected void updateItem(final MetaModelSchemaElement element, boolean empty) {
                        super.updateItem(element, empty);
                        if (!empty && element != null) {
                            setText(element.getName());
                            //setGraphic(iconView);
                        } else {
                            setText(null);
                            setGraphic(null);
                        }
                    }
                };
            }
        });
        treeSchemeElements.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                treeSchemaElementClicked(event);
            }
        });
        tabPaneRootElements.getSelectionModel().selectedIndexProperty().addListener(new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> ov, Number t, Number t1) {
                Platform.runLater(new Runnable() {

                    @Override
                    public void run() {
                        parentTabGotFocus();
                    }
                });

            }
        });
        parentTabs = new MetaModelTabPaneController(tabPaneRootElements);
        childrenTabs = new MetaModelTabPaneController(tabPaneChildElements);
        //setting images on buttons
        Image imageAdd = new Image(getClass().getResourceAsStream("/images/add.png"));
        Image imageEdit = new Image(getClass().getResourceAsStream("/images/edit.png")); 
        Image imageDelete = new Image(getClass().getResourceAsStream("/images/delete.png"));
        Image imageReport = new Image(getClass().getResourceAsStream("/images/report.png"));
        Image imageMoveUp = new Image(getClass().getResourceAsStream("/images/moveup.png"));
        Image imageMoveDown = new Image(getClass().getResourceAsStream("/images/movedown.png"));
        Image imageLoadXsd = new Image(getClass().getResourceAsStream("/images/open.png"));
        btnAddParentRow.setGraphic(new ImageView(imageAdd));
        btnAddChildRow.setGraphic(new ImageView(imageAdd));
        btnEditParentRow.setGraphic(new ImageView(imageEdit));
        btnEditChildRow.setGraphic(new ImageView(imageEdit));
        btnDeleteParentRow.setGraphic(new ImageView(imageDelete));
        btnDeleteChildRow.setGraphic(new ImageView(imageDelete));
        btnGenerateParentReport.setGraphic(new ImageView(imageReport));
        btnGenerateChildReport.setGraphic(new ImageView(imageReport));
        btnGenerateSchemaReport.setGraphic(new ImageView(imageReport));
        btnLoadXsd.setGraphic(new ImageView(imageLoadXsd));
        btnMoveUp.setGraphic(new ImageView(imageMoveUp));
        btnMoveDown.setGraphic(new ImageView(imageMoveDown));
    }

    @Override
    public void displayElements(final MetaModelSchemaElement schema) {
        Platform.runLater(new Runnable() {
            public void run() {
                tabPaneRootElements.getTabs().clear();
                tabPaneChildElements.getTabs().clear();
                TreeItem<MetaModelSchemaElement> root = getRootElement(schema);
                root.setExpanded(true);
                treeSchemeElements.setRoot(root);
            }
        });
    }
    
    @Override
    public void displayErrorMessage(String message) {
        lblStatus.setText(message);
    }

    private TreeItem<MetaModelSchemaElement> getRootElement(MetaModelSchemaElement schema) {
        TreeItem<MetaModelSchemaElement> root = new TreeItem<MetaModelSchemaElement>(schema);
        for (MetaModelSchemaElement element : schema.getChildren()) {
            TreeItem<MetaModelSchemaElement> subElement = getRootElement(element);
            root.getChildren().add(subElement);
        }
        return root;
    }

    private void openXsdFile() {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Open XSD File");
        File file = fileChooser.showOpenDialog(new Stage());
        if (file != null) {
            parser.parse(file.getAbsolutePath());
        }
    }

    private void treeSchemaElementClicked(MouseEvent event) {
        if (event.getClickCount() == 2) {
            TreeItem<MetaModelSchemaElement> selected = treeSchemeElements.getSelectionModel().getSelectedItem();
            if (selected != null) {
                MetaModelSchemaElement value = selected.getValue();
                parentTabs.setFocusForElement(value);
                childrenTabs.setSubElementTabs(value);
                lblStatus.setText(selected.getValue().getName());
            }
        }
    }

    private void parentTabGotFocus() {
        Tab tab = tabPaneRootElements.getSelectionModel().getSelectedItem();
        if (tab != null) {
            MetaModelElementTab metaTab = (MetaModelElementTab) tab;
            MetaModelSchemaElement value = metaTab.getElement();
            childrenTabs.setSubElementTabs(value);
            lblStatus.setText(value.getName());
        }
    }

    private void moveParentTabToChildTab() {
        Tab tab = tabPaneRootElements.getSelectionModel().getSelectedItem();
        if (tab != null) {
            MetaModelElementTab metaTab = (MetaModelElementTab) tab;
            tabPaneRootElements.getTabs().remove(metaTab);
            tabPaneChildElements.getTabs().clear();
            MetaModelSchemaElement parent = metaTab.getElement().getParent();
            if(parent != null){
                parentTabs.setFocusForElement(parent);
            }else {
                tabPaneRootElements.getTabs().clear();
            }
            childrenTabs.setFocusForElement(metaTab.getElement());
        }
    }

    private void moveChildTabToParentTab() {
        Tab tab = tabPaneChildElements.getSelectionModel().getSelectedItem();
        if(tab != null) {
            MetaModelElementTab metaTab = (MetaModelElementTab) tab;
            parentTabs.setFocusForElement(metaTab.getElement());
        }
    }

    private void generateParentReport() {
        MetaModelElementTab tab = parentTabs.getFocusedTab();
        if(tab != null){
            List<MetaModelAttributeTableColumn> columns = tab.getCheckedColumns();
            lblStatus.setText("Number of selected columns: " + columns.size());
        }else {
            lblStatus.setText("Tab not selected");
        }
    }

    private void generateHierarchialReport() {
        TreeItem<MetaModelSchemaElement> item = treeSchemeElements.getSelectionModel().getSelectedItem();
        if(item != null){
            //lblStatus.setText("Selected ");
        }else {
            lblStatus.setText("Meta model element not selected");
        }
    }

    private void generateParentChildReport() {
        MetaModelElementTab tab = childrenTabs.getFocusedTab();
        if(tab != null){
            List<MetaModelAttributeTableColumn> columns = tab.getCheckedColumns();
            lblStatus.setText("Number of selected columns: " + columns.size());
        }else {
            lblStatus.setText("Tab not selected");
        }
    }
}

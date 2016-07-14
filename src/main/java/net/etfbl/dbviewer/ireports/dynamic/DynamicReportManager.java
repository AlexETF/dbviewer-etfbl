/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.ireports.dynamic;

import java.awt.Color;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import net.etfbl.dbviewer.database.ConnectionPool;
import net.etfbl.dbviewer.database.IDatabaseManager;
import net.etfbl.dbviewer.database.mysql.dao.HijerarhijaTabelaDAO;
import net.etfbl.dbviewer.database.mysql.dao.PoljaDAO;
import net.etfbl.dbviewer.database.mysql.dao.TabeleDAO;
import net.etfbl.dbviewer.database.mysql.dto.HijerarhijaTabelaDTO;
import net.etfbl.dbviewer.database.mysql.dto.PoljeDTO;
import net.etfbl.dbviewer.database.mysql.dto.TabelaDTO;
import net.etfbl.dbviewer.ireports.ReportManager;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.builder.column.Columns;
import net.sf.dynamicreports.report.builder.column.TextColumnBuilder;
import net.sf.dynamicreports.report.builder.datatype.DataTypes;
import net.sf.dynamicreports.report.builder.style.StyleBuilder;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import net.sf.dynamicreports.report.constant.VerticalAlignment;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;

/**
 *
 * @author ZM
 *
 * Class that uses Dynamic Report Java API
 */


public class DynamicReportManager implements ReportManager {

    private static StyleBuilder[] ColumnStyles;

    static {
        StyleBuilder boldStyle = DynamicReports.stl.style().bold();
        StyleBuilder boldStyleRed = DynamicReports.stl.style().bold().setForegroundColor(Color.RED);
        StyleBuilder boldStyleGreen = DynamicReports.stl.style().bold().setForegroundColor(Color.BLUE);
        StyleBuilder boldStyleOrange = DynamicReports.stl.style().bold().setForegroundColor(Color.ORANGE);
        ColumnStyles = new StyleBuilder[]{ boldStyle, boldStyleGreen, boldStyleRed, boldStyleOrange };
    }

    private IDatabaseManager databaseManager;

    public DynamicReportManager(IDatabaseManager manager) {
        databaseManager = manager;
    }

    public void generateTableReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> columns) {
        String query = databaseManager.generateTableQuery(element, columns);
        Connection connection = null;
        try {
            connection = ConnectionPool.getConnectionPool().checkOut();
            JasperReportBuilder report = DynamicReports.report();

            for (int i = 0; i < columns.size(); i++) {
                TextColumnBuilder<String> column
                        = Columns.column(columns.get(i).getName(), columns.get(i).getCode(), DataTypes.stringType());
                column.setStyle(ColumnStyles[i % ColumnStyles.length]);
                
                report.addColumn(column);
            }
            report.setDataSource(query, connection);
            report.show(false);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            ConnectionPool.getConnectionPool().checkIn(connection);
        }
    }

    public void generateParentChildReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> columns,  List<MetaModelSchemaAttribute> parentColumns) {
        String query = databaseManager.generateParentChildReportQuery(element, columns, parentColumns);
        Connection connection = null;
        try {
            if(query == null){
                throw new IllegalArgumentException("Query is null");
            }
            connection = ConnectionPool.getConnectionPool().checkOut();
            JasperReportBuilder report = DynamicReports.report();
            
            for (int i = 0; i < parentColumns.size(); i++) {
                TextColumnBuilder<String> column
                        = Columns.column("Parent " + parentColumns.get(i).getName(), parentColumns.get(i).getCode(), DataTypes.stringType());
                column.setStyle(ColumnStyles[i % ColumnStyles.length]);
                
                report.addColumn(column);
            }
            
            for (int i = 0; i < columns.size(); i++) {
                TextColumnBuilder<String> column
                        = Columns.column(columns.get(i).getName(), columns.get(i).getCode(), DataTypes.stringType());
                column.setStyle(ColumnStyles[i % ColumnStyles.length]);
                
                report.addColumn(column);
            }
            report.setDataSource(query, connection);
            report.show(false);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            ConnectionPool.getConnectionPool().checkIn(connection);
        }
    }

    //public void generateHierarchialReport(MetaModelSchemaElement element) {
    public void generateHierarchialReport() {
        int minimumLevel = HijerarhijaTabelaDAO.getMinTreeLevel();
        int maximumLevel = HijerarhijaTabelaDAO.getMaxTreeLevel();
        if (minimumLevel == -1 || maximumLevel == -1 || minimumLevel > maximumLevel) {
            //displayStatusMessage("Error: Minimum or maximum level not correct");
            System.out.println("Error: Minimum or maximum level not correct");
            return;
        }
        List<HijerarhijaTabelaDTO> root = HijerarhijaTabelaDAO.getAllAtLevel(minimumLevel);
        if (root.size() > 1) {
            //displayStatusMessage("Error: There are more than 1 root element");
            System.out.println("Error: There are more than 1 root element");
            return;
        }
        //MetaModelSchemaElement rootElement = constructRootElement(root.get(0));
        
        //List<HijerarhijaTabelaDTO> listOfAllElements = HijerarhijaTabelaDAO.getAll();
        HijerarhijaTabelaDTO parent = root.get(0);
        List<HijerarhijaTabelaDTO> treeList = databaseManager.generateHierarcicalReportList(parent);
//        for(HijerarhijaTabelaDTO el : treeList)
//            System.out.println("te:" + el.toString());
        
        
        Connection connection = null;
        try {
            if(treeList == null){
                throw new IllegalArgumentException("List is null");
            }
            connection = ConnectionPool.getConnectionPool().checkOut();
            JasperReportBuilder report = DynamicReports.report();
            
            report.addColumn(Columns.column("HIJ_NIVOST", DataTypes.stringType()));
            report.addColumn(Columns.column("HIJ_PARPOZ", DataTypes.stringType()));
            report.addColumn(Columns.column("TAB_TBL_KOD", DataTypes.stringType()));
            report.addColumn(Columns.column("HIJ_CHRBR", DataTypes.stringType()));
            report.addColumn(Columns.column("TBL_KOD", DataTypes.stringType()));

            ReportSourceFromList rsflSource = new ReportSourceFromList(treeList);
            report.setDataSource(rsflSource);
            report.show(false);
            
            

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            ConnectionPool.getConnectionPool().checkIn(connection);
        }
        
        
    }
    
   
     private MetaModelSchemaElement convertToMetaElement(HijerarhijaTabelaDTO hdto) {
        MetaModelSchemaElement element = new MetaModelSchemaElement();
        TabelaDTO table = TabeleDAO.getTable(hdto.getSecTable());
        List<PoljeDTO> fields = PoljaDAO.getAllForTable(table.getCode());
        table.setColumns(fields);
        element.setName(table.getLabel());
        element.setCode(table.getCode());
        for (PoljeDTO field : fields) {
            MetaModelSchemaAttribute attribute = new MetaModelSchemaAttribute();
            attribute.setName(field.getPoljeLabela());
            attribute.setCode(field.getPoljeKod());
            element.getAttributes().add(attribute);
        }
        return element;
    }

    private MetaModelSchemaElement constructRootElement(HijerarhijaTabelaDTO hdto) {
        MetaModelSchemaElement root = convertToMetaElement(hdto);
        List<HijerarhijaTabelaDTO> children = HijerarhijaTabelaDAO.getForTableAtLevel(hdto.getSecTable(), hdto.getTreeLevel() + 1);
        for (HijerarhijaTabelaDTO child : children) {
            MetaModelSchemaElement element = constructRootElement(child);
            element.setParent(root);
            root.getChildren().add(element);
        }
        return root;
    }
    
}

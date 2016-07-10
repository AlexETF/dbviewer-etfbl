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

    public void generateParentChildReport(MetaModelSchemaElement element, List<MetaModelSchemaAttribute> columns) {
        
    }

    public void generateHierarchialReport(MetaModelSchemaElement element) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

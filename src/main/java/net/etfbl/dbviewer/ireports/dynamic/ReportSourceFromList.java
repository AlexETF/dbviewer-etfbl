package net.etfbl.dbviewer.ireports.dynamic;

import java.util.List;
import net.etfbl.dbviewer.database.mysql.dto.HijerarhijaTabelaDTO;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 *
 * @author ognjen
 */
public class ReportSourceFromList implements JRDataSource{
    List<HijerarhijaTabelaDTO> list = null;
    int index = -1;
    
    public ReportSourceFromList(List<HijerarhijaTabelaDTO> list){
        this.list = list;
    }

    public ReportSourceFromList(){}
    
    @Override
    public boolean next() throws JRException {
        index++;
        return (index < list.size());
    }

    @Override
    public Object getFieldValue(JRField jrf) throws JRException {
        String value = null;
        String field = jrf.getName();

        if (field.equals("HIJ_NIVOST"))
            value = new Integer(((HijerarhijaTabelaDTO)list.get(index)).getTreeLevel()).toString();
        else if (field.equals("HIJ_PARPOZ"))
            value = new Integer(((HijerarhijaTabelaDTO)list.get(index)).getParentPos()).toString();
        else if (field.equals("TAB_TBL_KOD"))
            value = ((HijerarhijaTabelaDTO)list.get(index)).getTabela();
        else if (field.equals("HIJ_CHRBR"))
            value = new Integer(((HijerarhijaTabelaDTO)list.get(index)).getChildPos()).toString();
        else if (field.equals("TBL_KOD"))
            value = ((HijerarhijaTabelaDTO)list.get(index)).getSecTable();

        return value;
    }
    

}

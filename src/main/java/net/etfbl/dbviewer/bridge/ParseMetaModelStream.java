/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.bridge;

import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;
import org.xml.sax.SAXException;

/**
 *
 * @author ZM
 */
public interface ParseMetaModelStream {
    
   boolean parse(String url);
   
}

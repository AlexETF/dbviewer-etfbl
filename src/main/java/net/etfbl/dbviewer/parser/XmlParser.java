/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.parser;

import net.etfbl.dbviewer.bridge.DisplayMetaModelData;
import net.etfbl.dbviewer.bridge.ParseMetaModelStream;

/**
 *
 * @author ZM
 */
public class XmlParser implements ParseMetaModelStream {

    private DisplayMetaModelData visualizer;

    public XmlParser(DisplayMetaModelData visualizer){
        this.visualizer = visualizer;
    }
    
    @Override
    public boolean parse(String url) {
        //TO DO - Odraditi parsiranje iz xml fajla
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

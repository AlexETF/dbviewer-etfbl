/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.etfbl.dbviewer.code_generator;

import net.etfbl.dbviewer.model.MetaModelSchemaElement;

/**
 *
 * @author ZM
 */
public interface CodeGenerator {
    
    boolean generateCode(String folderPath, MetaModelSchemaElement schema);
}

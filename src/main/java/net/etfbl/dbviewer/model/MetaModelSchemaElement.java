package net.etfbl.dbviewer.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.xerces.xs.XSElementDeclaration;

public class MetaModelSchemaElement {

    private String name;
    private String code;
    private String type;
    private int minOcurrs;
    private int maxOcurrs;
    private boolean maxOcurrsUnbounded;
    private XSElementDeclaration xsDeclaration;
    private String defaultValue;

    private MetaModelSchemaElement parent;
    private List<MetaModelSchemaAttribute> attributes = new ArrayList<MetaModelSchemaAttribute>();
    private List<MetaModelSchemaElement> children = new ArrayList<MetaModelSchemaElement>();

    public MetaModelSchemaElement() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getMinOcurrs() {
        return minOcurrs;
    }

    public void setMinOcurrs(int minOcurrs) {
        this.minOcurrs = minOcurrs;
    }

    public int getMaxOcurrs() {
        return maxOcurrs;
    }

    public void setMaxOcurrs(int maxOcurrs) {
        this.maxOcurrs = maxOcurrs;
    }

    public boolean isMaxOcurrsUnbounded() {
        return maxOcurrsUnbounded;
    }

    public void setMaxOcurrsUnbounded(boolean maxOcurrsUnbounded) {
        this.maxOcurrsUnbounded = maxOcurrsUnbounded;
    }

    public XSElementDeclaration getXsDeclaration() {
        return xsDeclaration;
    }

    public void setXsDeclaration(XSElementDeclaration xsDeclaration) {
        this.xsDeclaration = xsDeclaration;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public MetaModelSchemaElement getParent() {
        return parent;
    }

    public void setParent(MetaModelSchemaElement parent) {
        this.parent = parent;
    }

    public List<MetaModelSchemaAttribute> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<MetaModelSchemaAttribute> attributes) {
        this.attributes = attributes;
    }

    public List<MetaModelSchemaElement> getChildren() {
        return children;
    }

    public void setChildren(List<MetaModelSchemaElement> children) {
        this.children = children;
    }

    public void addChild(MetaModelSchemaElement child) {
        this.children.add(child);
    }

    public void addAttribute(MetaModelSchemaAttribute attribute) {
        attributes.add(attribute);
    }

}

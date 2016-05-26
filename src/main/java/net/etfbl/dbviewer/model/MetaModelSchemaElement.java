package net.etfbl.dbviewer.model;

import org.apache.xerces.xs.XSElementDeclaration;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MetaModelSchemaElement {

	private String name;
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

    @Override
    public int hashCode() {
        int hash = 3;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final MetaModelSchemaElement other = (MetaModelSchemaElement) obj;
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.type, other.type)) {
            return false;
        }
        return true;
    }

	public void addAttribute(MetaModelSchemaAttribute attribute) {
		attributes.add(attribute);
	}
        
        @Override
        public String toString(){
            return name;
        }

}

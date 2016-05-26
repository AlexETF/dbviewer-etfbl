package net.etfbl.dbviewer.model;

import java.util.ArrayList;
import java.util.List;

public class MetaModelSchemaAttribute {

	private String name;
	private boolean required;
	private String type;
	private String defaultValue;
	private List<String> options = new ArrayList<String>();

	public MetaModelSchemaAttribute() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public List<String> getOptions() {
		return options;
	}

	public void setOptions(List<String> options) {
		this.options = options;
	}
        
        @Override
        public String toString(){
            return name;
        }

}
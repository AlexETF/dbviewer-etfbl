package net.etfbl.dbviewer.model;

import java.util.ArrayList;

public class TreeElement {

    private String codeName;
    private ArrayList<String> parents = null;
    private ArrayList<TreeElement> children = null;

    public TreeElement() {
        parents = new ArrayList<String>();
        children = new ArrayList<TreeElement>();
    }

    public TreeElement(String codeName) {
        this.parents = new ArrayList<String>();
        this.children = new ArrayList<TreeElement>();
        this.codeName = codeName;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public ArrayList<String> getParents() {
        return parents;
    }

    public void setParents(ArrayList<String> parents) {
        this.parents = parents;
    }

    public ArrayList<TreeElement> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<TreeElement> children) {
        this.children = children;
    }

    public void addChild(TreeElement child) {
        children.add(child);
    }

    public void addParentName(String parentName) {
        parents.add(parentName);
    }

}

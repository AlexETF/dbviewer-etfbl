package net.etfbl.dbviewer.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import net.etfbl.dbviewer.bridge.DisplayMetaModelData;
import net.etfbl.dbviewer.bridge.ParseMetaModelStream;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;
import org.apache.commons.lang3.StringUtils;
import org.apache.xerces.dom.DOMInputImpl;
import org.apache.xerces.impl.dv.xs.XSSimpleTypeDecl;
import org.apache.xerces.impl.xs.XSAttributeDecl;
import org.apache.xerces.impl.xs.XSAttributeUseImpl;
import org.apache.xerces.impl.xs.XSComplexTypeDecl;
import org.apache.xerces.xs.XSElementDeclaration;
import org.apache.xerces.xs.XSImplementation;
import org.apache.xerces.xs.XSLoader;
import org.apache.xerces.xs.XSModel;
import org.apache.xerces.xs.XSValue;
import org.apache.xerces.xs.XSModelGroup;
import org.apache.xerces.xs.XSObjectList;
import org.apache.xerces.xs.XSParticle;
import org.apache.xerces.xs.XSSimpleTypeDefinition;
import org.apache.xerces.xs.XSTerm;
import org.apache.xerces.xs.datatypes.ObjectList;
import org.w3c.dom.DOMConfiguration;
import org.w3c.dom.DOMError;
import org.w3c.dom.DOMErrorHandler;
import org.w3c.dom.Document;
import org.w3c.dom.bootstrap.DOMImplementationRegistry;
import org.w3c.dom.ls.LSInput;
import org.xml.sax.SAXException;

public class XSDSchemaParser implements DOMErrorHandler, ParseMetaModelStream {

    DisplayMetaModelData visualizer;
    
    public XSDSchemaParser(DisplayMetaModelData visualizer){
        this.visualizer = visualizer;
    }
    
    @Override
    public boolean parse(String url) {
        try{
            MetaModelSchemaElement model = parseXSDSchema(url);
            if(model == null){
                return false;
            }
            visualizer.displayElements(model);
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    public MetaModelSchemaElement parseXSDSchema(String filePath) throws IOException, ClassNotFoundException,
            InstantiationException, IllegalAccessException, ClassCastException, ParserConfigurationException, SAXException {
        MetaModelSchemaElement mainElement = null;

        DOMImplementationRegistry registry = DOMImplementationRegistry
                .newInstance();

        XSImplementation impl = (XSImplementation) registry
                .getDOMImplementation("XS-Loader");

        XSLoader schemaLoader = impl.createXSLoader(null);

        DOMConfiguration config = schemaLoader.getConfig();

        config.setParameter("error-handler", this);
        config.setParameter("validate", Boolean.TRUE);
        
        LSInput input = new DOMInputImpl();
        
        InputStream inputStream = new FileInputStream(filePath);
        input.setByteStream(inputStream);
        XSModel model = schemaLoader.load(input);
        String rootElement = getRootElementName(filePath);

        if (model != null) {
            XSElementDeclaration element = model.getElementDeclaration(
                    rootElement, null);
            mainElement = new MetaModelSchemaElement();
            mainElement.setName(rootElement);
            mainElement.setXsDeclaration(element);
            processElement(mainElement, rootElement);
        }
        return mainElement;
    }

    private String getRootElementName(String filePath) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory
                .newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
        Document doc = docBuilder.parse(new File(filePath));

        doc.getDocumentElement().normalize();

        return doc.getDocumentElement().getChildNodes().item(1).getAttributes().getNamedItem("name").getNodeValue();
    }

    private void processElement(
            MetaModelSchemaElement metaModelSchemaElement, String rootElement) {
        elements(metaModelSchemaElement, rootElement);
        attributes(metaModelSchemaElement);
        List<MetaModelSchemaElement> children = metaModelSchemaElement
                .getChildren();
        if (children != null && children.size() > 0) {
            for (MetaModelSchemaElement child : children) {
                processElement(child, rootElement);
            }
        }
    }

    private void elements(MetaModelSchemaElement metaModelSchemaElement,
            String rootElement) {
        XSElementDeclaration element = metaModelSchemaElement
                .getXsDeclaration();

        if (element.getTypeDefinition() instanceof XSSimpleTypeDefinition) {
            XSSimpleTypeDefinition simple = (XSSimpleTypeDefinition) element
                    .getTypeDefinition();
            metaModelSchemaElement.setType(simple.getName());
            XSValue xsValue = element.getValueConstraintValue();
            if (xsValue != null
                    && !StringUtils.isBlank(xsValue.getNormalizedValue())) {
                metaModelSchemaElement.setDefaultValue(xsValue
                        .getNormalizedValue());
            } else {
                metaModelSchemaElement.setDefaultValue("");
            }
            return;
        } else if (element.getTypeDefinition() instanceof XSComplexTypeDecl) {
            XSComplexTypeDecl definition = (XSComplexTypeDecl) element
                    .getTypeDefinition();
            XSParticle particle = definition.getParticle();
            if (particle != null) {
                XSTerm term = particle.getTerm();
                if (term instanceof XSModelGroup) {
                    XSModelGroup xsModelGroup = (XSModelGroup) term;
                    XSObjectList xsol = xsModelGroup.getParticles();
                    for (Object p : xsol) {
                        XSParticle part = (XSParticle) p;
                        XSTerm pterm = part.getTerm();
                        if (pterm instanceof XSElementDeclaration) {
                            String name = pterm.getName();
                            MetaModelSchemaElement child = new MetaModelSchemaElement();
                            child.setName(name);
                            child.setParent(metaModelSchemaElement);
                            child.setXsDeclaration((XSElementDeclaration) pterm);
                            child.setMinOcurrs(part.getMinOccurs());
                            child.setMaxOcurrs(part.getMaxOccurs());
                            child.setMaxOcurrsUnbounded(part
                                    .getMaxOccursUnbounded());
                            metaModelSchemaElement.addChild(child);
                        }
                    }
                }
            }
        }
    }

    private void attributes(MetaModelSchemaElement MetaModelSchemaElement) {
        XSElementDeclaration element = MetaModelSchemaElement
                .getXsDeclaration();
        if (element.getTypeDefinition() instanceof XSComplexTypeDecl) {
            XSComplexTypeDecl definition = (XSComplexTypeDecl) element
                    .getTypeDefinition();
            if (definition == null) {
                return;
            }
            XSObjectList xsol = definition.getAttributeUses();
            if (xsol != null && xsol.getLength() > 0) {
                attributes:
                for (int j = 0; j < xsol.getLength(); j++) {
                    XSAttributeUseImpl attr = (XSAttributeUseImpl) xsol.item(j);
                    XSValue xsValue = attr.getValueConstraintValue();
                    XSAttributeDecl decl = (XSAttributeDecl) attr
                            .getAttrDeclaration();
                    if (decl == null) {
                        continue attributes;
                    }
                    MetaModelSchemaAttribute attribute = new MetaModelSchemaAttribute();
                    MetaModelSchemaElement.addAttribute(attribute);
                    attribute.setName(decl.getName());
                    attribute.setRequired(attr.getRequired());
                    if (xsValue != null
                            && !StringUtils.isBlank(xsValue
                                    .getNormalizedValue())) {
                        attribute.setDefaultValue(xsValue.getNormalizedValue());
                    } else {
                        attribute.setDefaultValue("");
                    }
                    XSSimpleTypeDefinition type = decl.getTypeDefinition();
                    String typeName = type == null ? "" : type.getName();
                    attribute.setType(typeName);
                    if (type instanceof XSSimpleTypeDecl) {
                        ObjectList list = ((XSSimpleTypeDecl) type)
                                .getActualEnumeration();
                        if (list != null && list.getLength() > 0) {
                            for (int k = 0; k < list.getLength(); k++) {
                                attribute.getOptions()
                                        .add((String) list.get(k));
                            }
                            if (attribute.isRequired()) {
                                attribute.setDefaultValue(attribute
                                        .getOptions().get(0));
                            }
                        }
                    }
                }
            }
        }
    }

    @Override
    public boolean handleError(DOMError error) {
        short severity = error.getSeverity();
        if (severity == DOMError.SEVERITY_ERROR) {
            System.out.println("[xs-error]: " + error.getMessage());
        }

        if (severity == DOMError.SEVERITY_WARNING) {
            System.out.println("[xs-warning]: " + error.getMessage());
        }
        return true;
    }

}

package net.etfbl.dbviewer.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import net.etfbl.dbviewer.bridge.DisplayMetaModelData;
import net.etfbl.dbviewer.bridge.ParseMetaModelStream;

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
import org.apache.xerces.xs.XSModelGroup;
import org.apache.xerces.xs.XSObjectList;
import org.apache.xerces.xs.XSParticle;
import org.apache.xerces.xs.XSSimpleTypeDefinition;
import org.apache.xerces.xs.XSTerm;
import org.apache.xerces.xs.XSValue;
import org.apache.xerces.xs.datatypes.ObjectList;
import org.w3c.dom.DOMConfiguration;
import org.w3c.dom.DOMError;
import org.w3c.dom.DOMErrorHandler;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.bootstrap.DOMImplementationRegistry;
import org.w3c.dom.ls.LSInput;
import org.xml.sax.SAXException;

import net.etfbl.dbviewer.dao.HijerarhijaTabelaDAO;
import net.etfbl.dbviewer.model.MetaModelSchemaAttribute;
import net.etfbl.dbviewer.model.MetaModelSchemaElement;
import net.etfbl.dbviewer.model.TreeElement;

public class XSDSchemaParser implements ParseMetaModelStream, DOMErrorHandler {
    
	static int numberCharacterParse = 3;
	
        private DisplayMetaModelData _visualizer;
        
        public XSDSchemaParser(DisplayMetaModelData visualizer){
            _visualizer = visualizer;
        }
        
        @Override
        public boolean parse(String url){
            try{
                MetaModelSchemaElement element = parseXSDSchema(url);
                if(element != null){
                    _visualizer.displayElements(element);
                }
                return true;
            }catch(Exception ex){
                _visualizer.displayErrorMessage("Failed to parse file on path " + url);
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

		DOMErrorHandler errorHandler = this;

		config.setParameter("error-handler", errorHandler);

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
			if (definition == null)
				return;
			XSObjectList xsol = definition.getAttributeUses();
			if (xsol != null && xsol.getLength() > 0) {
				attributes: for (int j = 0; j < xsol.getLength(); j++) {
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
	
	public void parseRelations(String filePath, ArrayList<TreeElement> elements) throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory
				.newInstance();
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		Document doc = docBuilder.parse(new File(filePath));

		doc.getDocumentElement().normalize();

		System.out.println("Root element je "
				+ doc.getDocumentElement().getNodeName());

		NodeList listOfElements = doc.getElementsByTagName("xs:unique");
		int totalElements = listOfElements.getLength();
		System.out.println("Ukupan broj elemenata je : " + totalElements);

		for (int s = 0; s < listOfElements.getLength(); s++) {

			Node firstElementNode = listOfElements.item(s);
			if (firstElementNode.getNodeType() == Node.ELEMENT_NODE) {
				//System.out.println("Prvi nod elementa je : " + firstElementNode);

				String name = firstElementNode.getAttributes().getNamedItem("name").toString().split("\"")[1];
				
				if(name.endsWith("_PK")) {
					String parent = "";
					System.out.println("\nPrvi nod elementa atribut je : " + name);
					NodeList childs = firstElementNode.getChildNodes();
					String tableCode = "";
					for (int m = 0; m < childs.getLength(); m++)
						if(childs.item(m).getNodeName().equals("xs:field")) {
							String key = childs.item(m).getAttributes().getNamedItem("xpath").toString().split("\"")[1];
							System.out.println("FIELD >>>  " + key);
							
							if(!key.split("_")[0].equals(tableCode.split("_")[0])) {
								
								for (TreeElement treeElement : elements)
									if(treeElement.getCodeName().split("_")[0].equals(key.split("_")[0]))
										parent = treeElement.getCodeName();
								
								if(!parent.equals(""))
									for (TreeElement treeElement : elements)
										if(treeElement.getCodeName().split("_")[0].equals(tableCode.split("_")[0]) && !treeElement.getParents().contains(parent))
											treeElement.addParentName(parent);
							
							}
						} else if(childs.item(m).getNodeName().equals("xs:selector")) {
							tableCode = childs.item(m).getAttributes().getNamedItem("xpath").toString().split("\"")[1];
							System.out.println("SELEKTOR >>>  " + tableCode);
							
						} else
							continue;
				}
				else
					continue;
			}
		}
		
		TreeElement rootElement = elements.get(0);
		elements.remove(0);
		
		// Krece 3. faza
		for (TreeElement treeElement : elements) {
			if(treeElement.getParents().size() == 0)
				rootElement.addChild(treeElement);
			else if(treeElement.getParents().size() > 0) {
				int k = 0;
				do {	
					for (TreeElement parentObj : elements)
						if(parentObj.getCodeName().equals(treeElement.getParents().get(k)))
							parentObj.addChild(treeElement);
				} while (k++ < (treeElement.getParents().size() - 1));
			}
		}
		
		setPositions(rootElement, rootElement, 0, 0, 1);
		
	}
	
	public void setPositions(TreeElement parent, TreeElement child, int treeLevel, int parentPosition, int position) {
				
		HijerarhijaTabelaDAO.addEntry(parent.getCodeName(), child.getCodeName(), treeLevel, parentPosition, position);
		
		if (child.getChildren().size() > 0)
			for (int i = 0; i < child.getChildren().size(); i++)
				setPositions(child, child.getChildren().get(i), treeLevel + 1, position, i + 1);

	}	
	
}

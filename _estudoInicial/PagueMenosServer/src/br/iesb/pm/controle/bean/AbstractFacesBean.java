package br.iesb.pm.controle.bean;

import java.io.Serializable;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.primefaces.context.RequestContext;

public abstract class AbstractFacesBean implements Serializable {
	private static final long serialVersionUID = 6400040451173522912L;

	protected final String CAMINHO_INDEX_SEGURO = "/restrito/index.faces";
	
	protected final String TITULO_MENSAGEM_ERRO = "Erro";
	protected final String TITULO_MENSAGEM_FATAL = "Erro Catastrófico";
	protected final String TITULO_MENSAGEM_WARN = "Alerta!";
	protected final String TITULO_MENSAGEM_INFO = "Atenção!";
	
	protected <T> T recuperarBean(String beanName, Class<T> type) {
	    try {
	    	FacesContext facesContext = FacesContext.getCurrentInstance();
	    	return (T) facesContext.getApplication().evaluateExpressionGet(facesContext, "#"+"{"+beanName+"}", type);
	    }catch(Exception e) {
	    	System.err.println(e.getMessage());
	    	return null;
	    }
	}
	
	public String getServerURL() {
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		
		String scheme = request.getScheme();
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
		
		return scheme+"://"+serverName+":"+serverPort+contextPath;
	}
	
	protected void executarComando(String comando) {
		RequestContext.getCurrentInstance().execute(comando);
	}
	
	protected void responseComplete() {
		FacesContext.getCurrentInstance().responseComplete();
	}
	
	protected void exibirMensagem(Severity severity, String titulo, String mensagem) {
		FacesContext fc = FacesContext.getCurrentInstance();
		fc.addMessage(null, new FacesMessage(severity, titulo, mensagem));
	}
	protected void exibirMensagem(Severity severity, String titulo, String mensagem, String idMessages) {
		FacesContext fc = FacesContext.getCurrentInstance();
		fc.addMessage(idMessages, new FacesMessage(severity, titulo, mensagem));
	}
	protected void atualizarComponente(String nome) {
		RequestContext.getCurrentInstance().update(nome);
	}
	protected HttpServletRequest getRequest() {
		ExternalContext ec = getExternalContext();
		HttpServletRequest request = (HttpServletRequest) ec.getRequest();
		return request;
	}
	
	protected HttpServletResponse getResponse() {
		ExternalContext ec = getExternalContext();
		HttpServletResponse response = (HttpServletResponse) ec.getResponse();
		return response;
	}
	
	protected RequestDispatcher getRequestDispatcher(String dispatch) {
		ExternalContext ec = getExternalContext();
		HttpServletRequest request = (HttpServletRequest) ec.getRequest();
		return request.getRequestDispatcher(dispatch);
		
	}
	
	protected Object getSessionAttribute(String attributeName) {
		try {
			ExternalContext ec = getExternalContext();
			if (ec != null) {
				Map<String, Object> attrMap = ec.getSessionMap();
				if (attrMap != null) {
					return attrMap.get(attributeName);
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	protected void removeSessionAttribute(String attributeName) {
		try {
			ExternalContext ec = getExternalContext();
			if (ec != null) {
				Map<String, Object> attrMap = ec.getSessionMap();
				if (attrMap != null) {
					attrMap.remove(attributeName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void setSessionAttribute(String attributeName, Object attributeValue) {
		try {
			ExternalContext ec = getExternalContext();
			if (ec != null) {
				Map<String, Object> attrMap = ec.getSessionMap();
				if (attrMap != null) {
					attrMap.put(attributeName, attributeValue);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected ExternalContext getExternalContext() {
		try {
			FacesContext facesContext = FacesContext.getCurrentInstance();
			if (facesContext == null) {
				return null;
			} else {
				return facesContext.getExternalContext();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

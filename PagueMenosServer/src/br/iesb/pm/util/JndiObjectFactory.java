package br.iesb.pm.util;

import javax.naming.InitialContext;
import javax.naming.NamingException;

public class JndiObjectFactory {

	private static JndiObjectFactory instance;
	
	private JndiObjectFactory() {
		super();
	}
	
	public static JndiObjectFactory getInstance() {
		if (instance == null) {
			instance = new JndiObjectFactory();
		}
		return instance;
	}
	
	
	public Object getObjectByName(String jndiName) {
		try {
			return InitialContext.doLookup(jndiName);
		}catch(NamingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}

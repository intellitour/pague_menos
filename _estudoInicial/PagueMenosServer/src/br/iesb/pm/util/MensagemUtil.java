package br.iesb.pm.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.MessageFormat;
import java.util.Properties;

public class MensagemUtil {
	private static MensagemUtil instance;
	
	private Properties arq;
	
	private MensagemUtil() throws IOException {
		super();
		arq = new Properties();
		URL resource = MensagemUtil.class.getResource("/mensagens.properties");
		arq.load(new InputStreamReader(resource.openStream(), "UTF8"));
	}
	
	public static MensagemUtil getInstance() {
		if (instance == null) {
			try {
				instance = new MensagemUtil();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return instance;
	}
	
	public String getMensgem(String key) {
		return arq.getProperty(key);
	}
	
	public String getMensagem(String key, Object... param) {
		String temp = arq.getProperty(key);
		MessageFormat formatter = new MessageFormat(temp);
		return formatter.format(param);
	}

}

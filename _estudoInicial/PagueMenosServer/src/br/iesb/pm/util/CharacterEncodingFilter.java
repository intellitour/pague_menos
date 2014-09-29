package br.iesb.pm.util;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
	private Logger log;
	private String encoding;
	private boolean forceEncoding = false;

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public void setForceEncoding(boolean forceEncoding) {
		this.forceEncoding = forceEncoding;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (this.encoding != null && (this.forceEncoding || request.getCharacterEncoding() == null)) {
			request.setCharacterEncoding(this.encoding);
			if (this.forceEncoding) {
				response.setCharacterEncoding(this.encoding);
				log.log(Level.FINE, "Codificação realizada.");
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log = Logger.getLogger("CharacterEncodingFilter");
		if (filterConfig != null) {
			encoding = filterConfig.getInitParameter("encoding");
			forceEncoding = Boolean.valueOf(filterConfig.getInitParameter("forceEncoding"));
			log.log(Level.INFO, "CharacterEncodingFilter inicializado com sucesso: [ encoding: "+encoding+" ] e [ forceEncoding: "+forceEncoding+" ].");
			return;
		}
		log.log(Level.SEVERE, "filterConfig está nulo! Não foi possível fazer a inicialização correta do CharacterEncodingFilter.");
	}
	
	@Override
	public void destroy() {
		
	}
	
}

package br.iesb.pm.servico.exception;

import javax.ws.rs.core.Response.Status;

import br.iesb.pm.util.MensagemUtil;


public class ServiceException extends Exception {
	private static final long serialVersionUID = 8090662995362936471L;
	
	private Status status;

	public ServiceException(String codMensagem, Throwable causa) {
		super(MensagemUtil.getInstance().getMensgem(codMensagem), causa);
	}

	public ServiceException(String codMensagem) {
		super(MensagemUtil.getInstance().getMensgem(codMensagem));
	}

	public ServiceException(Throwable causa) {
		super(causa);
	}
	public ServiceException(String codMensagem, Throwable causa, Status status) {
		super(MensagemUtil.getInstance().getMensgem(codMensagem), causa);
		this.status = status;
	}
	
	public ServiceException(String codMensagem, Status status) {
		super(MensagemUtil.getInstance().getMensgem(codMensagem));
		this.status = status;
	}
	
	public ServiceException(Throwable causa, Status status) {
		super(causa);
		this.status = status;
	}

	public Status getStatus() {
		return status;
	}
	
}

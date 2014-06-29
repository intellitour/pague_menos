package br.iesb.pm.modelo.exception;

import javax.ejb.ApplicationException;

import br.iesb.pm.util.MensagemUtil;

@ApplicationException(rollback=true)
public class BusinessException extends Exception {
	private static final long serialVersionUID = -8505955595162607541L;

	public BusinessException(String codMensagem, Throwable causa) {
		super(MensagemUtil.getInstance().getMensgem(codMensagem), causa);
	}
	public BusinessException(String codMensagem, Throwable causa, Object...param) {
		super(MensagemUtil.getInstance().getMensagem(codMensagem, param), causa);
	}

	public BusinessException(String codMensagem) {
		super(MensagemUtil.getInstance().getMensgem(codMensagem));
	}
	public BusinessException(Throwable causa) {
		super(causa);
	}

	
}

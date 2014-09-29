package br.iesb.pm.controle.bean.impl;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.iesb.pm.controle.bean.Teste;
import br.iesb.pm.persistencia.vo.TesteVO;
import br.iesb.pm.servico.ServicoTeste;
import br.iesb.pm.servico.exception.ServiceException;

@ManagedBean
@ViewScoped
public class TesteBean extends Teste {

	@EJB
	private ServicoTeste servicoTeste;
	
	
	public void incluir() {
		try {
			servicoTeste.incluirTeste(testeVO.getNoTeste());
			testeVO = new TesteVO();
		}catch(ServiceException e) {
			exibirMensagem(FacesMessage.SEVERITY_ERROR, TITULO_MENSAGEM_ERRO, e.getMessage());
		}
	}
	
	public void listar() {
		try {
			colTesteVO = servicoTeste.listar();
		}catch(ServiceException e) {
			exibirMensagem(FacesMessage.SEVERITY_ERROR, TITULO_MENSAGEM_ERRO, e.getMessage());
		}
	}
	
	
}




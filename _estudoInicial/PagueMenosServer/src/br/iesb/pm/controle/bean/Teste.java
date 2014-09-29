package br.iesb.pm.controle.bean;

import java.util.List;

import javax.annotation.PostConstruct;

import br.iesb.pm.persistencia.vo.TesteVO;

public abstract class Teste extends AbstractFacesBean {
	private static final long serialVersionUID = 1L;

	protected TesteVO testeVO;
	protected List<TesteVO> colTesteVO;
	
	@PostConstruct
	protected void init() {
		this.testeVO = new TesteVO();
	}
	

	public TesteVO getTesteVO() {
		return testeVO;
	}
	public void setTesteVO(TesteVO testeVO) {
		this.testeVO = testeVO;
	}
	public List<TesteVO> getColTesteVO() {
		return colTesteVO;
	}
	public void setColTesteVO(List<TesteVO> colTesteVO) {
		this.colTesteVO = colTesteVO;
	}
}

package br.iesb.pm.modelo;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.PersistenceException;

import br.iesb.pm.modelo.exception.BusinessException;
import br.iesb.pm.persistencia.dao.GenericDAO;
import br.iesb.pm.persistencia.vo.TesteVO;
import br.iesb.pm.util.Msg;

@Stateless
@LocalBean
public class TesteBOS {

	@EJB
	private GenericDAO genericDAO;
	
	
	public List<TesteVO> recuperarTodos() throws BusinessException {
		try {
			return (List<TesteVO>) genericDAO.recuperarTodos(TesteVO.class, "noTeste");
		}catch(PersistenceException e) {
			throw new BusinessException(Msg.ERRO_RECUPERAR_TODOS, e);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
	public void incluir(TesteVO testeVO) throws BusinessException {
		try {
			genericDAO.doInsert(testeVO);
		}catch(PersistenceException e) {
			throw new BusinessException(Msg.ERRO_INCLUIR, e);
		}
	}
}

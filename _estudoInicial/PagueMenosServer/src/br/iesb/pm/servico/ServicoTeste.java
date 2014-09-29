package br.iesb.pm.servico;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response.Status;

import org.apache.commons.lang3.StringUtils;

import br.iesb.pm.modelo.TesteBOS;
import br.iesb.pm.modelo.exception.BusinessException;
import br.iesb.pm.persistencia.vo.TesteVO;
import br.iesb.pm.servico.exception.ServiceException;
import br.iesb.pm.util.MensagemUtil;
import br.iesb.pm.util.Msg;

@Stateless
@Path("/Teste")
public class ServicoTeste {

	@EJB
	private TesteBOS testeBOS;
	
	@GET
	@Path("/incluir/{param}")
	@Produces(MediaType.APPLICATION_JSON)
	public void incluirTeste(@PathParam("param") String teste) throws ServiceException {
		try {
			if (StringUtils.isEmpty(teste.trim())) {
				throw new ServiceException(new NullPointerException(MensagemUtil.getInstance().getMensgem(Msg.ST_FALTA_PARAM_INCLUIR_TESTE)), Status.BAD_REQUEST);
			}
			TesteVO testeVO = new TesteVO();
			testeVO.setNoTeste(teste);
			testeBOS.incluir(testeVO);
		}catch(BusinessException e) {
			throw new ServiceException(Msg.ST_ERRO_INCLUIR_TESTE, e, Status.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GET
	@Path("/listar")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TesteVO> listar() throws ServiceException {
		try {
			return testeBOS.recuperarTodos();
		}catch(BusinessException e) {
			throw new ServiceException(Msg.ST_ERRO_LISTAR_TESTE, e, Status.INTERNAL_SERVER_ERROR);
		}
	}
}

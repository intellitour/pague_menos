package br.iesb.pm.servico.exception;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

@Provider
public class ServiceExceptionHandler implements ExceptionMapper<ServiceException> {

	@Override
	public Response toResponse(ServiceException e) {
		Response response = Response.status(e.getStatus()!=null?e.getStatus():Status.INTERNAL_SERVER_ERROR)
				.type(MediaType.APPLICATION_JSON)
				.entity(e.getMessage()).build();
		return response;
	}

}

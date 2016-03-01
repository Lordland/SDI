package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExitoAccion implements Accion{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		if(request.getParameter("IdViaje") != null)
			request.setAttribute("IdViaje",request.getParameter("IdViaje"));
		return "EXITO";
	}

}

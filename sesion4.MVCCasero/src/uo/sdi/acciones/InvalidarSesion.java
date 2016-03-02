package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InvalidarSesion implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		request.getSession().invalidate();
		return "EXITO";
	}

}

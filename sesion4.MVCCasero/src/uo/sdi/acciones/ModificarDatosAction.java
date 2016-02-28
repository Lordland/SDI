package uo.sdi.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.UserDao;
import alb.util.log.Log;

public class ModificarDatosAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		String nLogin=request.getParameter("login");
		String nName=request.getParameter("name");
		String nSurname=request.getParameter("surname");
		String nEmail=request.getParameter("email");
		String nPassword=request.getParameter("password");
		String pass2=request.getParameter("password2");
		HttpSession session=request.getSession();
		User usuario=((User)session.getAttribute("user"));
		if(!nLogin.isEmpty() || !nLogin.contains(" ")){
			usuario.setLogin(nLogin);
		}
		if(!nName.isEmpty() && !nName.contains(" ")){
			usuario.setName(nName);
		}
		if(!nSurname.isEmpty() && !nSurname.contains(" ")){
			usuario.setSurname(nSurname);
		}
		if(!nEmail.isEmpty() && !nEmail.contains(" ")){
			usuario.setEmail(nEmail);
		}
		try {
			if(!nPassword.isEmpty() && !nLogin.contains(" ") && nPassword.equals(pass2)){
				usuario.setPassword(nPassword);
			}else{
				return "FRACASO";
			}
			UserDao dao = PersistenceFactory.newUserDao();
			dao.update(usuario);
			Log.debug("Modificado usuario [%s] ", usuario.getLogin());
		}
		catch (Exception e) {
			Log.error("Algo ha ocurrido actualizando el email de [%s]", usuario.getLogin());
		}
		return "EXITO";
	}
	
	@Override
	public String toString() {
		return getClass().getName();
	}
	
}

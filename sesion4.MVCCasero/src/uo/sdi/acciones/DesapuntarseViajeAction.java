package uo.sdi.acciones;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.Seat;
import uo.sdi.model.SeatStatus;
import uo.sdi.model.Trip;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.SeatDao;
import uo.sdi.persistence.TripDao;
import alb.util.log.Log;

public class DesapuntarseViajeAction implements Accion{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		TripDao dao = PersistenceFactory.newTripDao();
		Trip viaje = dao.findById(Long.valueOf( request.getParameter("ID")));
		try {
		User usuario = (User) request.getSession().getAttribute("user");
		SeatDao daoS = PersistenceFactory.newSeatDao();
		Long[] ids = new Long[2];
		ids[0] = usuario.getId();
		ids[1] = viaje.getId();
		daoS.delete(ids);
		ArrayList<Trip> lista = (ArrayList<Trip>) request.getSession().getAttribute("listaApuntado");
		for(Trip t : lista){
			if(t.getId().equals(viaje.getId())){
				lista.remove(t);
			}
		}
		request.getSession().setAttribute("listaApuntado", lista);
		Log.debug("Eliminada la plaza para el viaje [%s] por el usuario [%s]",viaje.getId(), usuario.getLogin());
		}
		catch(Exception e){
			Log.error("Algo ha ocurrido eliminando la plaza para el viaje [%s]",viaje.getId());
		}
		return "EXITO";
	}

}

package uo.sdi.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.Trip;
import uo.sdi.model.TripStatus;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.TripDao;

public class CancelarViajeAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		TripDao dao = PersistenceFactory.newTripDao();
		Trip viaje = dao.findById(Long.parseLong(request.getParameter("IdViaje")));
		Trip viajeABorrar = null;
		viaje.setStatus(TripStatus.CANCELLED);
		dao.update(viaje);
		List<Trip> lista = (List<Trip>) request.getSession().getAttribute("listaPromotor");
		for(Trip t : lista){
			if(t.getId().equals(viaje.getId())){
				viajeABorrar = t;
			}
		}
		lista.remove(viajeABorrar);
		lista.add(viaje);
		request.getSession().setAttribute("listaPromotor",lista);
		return "EXITO";
	}

}

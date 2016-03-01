package uo.sdi.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.ListaApuntados;
import uo.sdi.model.ListaApuntados.PeticionEstado;
import uo.sdi.model.Seat;
import uo.sdi.model.SeatStatus;
import uo.sdi.model.Trip;
import uo.sdi.model.TripStatus;
import uo.sdi.model.User;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.SeatDao;
import uo.sdi.persistence.TripDao;
import uo.sdi.persistence.UserDao;

public class CancelarPeticionAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		UserDao dao = PersistenceFactory.newUserDao();
		User u = dao.findById(Long.parseLong(request.getParameter("IdUsuarioCancelar")));
		TripDao daoViaje = PersistenceFactory.newTripDao();
		Trip v = daoViaje.findById(Long.parseLong(request.getParameter("IdViajeCancelar")));
		PeticionEstado estado = PeticionEstado.valueOf(request.getParameter("estado"));
		Long[] ids = new Long[2];
		ids[0] = u.getId();
		ids[1] = v.getId();
		Seat asiento = null;
		if(estado.equals(PeticionEstado.ACCEPTED)){
			asiento = PersistenceFactory.newSeatDao().findById(ids);
			asiento.setStatus(SeatStatus.EXCLUDED);
			v.setAvailablePax(v.getAvailablePax()+1);
			PersistenceFactory.newSeatDao().update(asiento);
			daoViaje.update(v);
		}
		
		List<ListaApuntados> lista = (List<ListaApuntados>) request.getSession().getAttribute("listaApuntadoPromotor");
		for(ListaApuntados t : lista){
			if(t.getUsuario().getId().equals(u.getId()) && t.getViaje().getId().equals(v.getId())){
				t.setAsiento(asiento);
				t.setViaje(v);
				t.setRelacionViaje();
			}
		}
		List<Trip> l = (List<Trip>) request.getSession().getAttribute("listaViajes");
		for(Trip t : l){
			if(t.getId().equals(v.getId())){
				t.setAvailablePax(v.getAvailablePax());
			}
		}
		List<ListaApuntados> l2 = (List<ListaApuntados>) request.getSession().getAttribute("listaPromotor");
		for(ListaApuntados t : l2){
			if(t.getUsuario().getId().equals(u.getId()) && t.getViaje().getId().equals(v.getId())){
				t.setViaje(v);
			}
		}
		request.getSession().setAttribute("listaPromotor",l2);
		request.getSession().setAttribute("listaApuntadoPromotor",lista);
		return "EXITO";
	}

}

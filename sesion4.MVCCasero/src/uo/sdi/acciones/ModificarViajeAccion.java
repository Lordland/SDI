package uo.sdi.acciones;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.AddressPoint;
import uo.sdi.model.Trip;
import uo.sdi.model.TripStatus;
import uo.sdi.model.User;
import uo.sdi.model.UserStatus;
import uo.sdi.model.Waypoint;
import uo.sdi.persistence.PersistenceFactory;
import uo.sdi.persistence.TripDao;
import uo.sdi.persistence.UserDao;
import alb.util.log.Log;

public class ModificarViajeAccion implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		TripDao dao = PersistenceFactory.newTripDao();
		Long id = (Long) request.getSession().getAttribute("IdViaje");
		Trip dto = dao.findById(Long.parseLong(request.getParameter("IdViaje")));
		String DSalida = request.getParameter("DSalida");
		String CSalida = request.getParameter("CSalida");
		String ESalida = request.getParameter("ESalida");
		String PSalida = request.getParameter("PSalida");
		String ZSalida = request.getParameter("ZSalida");
		double LaSalida = Double.parseDouble(request.getParameter("LaSalida"));
		double LoSalida = Double.parseDouble(request.getParameter("LoSalida"));
		Waypoint salidaW = new Waypoint(LaSalida, LoSalida);
		AddressPoint salida = new AddressPoint(DSalida, CSalida, ESalida, PSalida, ZSalida, salidaW);
		dto.setDeparture(salida);
		String DDestino = request.getParameter("DDestino");
		String CDestino = request.getParameter("CDestino");
		String EDestino = request.getParameter("EDestino");
		String PDestino = request.getParameter("PDestino");
		String ZDestino = request.getParameter("ZDestino");
		Double LaDestino = Double.parseDouble(request.getParameter("LaDestino"));
		Double LoDestino = Double.parseDouble(request.getParameter("LoDestino"));
		Waypoint llegadaW = new Waypoint(LaDestino, LoDestino);
		AddressPoint destino = new AddressPoint(DDestino, CDestino, EDestino, PDestino, ZDestino, llegadaW);
		dto.setDestination(destino);
		Timestamp FLlegada = Timestamp.valueOf(request.getParameter("FLlegada").replace("T", " ").concat(":00"));
		dto.setArrivalDate(FLlegada);
		Timestamp FSalida = Timestamp.valueOf(request.getParameter("FSalida").replace("T", " ").concat(":00"));
		dto.setDepartureDate(FSalida);
		Timestamp FLimite = Timestamp.valueOf(request.getParameter("FLimite").replace("T", " ").concat(":00"));
		dto.setClosingDate(FLimite);
		int PMaximas = Integer.parseInt(request.getParameter("PMaximas"));
		dto.setAvailablePax(PMaximas);
		dto.setMaxPax(PMaximas);
		Double Coste = Double.parseDouble(request.getParameter("Coste"));
		dto.setEstimatedCost(Coste);
		String Comentarios = request.getParameter("Comentarios");
		dto.setComments(Comentarios);
		dto.setStatus(TripStatus.OPEN);
		User u = (User) request.getSession().getAttribute("user");
		dto.setPromoterId(u.getId());
		try {
				dao.update(dto);
				Log.debug("Modificado el viaje [%s]",
						dto.getId());
		} catch (Exception e) {
			Log.error("Algo ha ocurrido creando el viaje [%s]",
					dto.getId());
		}
		return "EXITO";
	}

}

package uo.sdi.acciones;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uo.sdi.model.Trip;
import uo.sdi.persistence.PersistenceFactory;
import alb.util.log.Log;

public class ListarViajesAction implements Accion {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		List<Trip> viajes;

		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Map<String, String[]> mapa = request.getParameterMap();
			Date date;
			Trip viaje;
			String filtro = mapa.get("filtro")[0];
			String buscar = mapa.get("filtroBuscar")[0];
			if (filtro.equals("todo")) {
				viajes = PersistenceFactory.newTripDao().findAll();
				request.setAttribute("listaViajes", viajes);
				Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						viajes.size());
				System.out.println("huehuehuehue");
			}
			if(filtro.equals("fsalida")){
				List<Trip> v = new ArrayList();
				date = formatter.parse(buscar);
				viajes = PersistenceFactory.newTripDao().findAll();
				for(Trip t : viajes){
					if(t.getDepartureDate().equals(date)){
						v.add(t);
					}
				}
				//viaje = PersistenceFactory.newTripDao().findByDepartureDate(date);
				request.setAttribute("listaViajes", viajes);
				Log.debug("Obtenida lista de viajes conteniendo 1 viaje");
			}
			if(filtro.equals("fllegada")){
				List<Trip> v = new ArrayList();
				date = formatter.parse(buscar);
				viajes = PersistenceFactory.newTripDao().findAll();
				for(Trip t : viajes){
					if(t.getArrivalDate().equals(date)){
						v.add(t);
					}
				} 
				//viaje = PersistenceFactory.newTripDao().findByArrivalDate(date);
				request.setAttribute("listaViajes", v);
				Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						v.size());
			}
			if(filtro.equals("destino")){
				List<Trip> v = new ArrayList();;
				viajes = PersistenceFactory.newTripDao().findAll();
				for(Trip t : viajes){
					if(t.getDestination().getCity().equals(buscar)){
						v.add(t);
					}
				}
				request.setAttribute("listaViajes", v);
				Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						v.size());
			}
		} catch (Exception e) {
			Log.error("Algo ha ocurrido obteniendo lista de viajes");
		}
		return "EXITO";
	}

	@Override
	public String toString() {
		return getClass().getName();
	}

}

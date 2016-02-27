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
			Map<String, String[]> mapa = request.getParameterMap();
			String filtro = mapa.get("filtro")[0];
			String buscar = mapa.get("filtro")[0];
			if (filtro.equals("todo")) {
				viajes = PersistenceFactory.newTripDao().findAll();
				request.setAttribute("listaViajes", viajes);
				Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						viajes.size());
			}
			if(filtro.equals("fsalida")){
				//viajes = PersistenceFactory.newTripDao().findByDepartureDate(buscar);
				//request.setAttribute("listaViajes", viajes);
				/*Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						viajes.size());*/
			}
			if(filtro.equals("fllegada")){
				//viajes = PersistenceFactory.newTripDao().findByDepartureDate(buscar);
				//request.setAttribute("listaViajes", viajes);
				/*Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						viajes.size());*/
			}
			if(filtro.equals("destino")){
				//viajes = PersistenceFactory.newTripDao().findByDepartureDate(buscar);
				//request.setAttribute("listaViajes", viajes);
				/*Log.debug("Obtenida lista de viajes conteniendo [%d] viajes",
						viajes.size());*/
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

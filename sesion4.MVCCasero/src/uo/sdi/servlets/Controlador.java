package uo.sdi.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import alb.util.log.Log;
import uo.sdi.acciones.*;
import uo.sdi.model.Trip;
import uo.sdi.persistence.PersistenceFactory;

public class Controlador extends javax.servlet.http.HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Map<String, Map<String, Accion>> mapaDeAcciones; // <rol, <opcion, objeto Accion>>
	private Map<String, Map<String, Map<String, String>>> mapaDeNavegacion; // <rol, <opcion, <resultado, JSP>>>

	public void init() throws ServletException {  
		crearMapaAcciones();
		crearMapaDeJSP();
		inicializarAtributos();
    }
	

	private void inicializarAtributos() {
		List<Trip> viajes = PersistenceFactory.newTripDao().findAll();
		this.getServletContext().setAttribute("listaViajes", viajes);
		
	}


	public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws IOException, ServletException {
		
		String opcion, resultado, jspSiguiente;
		Accion accion;
		String rolAntes, rolDespues;
		
		try {
			
			opcion=req.getServletPath().replace("/","");
				
			rolAntes=obtenerRolDeSesion(req);
			
			accion=buscarAccionParaOpcion(rolAntes, opcion);
				
			resultado=accion.execute(req,res);
				
			rolDespues=obtenerRolDeSesion(req);
			
			jspSiguiente=buscarJSPSegun(rolDespues, opcion, resultado);

			req.setAttribute("jspSiguiente", jspSiguiente);
			

		} catch(Exception e) {
			
			req.getSession().invalidate();
			
			Log.error("Se ha producido alguna excepción no manejada [%s]",e);
			
			jspSiguiente="/error.jsp";
		}
			
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jspSiguiente); 
			
		dispatcher.forward(req, res);			
	}		
	
	
	private String obtenerRolDeSesion(HttpServletRequest req) {
		HttpSession sesion=req.getSession();
		if (sesion.getAttribute("user")==null)
			return "PUBLICO";
		else
			return "REGISTRADO";
	}

	// Obtiene un objeto accion en funci�n de la opci�n
	// enviada desde el navegador
	private Accion buscarAccionParaOpcion(String rol, String opcion) {
		
		Accion accion=mapaDeAcciones.get(rol).get(opcion);
		Log.debug("Elegida acción [%s] para opción [%s] y rol [%s]",accion,opcion,rol);
		return accion;
	}
	
	
	// Obtiene la p�gina JSP a la que habr� que entregar el
	// control el funci�n de la opci�n enviada desde el navegador
	// y el resultado de la ejecuci�n de la acci�n asociada
	private String buscarJSPSegun(String rol, String opcion, String resultado) {
		
		String jspSiguiente=mapaDeNavegacion.get(rol).get(opcion).get(resultado);
		Log.debug("Elegida página siguiente [%s] para el resultado [%s] tras realizar [%s] con rol [%s]",jspSiguiente,resultado,opcion,rol);
		return jspSiguiente;		
	}
		
		
	private void crearMapaAcciones() {
		
		mapaDeAcciones=new HashMap<String,Map<String,Accion>>();
		
		Map<String,Accion> mapaPublico=new HashMap<String,Accion>();
		mapaPublico.put("validarse", new ValidarseAction());
		mapaPublico.put("listarViajes", new ListarViajesAction());
		mapaPublico.put("cargar", new ListarViajesAction());
		mapaPublico.put("crearUsuario", new CrearUsuarioAccion());
		mapaPublico.put("registrarse", new ExitoAccion());
		mapaPublico.put("error", new ExitoAccion());
		mapaDeAcciones.put("PUBLICO", mapaPublico);
		
		Map<String,Accion> mapaRegistrado=new HashMap<String,Accion>();
		mapaRegistrado.put("cerrarSesion", new CerrarSesionAction());
		mapaRegistrado.put("modificarDatos", new ModificarDatosAction());
		mapaRegistrado.put("listarViajes", new ListarViajesAction());
		mapaRegistrado.put("modificar", new ExitoAccion());
		mapaRegistrado.put("cargar", new ListarViajesAction());
		mapaRegistrado.put("apuntarViaje", new ApuntarseViajeAction());
		mapaRegistrado.put("cancelar", new DesapuntarseViajeAction());
		mapaRegistrado.put("modificarViaje", new CargarModificarViajesAction());
		mapaRegistrado.put("modificarViajeDefinitivo", new ModificarViajeAccion());
		mapaRegistrado.put("crearViaje", new ExitoAccion());
		mapaRegistrado.put("promotor", new CargarListaAction());
		mapaRegistrado.put("crear", new CrearViajeAccion());
		mapaRegistrado.put("cancelarViaje", new CambiarViajeAction());
		mapaRegistrado.put("aceptarPeticion", new AceptarPeticionAction());
		mapaRegistrado.put("rechazarPeticion", new CancelarPeticionAction());
		mapaRegistrado.put("error", new ExitoAccion());
		mapaDeAcciones.put("REGISTRADO", mapaRegistrado);
	}
	
	
	private void crearMapaDeJSP() {
				
		mapaDeNavegacion=new HashMap<String,Map<String, Map<String, String>>>();

		// Crear mapas auxiliares vacíos
		Map<String, Map<String, String>> opcionResJSP=new HashMap<String, Map<String, String>>();
		Map<String, String> resJSP=new HashMap<String, String>();

		// Mapa de navegación del público
		resJSP.put("FRACASO","/login.jsp");
		opcionResJSP.put("validarse", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/listaViajes.jsp");
		opcionResJSP.put("listarViajes", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/login.jsp");
		opcionResJSP.put("cargar", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/login.jsp");
		opcionResJSP.put("crearUsuario", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/registro.jsp");
		opcionResJSP.put("registrarse", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/login.jsp");
		opcionResJSP.put("cerrarSesion", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/error.jsp");
		opcionResJSP.put("error", resJSP);
		mapaDeNavegacion.put("PUBLICO",opcionResJSP);
		
		// Crear mapas auxiliares vacíos
		opcionResJSP=new HashMap<String, Map<String, String>>();
		resJSP=new HashMap<String, String>();
		
		// Mapa de navegación de usuarios registrados
		resJSP.put("EXITO","/principal.jsp");
		opcionResJSP.put("validarse", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/principal.jsp");
		opcionResJSP.put("modificarDatos", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/modificar.jsp");
		opcionResJSP.put("modificar", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/principal.jsp");
		opcionResJSP.put("cargar", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/principal.jsp");
		opcionResJSP.put("apuntarViaje", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/principal.jsp");
		opcionResJSP.put("cancelar", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotor.jsp");
		opcionResJSP.put("cancelarViaje", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotorModificarViaje.jsp");
		opcionResJSP.put("modificarViaje", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotor.jsp");
		opcionResJSP.put("modificarViajeDefinitivo", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotorCrearViaje.jsp");
		opcionResJSP.put("crearViaje", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotor.jsp");
		opcionResJSP.put("promotor", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotor.jsp");
		opcionResJSP.put("aceptarPeticion", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/promotor.jsp");
		opcionResJSP.put("rechazarPeticion", resJSP);
		resJSP=new HashMap<String, String>();
		resJSP.put("EXITO","/error.jsp");
		opcionResJSP.put("error", resJSP);
		mapaDeNavegacion.put("REGISTRADO",opcionResJSP);
	}
			
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		doGet(req, res);
	}

}
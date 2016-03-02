package uo.sdi.tests;

import org.junit.*;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class Sesion4Tests {

    @Before
    public void prepare() {
        setBaseUrl("http://localhost:8280/sesion4.MVCCasero");
    }

    @Test
    public void testIniciarSesionSinPassword() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        setTextField("nombreUsuario", "user1"); // Rellenar primer campo de formulario
        submit(); // Enviar formulario
        assertTitleEquals("ShareMyTrip - Inicie sesión");  // Comprobar título de la página
        assertTextInElement("login", "");  // Comprobar cierto elemento contiene cierto texto
    }

    @Test
    public void testIniciarSesionConExitoConQueryString() {
    	// Rellenando el formulario HTML
        beginAt("/validarse?nombreUsuario=user2");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Página principal del usuario");  // Comprobar título de la página
        assertTextInElement("login", "user2");  // Comprobar cierto elemento contiene cierto texto
        assertTextInElement("name", "Luisa");  // Comprobar cierto elemento contiene cierto texto
        assertTextPresent("Bienvenido"); // Comprobar cierto texto está presente
    }
    
    @Test
    public void testIniciarSesionSinExito() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        setTextField("nombreUsuario", "yoNoExisto"); // Rellenar primer campo de formulario
        submit(); // Enviar formulario
        assertTitleEquals("ShareMyTrip - Inicie sesión");  // Comprobar título de la página
    }
    
    @Test
    public void testRegistrarseCorrecto() {
    	// Rellenando el formulario HTML
        beginAt("/registrarse");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Página de registro de usuario");
        setTextField("login", "user1");
        setTextField("name", "Fernando");
        setTextField("surname", "Alvarez");
        setTextField("email", "user1@gmail.com");
        setTextField("password", "user1");
        setTextField("password2", "user1");
        submit();
        assertTitleEquals("ShareMyTrip - Inicie sesión");
        
        beginAt("/registrarse");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Página de registro de usuario");
        setTextField("login", "user2");
        setTextField("name", "Luisa");
        setTextField("surname", "Lopez");
        setTextField("email", "user2@gmail.com");
        setTextField("password", "user2");
        setTextField("password2", "user2");
        submit();
        assertTitleEquals("ShareMyTrip - Inicie sesión");
        
        beginAt("/registrarse");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Página de registro de usuario");
        setTextField("login", "user3");
        setTextField("name", "Hector");
        setTextField("surname", "Alvarez");
        setTextField("email", "user3@gmail.com");
        setTextField("password", "user3");
        setTextField("password2", "user3");
        submit();
        assertTitleEquals("ShareMyTrip - Inicie sesión");
    }
    
    @Test
    public void testRegistrarsePasswordDistintas() {
    	// Rellenando el formulario HTML
        beginAt("/registrarse");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Página de registro de usuario");
        setTextField("login", "user4");
        setTextField("name", "Huelmer");
        setTextField("surname", "Maner");
        setTextField("email", "user4@gmail.com");
        setTextField("password", "user4");
        setTextField("password2", "userCuatro");
        submit();
        assertTitleEquals("ShareMyTrip - Inicie sesión");
    }
    
    @Test
    public void testIniciarSesionPasswordIncorrecta() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Inicie sesión");
        setTextField("nombreUsuario", "user1");
        setTextField("password", "user");
        submit();
        assertTitleEquals("ShareMyTrip - Inicie sesión");
    }
    
    
    @Test
    public void testPromotorCrearViaje() {
    	// Rellenando el formulario HTML
    	beginAt("/");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Inicie sesión");
        setTextField("nombreUsuario", "user1");
        setTextField("password", "user1");
        submit();
        assertTitleEquals("ShareMyTrip - Página principal del usuario");
        assertLinkPresent("promotor");  // Comprobar que existe el hipervínculo
        clickLink("promotor"); // Seguir el hipervínculo
        assertTitleEquals("ShareMyTrip - promotor");
        assertLinkPresent("crearV");  // Comprobar que existe el hipervínculo
        clickLink("crearV"); // Seguir el hipervínculo
        assertTitleEquals("ShareMyTrip - Crear viaje");
        setTextField("DSalida", "Escocia");
        setTextField("CSalida", "Madrid");
        setTextField("ESalida", "Espues");
        setTextField("PSalida", "España");
        setTextField("ZSalida", "789645");
        setTextField("LaSalida", "784");
        setTextField("LoSalida", "137");
        setTextField("DDestino", "C/Carbonera");
        setTextField("CDestino", "Alicante");
        setTextField("EDestino", "Espues");
        setTextField("PDestino", "España");
        setTextField("ZDestino", "845647");
        setTextField("LaDestino", "654");
        setTextField("LoDestino", "456");
        setTextField("FLlegada", "2016/04/20T20:16:00");
        setTextField("FSalida", "2016/04/01T14:10:00");
        setTextField("FLimite", "2016/03/30T00:00:00");
        setTextField("PMaximas", "58");
        setTextField("Coste", "600");
        setTextField("Comentarios", "Gran viaje para desconectar");
        submit();
        assertTitleEquals("ShareMyTrip - promotor");
    }
    
    @Test
    public void testEnviarSinRellenar() {
    	// Rellenando el formulario HTML
        beginAt("/");  // Navegar a la URL
        submit();
        assertTitleEquals("ShareMyTrip - Inicie sesión");
    }
    
    @Test
    public void testApuntarseViajeUsuarioNoPromotor() {
    	beginAt("/");  // Navegar a la URL
        assertTitleEquals("ShareMyTrip - Inicie sesión");
        setTextField("nombreUsuario", "user1");
        setTextField("password", "user1");
        submit("enviar");
        assertTitleEquals("ShareMyTrip - Página principal del usuario");
        setWorkingForm("botonForm" );
        submit();
    }

}
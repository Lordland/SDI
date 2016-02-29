<%@ page contentType="text/html"  pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp"%>
<%@ include file="cerrarSesion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Página principal del usuario</title>
</head>
<body>
	<jsp:useBean id="user" class="uo.sdi.model.User" scope="session" />
	<center><h1>Bienvenido <jsp:getProperty property="login" name="user" /> </h1></center>
 	<hr><br>
	<br/>	
	<a href = "modificar"> Modificar datos</a>
	<a href = "promotor">Promover viajes</a>
	
<%@ include file="listaViajes.jsp" %>
   
<%@ include file="listaApuntados.jsp" %>




</body>
</html>

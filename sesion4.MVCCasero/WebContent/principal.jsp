<%@ page contentType="text/html"  pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp" %>

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
<%@ include file="listaViajes.jsp" %>


</body>
</html>

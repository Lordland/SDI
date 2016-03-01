<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp" %>
<%@ include file="fecha.jsp"%>
<%@ include file="cerrarSesion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Página de registro de usuario</title>
</head>
<body>
<jsp:useBean id="user" class="uo.sdi.model.User" scope="session" />
<form action="modificarDatos" method="POST">
	<table>
		<tr>
			<td>Usuario: ${user.login }</td>
		</tr>
		<tr>
			<td>Nombre: ${user.name }</td>
		</tr>
		<tr>
			<td> Nuevo nombre</td>
			<td id=login>
				<input type="text" name="name" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Apellidos: ${user.surname }</td>
		</tr>
		<tr>
			<td> Nuevos apellidos</td>
			<td id=login>
				<input type="text" name="surname" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Email: ${user.email }</td>
		</tr>
		<tr>
			<td> Nuevo email</td>
			<td id=login>
				<input type="text" name="email" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Nueva password: </td>
			<td id=login>
				<input type="password" name="password" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Repita su  nueva password:</td>
			<td id=login>
				<input type="password" name="password2" size="15"/>
			</td>
		</tr>
	</table>
	<input type="submit" value="Modificar">
</form>
</body>
</html>
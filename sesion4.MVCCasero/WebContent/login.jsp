<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fecha.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" 
      href="styles/estilo.css" />
<title>ShareMyTrip - Inicie sesión</title>
<body>
	<c:if test="${user == null}">
		<form action="validarse" method="post">
			<center>
				<h1>Inicie sesión</h1>
			</center>
			<hr>
			<br>
			<table align="center">
				<tr>
					<td align="right">Su identificador de usuario</td>
					<td><input type="text" name="nombreUsuario" align="left"
						size="15"></td>
				</tr>
				<tr>
					<td align="right">Su contraseña</td>
					<td><input type="password" name="password" align="left"
						size="15"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Enviar" /></td>
				</tr>
			</table>
		</form>

		<form action="registrarse" method="post">

			<table align="center">
				<tr>
					<td><input type="submit" value="Registrarse" /></td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${user != null}">
		<form action="validarse" method="post">
			<table align="center">
				<tr>
					<td><input type="submit" value="Volver a vista principal" /></td>
				</tr>
			</table>
		</form>
	</c:if>

	<%@ include file="listaViajes.jsp"%>


</body>
</html>
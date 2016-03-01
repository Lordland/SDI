<%@ page contentType="text/html; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Página de registro de usuario</title>
</head>
<body>

<form action="crearUsuario" method="POST">
	<table>
		<tr>
			<td>Usuario: </td>
			<td id=login>
				<input type="text" name="login" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Nombre:</td>
			<td id="name">
				<br><input type="text" name="name" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Apellidos:</td>
			<td id="surname">
				<input type="text" name="surname" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Email:</td>
			<td id="email">
				<br><input type="text" name="email" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Password:</td>
			<td id=login>
				<input type="text" name="password" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Repita su password:</td>
			<td id=login>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
	</table>
	<input type="submit" value="crear">
</form>
</body>
</html>
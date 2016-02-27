<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>ShareMyTrip - Páina de registro del usuario</title>
</head>
<body>
	<form action="crearUsuario" method="POST">
		<br/>Nombre de usuario: <input type="text" name="login" size="15" />
		<br/>Nombre: <input type="text" name="nombre" size="15" /> <br />Apellidos:
		<input type="text" name="apellidos" size="15" /> <br />Email: <input
			type="text" name="email" size="15" /> <br /> <br />Password: <input
			type="text" name="password" size="15" /> <br /> <br />Repita la
		password: <input type="text" name="password2" size="15" /> 
		<input
			type="submit"> <br />
	</form>
</body>
</html>
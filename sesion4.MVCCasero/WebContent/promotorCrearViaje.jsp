<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<body>
	<form action="crearViaje" method="POST">

		<h1>Cree su viaje</h1>
		<hr>
		<br>
		<table align="left">
			<tr>
				<td>Dirección de salida:</td>
				<td id="name"><input type="text" name="login" size="15" /></td>
			</tr>
			<tr>
				<td>Ciudad de salida:</td>
				<td id="name"><br>
				<input type="text" name="name" size="15" /></td>
			</tr>
			<tr>
				<td>Estado de salida:</td>
				<td id="name"><input type="text" name="surname" size="15" /></td>
			</tr>
			<tr>
				<td>Pais de salida:</td>
				<td id="name"><br>
				<input type="text" name="email" size="15" /></td>
			</tr>

			<tr>
				<td>Zipcode de salida:</td>
				<td id="name"><input type="text" name="password" size="15" /></td>
			</tr>

			<tr>
				<td>Latitud de salida:</td>
				<td id="name"><input type="text" name="password2" size="15" />
				</td>
			</tr>
			<tr>
				<td>Longitud de salida:</td>
				<td id="name"><input type="text" name="password2" size="15" />
				</td>
			</tr>
			<tr>
				<td>Dirección de destino:</td>
				<td id="name"><input type="text" name="login" size="15" /></td>
			</tr>
			<tr>
				<td>Ciudad de destino:</td>
				<td id="name"><br>
				<input type="text" name="name" size="15" /></td>
			</tr>
			<tr>
				<td>Estado de destino:</td>
				<td id="name"><input type="text" name="surname" size="15" /></td>
			</tr>
			<tr>
				<td>Pais de destino:</td>
				<td id="name"><br>
				<input type="text" name="email" size="15" /></td>
			</tr>

			<tr>
				<td>Zipcode de destino:</td>
				<td id=name><input type="text" name="password" size="15" /></td>
			</tr>

			<tr>
				<td>Latitud de destino:</td>
				<td id=name><input type="text" name="password2" size="15" /></td>
			</tr>
			<tr>
				<td>Longitud de destino:</td>
				<td id=name><input type="text" name="password2" size="15" /></td>
			</tr>

			<tr>
				<td>Fecha de llegada:</td>
				<td id=name><input type="datetime-local" name="password2" size="15" /></td>
			</tr>
			<tr>
				<td>Fecha de salida:</td>
				<td id=name><input type="datetime-local" name="password2" size="15" /></td>
			</tr>

			<tr>
				<td>Fecha limite:</td>
				<td id=name><input type="datetime-local" name="password2" size="15" /></td>
			</tr>
			<tr>
				<td>Plazas disponibles:</td>
				<td id=name><input type="number" name="password2" size="15" /></td>
			</tr>

			<tr>
				<td>Plazas maximas:</td>
				<td id=name><input type="number"  min="1" name="password2" size="15" /></td>
			</tr>
			<tr>
				<td>Coste:</td>
				<td id=name><input type="number" name="password2" size="15" /></td>
			</tr>

			<tr>
				<td>Comentarios:</td>
				<td id=name><input type="text" name="password2" size="15" /></td>
			</tr>
			<tr>
				<td>Estado:</td>
				<td id=name><input type="text" name="password2" size="15" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
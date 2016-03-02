<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<%@ include file="fecha.jsp"%>
<%@ include file="cerrarSesion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" 
      href="styles/estilo.css" />
 <title>ShareMyTrip - Crear viaje</title>     
<body>
	<form action="crear" method="POST">

		<h1>Cree su viaje</h1>
		<hr>
		<br>
		<table align="left">
			<tr>
				<td>Dirección de salida:</td>
				<td id="name"><input type="text" name="DSalida" size="15" /></td>
			</tr>
			<tr>
				<td>Ciudad de salida:</td>
				<td id="name"><br>
				<input type="text" name="CSalida" size="15" /></td>
			</tr>
			<tr>
				<td>Estado de salida:</td>
				<td id="name"><input type="text" name="ESalida" size="15" /></td>
			</tr>
			<tr>
				<td>Pais de salida:</td>
				<td id="name"><br>
				<input type="text" name="PSalida" size="15" /></td>
			</tr>

			<tr>
				<td>Zipcode de salida:</td>
				<td id="name"><input type="text" name="ZSalida" size="15" /></td>
			</tr>

			<tr>
				<td>Latitud de salida:</td>
				<td id="name"><input type="text" name="LaSalida" size="15" />
				</td>
			</tr>
			<tr>
				<td>Longitud de salida:</td>
				<td id="name"><input type="text" name="LoSalida" size="15" />
				</td>
			</tr>
			<tr>
				<td>Dirección de destino:</td>
				<td id="name"><input type="text" name="DDestino" size="15" /></td>
			</tr>
			<tr>
				<td>Ciudad de destino:</td>
				<td id="name"><br>
				<input type="text" name="CDestino" size="15" /></td>
			</tr>
			<tr>
				<td>Estado de destino:</td>
				<td id="name"><input type="text" name="EDestino" size="15" /></td>
			</tr>
			<tr>
				<td>Pais de destino:</td>
				<td id="name"><br>
				<input type="text" name="PDestino" size="15" /></td>
			</tr>

			<tr>
				<td>Zipcode de destino:</td>
				<td id=name><input type="text" name="ZDestino" size="15" /></td>
			</tr>

			<tr>
				<td>Latitud de destino:</td>
				<td id=name><input type="text" name="LaDestino" size="15" /></td>
			</tr>
			<tr>
				<td>Longitud de destino:</td>
				<td id=name><input type="text" name="LoDestino" size="15" /></td>
			</tr>

			<tr>
				<td>Fecha de llegada:</td>
				<td id=name><input type="datetime-local" name="FLlegada" size="15" /></td>
			</tr>
			<tr>
				<td>Fecha de salida:</td>
				<td id=name><input type="datetime-local" name="FSalida" size="15" /></td>
			</tr>

			<tr>
				<td>Fecha limite:</td>
				<td id=name><input type="datetime-local" name="FLimite" size="15" /></td>
			</tr>
			<tr>
				<td>Plazas maximas:</td>
				<td id=name><input type="number"  min="1" name="PMaximas" size="15" /></td>
			</tr>
			<tr>
				<td>Coste:</td>
				<td id=name><input type="number" name="Coste" min= "1" size="15" /></td>
			</tr>

			<tr>
				<td>Comentarios:</td>
				<td id=name><input type="text" name="Comentarios" size="15" /></td>
			</tr>
			<tr>
				<td id=name><input type="submit" value = "Enviar" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
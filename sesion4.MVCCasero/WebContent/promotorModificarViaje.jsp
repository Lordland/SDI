<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<%@ include file="fecha.jsp"%>
<%@ include file="cerrarSesion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<body>


	<h2>Modifique su viaje</h2>
	<hr>
	<br>
	<form action="modificarViajeDefinitivo" method="post">
		<table align="left">
			<table>
				<tr>
					<td>Dirección de salida:</td>
					<td id="name"><input type="text" name="DSalida" size="15"
						value="${viajeMod.departure.address}" /></td>
				</tr>
				<tr>
					<td>Ciudad de salida:</td>
					<td id="name"><br> <input type="text" name="CSalida"
						size="15" value="${viajeMod.departure.city}"/></td>
				</tr>
				<tr>
					<td>Estado de salida:</td>
					<td id="name"><input type="text" name="ESalida" size="15" value="${viajeMod.departure.state}" /></td>
				</tr>
				<tr>
					<td>Pais de salida:</td>
					<td id="name"><br> <input type="text" name="PSalida"
						size="15" value="${viajeMod.departure.country}"/></td>
				</tr>

				<tr>
					<td>Zipcode de salida:</td>
					<td id="name"><input type="text" name="ZSalida" size="15" value="${viajeMod.departure.zipCode}" /></td>
				</tr>

				<tr>
					<td>Latitud de salida:</td>
					<td id="name"><input type="number" step="0.01" name="LaSalida"
						size="15"  value="${viajeMod.departure.waypoint.lat}" /></td>
				</tr>
				<tr>
					<td>Longitud de salida:</td>
					<td id="name"><input type="number" step="0.01" name="LoSalida"
						size="15"  value="${viajeMod.departure.waypoint.lon}" /></td>
				</tr>
				<tr>
					<td>Dirección de destino:</td>
					<td id="name"><input type="text" name="DDestino" size="15" value = ${viajeMod.destination.address} /></td>
				</tr>
				<tr>
					<td>Ciudad de destino:</td>
					<td id="name"><br> <input type="text" name="CDestino"
						size="15" value = ${viajeMod.destination.city} /></td>
				</tr>
				<tr>
					<td>Estado de destino:</td>
					<td id="name"><input type="text" name="EDestino" size="15" value = ${viajeMod.destination.state} /></td>
				</tr>
				<tr>
					<td>Pais de destino:</td>
					<td id="name"><br> <input type="text" name="PDestino"
						size="15" value = "${viajeMod.destination.country}" /></td>
				</tr>

				<tr>
					<td>Zipcode de destino:</td>
					<td id=name><input type="text" name="ZDestino" size="15" value = "${viajeMod.destination.zipCode}"/></td>
				</tr>

				<tr>
					<td>Latitud de destino:</td>
					<td id=name><input type="number" step="0.01" name="LaDestino"
						size="15" value = "${viajeMod.destination.waypoint.lat}"/></td>
				</tr>
				<tr>
					<td>Longitud de destino:</td>
					<td id=name><input type="number" step="0.01" name="LoDestino"
						size="15" value ="${viajeMod.destination.waypoint.lon}"/></td>
				</tr>

				<tr>
					<td>Fecha de llegada:</td>
					<td id=name><input type="datetime-local" id="myLocalDate"
						name="FLlegada" size="15" value="${viajeMod}.arrivalDate" /></td>
				</tr>
				<tr>


					<td>Fecha de salida:</td>
					<td id=name><input type="datetime-local" name="FSalida"
						size="15" value="${viajeMod.getDepartureDateT()}"/></td>
				</tr>

				<tr>
					<td>Fecha limite:</td>
					<td id=name><input type="datetime-local" name="FLimite"
						size="15" value="${viajeMod.closingDate}" /></td>
				</tr>
				<tr>
					<td>Plazas maximas:</td>
					<td id=name><input type="number" min="1" name="PMaximas"
						size="15" value="${viajeMod.maxPax}"/></td>
				</tr>
				<tr>
					<td>Plazas disponibles:</td>
					<td id=name><input type="number" min="1" name="PMaximas"
						size="15" value="${viajeMod.availablePax}"/></td>
				</tr>
				<tr>
					<td>Coste:</td>
					<td id=name><input type="number" name="Coste" min="1"
						size="15" value="${viajeMod.estimatedCost}" /></td>
				</tr>

				<tr>
					<td>Comentarios:</td>
					<td id=name><input type="text" name="Comentarios" size="15" value="${viajeMod.comments}"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="IdViaje"
						value="<%request.getAttribute("IdViaje");%>" /></td>
					<td><input type="submit" value="Enviar" /></td>
				</tr>
			</table>
		</table>
	</form>
</body>
</html>
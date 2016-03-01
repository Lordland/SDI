<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fecha.jsp"%>
<%@ include file="cerrarSesion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<body>
	<center><h1>Promotor </h1></center>
 	<hr><br>
	<br/>	

<a href = "crearViaje">Crear viaje</a>

	<table border="1" align="center">
		<tr>
			<th>ID viaje</th>
			<th>Origen</th>
			<th>Destino</th>
			<th>Plazas libres</th>
			<th>Plazas maximas</th>
			<th>Precio estimado</th>
			<th>Fecha de llegada</th>
			<th>Fecha de salida</th>
			<th>Fecha limite</th>
			<th>Estado</th>
		</tr>
		<c:forEach var="entry" items="${listaPromotor}" varStatus="i">
			<tr id="item_${i.index}">
				<td>${entry.id}</td>
				<td>${entry.departure.city}</td>
				<td>${entry.destination.city}</td>
				<td>${entry.availablePax}</td>
				<td>${entry.maxPax}</td>
				<td>${entry.estimatedCost}</td>
				<td>${entry.arrivalDate}</td>
				<td>${entry.departureDate}</td>
				<td>${entry.closingDate}</td>
				<td>${entry.status}</td>
				<td><form method="POST" action="cancelarViaje">
						<input type="hidden" name=IdViaje value="${entry.id}"> <input
							type="submit" value="Cancelar">
					</form></td>
				<td><form method="POST" action="modificarViaje">
				<input type="hidden" name=IdViaje value="${entry.id}">
					<input type="submit" value="Modificar">
					</form></td>
			</tr>
		</c:forEach>
	</table>

<%@ include file="listaApuntadosPromotor.jsp" %>


</body>
</html>
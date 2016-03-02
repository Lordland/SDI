<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>
<%@ include file="fecha.jsp"%>
<%@ include file="cerrarSesion.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<link rel="stylesheet" type="text/css" 
      href="styles/estilo.css" />
<title>ShareMyTrip - promotor</title>
<body>

	<center>
		<h1>Promotor</h1>
	</center>
	<hr>
	<br>
	<br />

	<a id="crearV" href="crearViaje">Crear viaje</a>

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
				<c:if test="${entry.status != 'CANCELLED' }">
					<c:if test="${entry.status != 'CLOSED' }">
						<c:if test="${entry.status != 'DONE' }">
							<td><form method="POST" action="cancelarViaje">
									<input type="hidden" name=IdViaje value="${entry.id}">
										<input type="submit" value="Cancelar">
								</form></td>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${entry.status != 'OPEN' }">
					<td><form method="POST" action="cancelarViaje">
							<input type="hidden" name=IdViaje value="${entry.id}"> <input
								type="submit" value="Abrir">
						</form></td>
				</c:if>
				<c:if test="${entry.status != 'CLOSED' }">
					<c:if test="${entry.status != 'CANCELLED' }">
						<c:if test="${entry.status != 'DONE' }">
						<td><form method="POST" action="cancelarViaje">
								<input type="hidden" name=IdViaje value="${entry.id}"> <input
									type="hidden" name=estado value="cerrado"> <input
									type="submit" value="Cerrar viaje">
							</form></td>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${entry.status != 'DONE' }">
					<td><form method="POST" action="cancelarViaje">
							<input type="hidden" name=IdViaje value="${entry.id}"> <input
								type="hidden" name=estado value="hecho"> <input
								type="submit" value="Finalizar viaje">
						</form></td>
				</c:if>
				<c:if test="${entry.status eq 'OPEN' }">
					<td><form method="POST" action="modificarViaje">
						<input type="hidden" name=IdViaje value="${entry.id}"> <input
							type="submit" value="Modificar">
					</form></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>

	<%@ include file="listaApuntadosPromotor.jsp"%>


</body>
</html>

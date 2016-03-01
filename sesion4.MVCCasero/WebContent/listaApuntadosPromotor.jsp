<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>


<c:if test="${!listaApuntadoPromotor.isEmpty() }">
	<h2>Viajes a los que se han apuntado</h2>
	<table border="1">
		<tr>
			<th>Usuario</th>
			<th>Origen</th>
			<th>Destino</th>
			<th>Fecha de salida</th>
			<th>Peticion</th>

		</tr>
		<c:forEach var="entry" items="${listaApuntadoPromotor}" varStatus="i">
			<tr id="${i.index}">
				<td>${entry.usuario.login}</td>
				<td>${entry.viaje.departure.city}</td>
				<td>${entry.viaje.destination.city}</td>
				<td>${entry.viaje.departureDate}</td>
				<td>${entry.relacionViaje}</td>
				<c:if test="${ entry.relacionViaje != 'ACCEPTED'}">
					<c:if test="${ entry.relacionViaje != 'NO_SEAT'}">
						<td><form action="aceptarPeticion">
								<input type="hidden" name="IdViajeAceptar"
									value="${entry.viaje.id}"> <input type="hidden"
									name="IdUsuarioAceptar" value="${entry.usuario.id}"> <input
									type="hidden" name="estado" value="${entry.relacionViaje}">
								<input type="submit" value="Aceptar">
							</form></td>
					</c:if>
				</c:if>
				<c:if test="${ entry.relacionViaje != 'EXCLUDED'}">
					<c:if test="${ entry.relacionViaje != 'EXCLUDED'}">
						<td><form action="rechazarPeticion">
								<input type="hidden" name="IdViajeCancelar"
									value="${entry.viaje.id}"> <input type="hidden"
									name="IdUsuarioCancelar" value="${entry.usuario.id}"> <input
									type="hidden" name="estado" value="${entry.relacionViaje}">
								<input type="submit" value="Rechazar">
							</form></td>
					</c:if>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${listaApuntadoPromotor.isEmpty()}">
	<h2>Nadie se ha apuntado a ninguno de sus viajes</h2>
</c:if>
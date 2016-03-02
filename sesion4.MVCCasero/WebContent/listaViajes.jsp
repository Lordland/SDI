<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>Buscar por</h2>
<form name = filtrado method="GET" action="cargar">
	<select name="filtro">
		<option value="todo">Mostrar todos los viajes</option>
		<option value="fsalida">Fecha de salida</option>
		<option value="fllegada">Fecha de llegada</option>
		<option value="destino">Destino</option>
	</select>
	 <input type="text" name="filtroBuscar" size="15" value = "formato fecha dd/MM/yyyy"> <input
		type="submit">
</form>
<table border="1">
	<tr>
		<th>Origen</th>
		<th>Destino</th>
		<th>Plazas libres</th>
		<th>Plazas maximas</th>
		<th>Precio estimado</th>
		<th>Fecha de llegada</th>
		<th>Fecha de salida</th>
		<th>Fecha limite</th>
		<th>Estado</th>
		<c:if test="${user.login != null}">
			<th>Id de promotor</th>
			<th>Comentarios</th>
		</c:if>
	</tr>
	<jsp:useBean id="today" class="java.util.Date" />
	<c:out value="${today}" />
	<c:forEach var="entry" items="${listaViajes}" varStatus="i">
		<c:if test="${entry.closingDate.time gt  today.time}">
			<c:if test="${entry.status != 'CANCELLED'}">
				<c:if test="${entry.promoterId != user.id}">
					<tr id="item_${i.index}">
						<td>${entry.departure.city}</td>
						<td>${entry.destination.city}</td>
						<td>${entry.availablePax}</td>
						<td>${entry.maxPax}</td>
						<td>${entry.estimatedCost}</td>
						<td>${entry.arrivalDate}</td>
						<td>${entry.departureDate}</td>
						<td>${entry.closingDate}</td>
						<td>${entry.status}</td>
						<c:if test="${user.login != null}">
							<td>${entry.promoterId}</td>
							<td>${entry.comments}</td>
							<td>
								<form name="botonForm" action="apuntarViaje">
									<input id="apuntarse" type="hidden" name="apuntarse" value="${entry.id}"> <input
										type="submit" value="Apuntarse">
								</form>
							</td>
						</c:if>
					</tr>
				</c:if>
			</c:if>
		</c:if>
	</c:forEach>
</table>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="comprobarNavegacion.jsp"%>


<c:if test="${!listaApuntado.isEmpty() }">
	<h2>Viajes a los que se ha apuntado</h2>
	<table border="1">
		<tr>
			<th>Origen</th>
			<th>Destino</th>
			<th>Fecha de salida</th>
			<th>Estado</th>

		</tr>
		<c:forEach var="entry" items="${listaApuntado}" varStatus="i">
			<tr id="item_${i.index}">
				<td>${entry.departure.city}</td>
				<td>${entry.destination.city}</td>
				<td>${entry.departureDate}</td>
				<td>${entry.status}</td>
				<td>
					<form action="cancelarViaje">
						<input type="hidden" name="ID" value="${entry.id}"> <input
							type="submit" value="Cancelar">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<c:if test="${listaApuntado.isEmpty()}">
	<h2>No se ha apuntado a ningún viaje :(</h2>
</c:if>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head> <title>ShareMyTrip - Inicie sesión</title>
<body>
  <form action="validarse" method="post">

 	<center><h1>Inicie sesión</h1></center>
 	<hr><br>
 	<table align="center">
    	<tr>   
    		<td align="right">Su identificador de usuario</td>
	    	<td><input type="text" name="nombreUsuario" align="left" size="15"></td>
      	</tr>
      	<tr>
    	    <td><input type="submit" value="Enviar"/></td>
      	</tr>
      </table>
   </form>
   <form action="registrarse" method="post">

 	<table align="center">
      	<tr>
    	    <td><input type="submit" value="Registrarse"/></td>
      	</tr>
      </table>
   </form>
   
   <h2>Buscar por</h2>
   <form method="GET" action="cargar">
   		<select name="filtro">
   			<option value = "fsalida">Fecha de salida</option>
   			<option value = "fllegada">Fecha de llegada</option>
   			<option value = "destino">Destino</option>
   			<option value = "todo">Mostrar todos los viajes</option>
   		</select>
   	  <input type="text" name="filtroBuscar" align="left" size="15">
      <input type="submit">
   </form>
 
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
			</tr>
		<c:forEach var="entry" items="${listaViajes}" varStatus="i">
			<tr id="item_${i.index}">
				<td><a href="mostrarViaje?id=${entry.id}">${entry.id}</a></td>
				<td>${entry.departure.city}</td>
				<td>${entry.destination.city}</td>
				<td>${entry.availablePax}</td>
				<td>${entry.maxPax}</td>
				<td>${entry.estimatedCost}</td>
				<td>${entry.arrivalDate}</td>
				<td>${entry.departureDate}</td>
				<td>${entry.closingDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
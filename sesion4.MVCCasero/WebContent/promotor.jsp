<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head>
<body>
  <form action="crearViaje" method="POST">

 	<h1>Cree su viaje</h1>
 	<hr><br>
 	<table align="left">
		<tr>
			<td>Dirección de salida:</td>
			<td id="name">
				<input type="text" name="login" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Ciudad de salida:</td>
			<td id="name">
				<br><input type="text" name="name" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Estado de salida:</td>
			<td id="name">
				<input type="text" name="surname" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Pais de salida:</td>
			<td id="name">
				<br><input type="text" name="email" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Zipcode de salida:</td>
			<td id="name">
				<input type="text" name="password" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Latitud de salida:</td>
			<td id="name">
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Longitud de salida:</td>
			<td id="name">
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Dirección de destino:</td>
			<td id="name">
				<input type="text" name="login" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Ciudad de destino:</td>
			<td id="name">
				<br><input type="text" name="name" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Estado de destino:</td>
			<td id="name">
				<input type="text" name="surname" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Pais de destino:</td>
			<td id="name">
				<br><input type="text" name="email" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Zipcode de destino:</td>
			<td id=name>
				<input type="text" name="password" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Latitud de destino:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Longitud de destino:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Fecha de llegada:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Fecha de salida:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Fecha limite:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Plazas disponibles:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Plazas maximas:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Coste:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Comentarios:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Estado:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
	</table>
   </form>
   <form action="modificarViaje" method="post">

 	<h2>Modifique su viaje</h2>
 	<hr><br>
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
   
   <form action="eliminarViaje" method="post">

 	<h3>Elimine su viaje</h3>
 	<hr><br>
 	<table align="right">
		<tr>
			<td>Dirección de salida:</td>
			<td id=login>
				<input type="text" name="login" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Ciudad de salida:</td>
			<td id="name">
				<br><input type="text" name="name" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Zipcode de salida:</td>
			<td id=login>
				<input type="text" name="password" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Dirección de destino:</td>
			<td id=login>
				<input type="text" name="login" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Ciudad de destino:</td>
			<td id="name">
				<br><input type="text" name="name" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Zipcode de destino:</td>
			<td id=login>
				<input type="text" name="password" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Fecha de llegada:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		<tr>
			<td>Fecha de salida:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
		
		<tr>
			<td>Fecha limite:</td>
			<td id=name>
				<input type="text" name="password2" size="15"/>
			</td>
		</tr>
	</table>
   
   <h4>Buscar por</h4>
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
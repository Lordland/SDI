<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="comprobarNavegacion.jsp"%>
<%@ include file="fecha.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Fallo de navegación</title>
</head>
<body>
	<c:choose>
		<c:when test="${user!=null}">
			<br>Su sesión a caducado o ha intentado navegar a una parte donde se requiere iniciar sesión. Por favor, inicie sesión o regístrese.
    	</c:when>
		<c:otherwise>
			<br>Error. Ha intentado acceder a un lugar donde no debía. Por favor, vuelva a la página principal
    </c:otherwise>
	</c:choose>
	<a id="inicio" href="login.jsp">Volver al login</a>
</body>
</html>
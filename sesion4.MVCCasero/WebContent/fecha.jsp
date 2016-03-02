<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	java.util.Date dnow = new java.util.Date();
	String currentDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(dnow);
%>
<p>
	La fecha actual es:
	<%=currentDate%></p>
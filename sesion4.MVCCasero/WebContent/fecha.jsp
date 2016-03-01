<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	java.util.Date dnow = new java.util.Date();
	Timestamp tNow = new Timestamp(dnow.getTime());
	String currentDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(tNow);
%>

<p>
	La fecha actual es:
	<%=currentDate%></p>
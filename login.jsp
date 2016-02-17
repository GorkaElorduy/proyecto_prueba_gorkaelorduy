<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="com.ipartek.formacion.pruebatest.Constantes"%>
<%@ page errorPage="pages/error/error.jsp" %>

<%@ page import="com.ipartek.formacion.pruebagorka.controladores.Mensaje"%>
<%@ page contentType="text/html; charset=UTF-8"%>





<!DOCTYPE html>

<head>
<title>HTML5 Login</title>
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/style.css">

<base href="${pageContext.request.contextPath}/" />
</head>
<body>
	
	<section class="loginform cf">
		<form name="login" action="<%=Constantes.CONTROLLER_LOGIN%>" method="post"
			accept-charset="utf-8">
			<ul>
				<li><label for="nombre"><fmt:message key="login.email" /></label> 
					<input type="text"		
					       name="nombre" 
					  
					       value="${cookie.cEmail.value}"
					       required>
				</li>
				<li><label for="apellido">Password</label> 
					<input type="password" 
					       name="apellido" 
					       placeholder="password" 
					       required>
				</li>
				
				
				<li>
					<input type="submit" value="Acceder">
					<br>
					<input type="checkbox" id="recuerdame" checked name="recuerdame" value="1"> 
					<label for="recuerdame">Recordar datos</label>
				</li>
			</ul>
			
			
			
			<%
				Mensaje mensaje = (Mensaje)request.getAttribute("msj");						
				if ( session.getAttribute("msj") != null ){
					mensaje = (Mensaje)session.getAttribute("msj") ; //recoger
					session.setAttribute("msj",null); // limpiar mensaje
				}		
				if (mensaje != null) {
			%>
			<ul>
				<li>			
					<p class="error"><%=mensaje.getTexto()%></p>
				</li>
			</ul>
			<%
				}
			%>

		</form>
	</section>

</body>
</html>
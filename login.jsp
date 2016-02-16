<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="com.ipartek.formacion.backoffice.Constantes"%>
<%@ page errorPage="pages/error/error.jsp" %>

<%@ page import="com.ipartek.formacion.backoffice.controladores.Mensaje"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<c:set var="language" value="${cookie.cIdioma.value==''?'eu_ES':cookie.cIdioma.value }" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18nmesages" /> 



<!DOCTYPE html>
<html lang="${language}">
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
				<li><label for="email"><fmt:message key="login.email" /></label> 
					<input type="email"		
					       name="email" 
					       placeholder="tuemail@email.com" 
					       value="${cookie.cEmail.value}"
					       required>
				</li>
				<li><label for="password">Password</label> 
					<input type="password" 
					       name="password" 
					       placeholder="password" 
					       required>
				</li>
				<li>
					<label for="idioma"><fmt:message key="login.idioma" /></label> 
					<select name="idioma" id="idioma">
						<option value="es_ES" <c:if test="${language == 'es_ES'}">selected</c:if>>Castellano</option>
						<option value="eu_ES" <c:if test="${language == 'eu_ES'}">selected</c:if>>Euskara</option>
						<option value="en_EN" <c:if test="${language == 'en_EN'}">selected</c:if>>English</option>
				</select>
				</li>
				
				<li>
					<input type="submit" value="Acceder">
					<br>
					<input type="checkbox" id="recuerdame" checked name="recuerdame" value="1"> 
					<label for="recuerdame">Recordar email</label>
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
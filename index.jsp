<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@include file="includes/head.jsp"%>

<!-- Este es un comentario para comprobar cómo se unen ramas -->

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Bienvenido ${sessionScope.userlogged.nombre}</h1>
			
			<jsp:useBean id="dateValue" class="java.util.Date"/>
			<jsp:setProperty name="dateValue" property="time" value="${cookie.cLastVisit.value}"/>
			<span>Ultima visita: <fmt:formatDate value="${dateValue}" pattern="dd-MM-yyyy HH:mm"/> </span>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		
		
		<h2>Usuarios conectados</h2>
		<ol id="lista_user_logged">
		
		</ol>		
		
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<%@include file="includes/footer.jsp"%>




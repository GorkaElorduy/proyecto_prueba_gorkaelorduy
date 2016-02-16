<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.ipartek.formacion.backoffice.listeners.SessionListener"%>
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
		<h2>Visitantes Activos: ${applicationScope.visitantes}</h2>
		
		<h2>Usuarios conectados</h2>
		<ol id="lista_user_logged">
		<%
		for ( Persona p : SessionListener.listaUsariosLogeados ){
			%>
				<li><%=p.getNombre()%></li>
			<%	
		}
		%>
		</ol>		
		
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<%@include file="includes/footer.jsp"%>



<script>
	/* Se ejecuta cuando la pagina esta cargada totalmente */
	$(function() {		
	 	console.debug('ready');
	 	setInterval( refreshUserLogged , 5000);
	});
	/*
	   Llamda Ajax para mostrar los usuarios logeados
	*/
	function refreshUserLogged(){
		
		console.debug('llamda ajax');
		
		console.debug('limpiar lista');
		$('#lista_user_logged').html('');
		
		//url => loggeduser
		
		$.ajax("<%=Constantes.CONTROLLER_USUARIOS_LOGEADOS%>", {
			"type": "get", 
			"success": function(result) {
				console.log("Llego el contenido y no hubo error", result);
				
				$.each(result, function(key, value){
					
					var item = "<li>" + value.nombre + "</li>";
					
					$('#lista_user_logged').append(item);
					
				});
				
			},
			"error": function(result) {
				console.error("Este callback maneja los errores", result);
			},
			// "data": { p1 : "Volando vengo"},
			"async": true,
		});
		
		
	}
	
	
</script>
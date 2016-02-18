<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page
	import="com.ipartek.formacion.pruebapractica.pruebaGorka.Constantes"%>
<%@page import="com.ipartek.formacion.pruebagorka.pojo.Curso"%>
<%@page import="java.util.Calendar"%>
<%@include file="../../includes/head.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<%
				//recoger "atributo persona de la request
				Curso curso = (Curso) request.getAttribute("curso");
				boolean isNew = (curso.getId() == -1);
			%>
			<h1 class="page-header"><%=curso.getNombre_curso()%></h1>
		</div>

		<!-- Formularios -->
		<form method="post" action="back/cursos">

			<div class="form-group">
				<label for="id" class="col-sm-2 control-label"
					style="margin: 10px 0;">ID</label>
				<div class="col-sm-10">
					<label for="id" class="col-sm-2 control-label"
						style="margin: 10px 0;"><%=curso.getId()%></label>
				</div>
			</div>
			
				<div class="form-group">
				<label for="nombre" class="col-sm-2 control-label"
					style="margin: 10px 0;">Nombre</label>
				<div class="col-sm-10">
					<input type="text" name="nombre" placeholder="Escribe el nombre del curso:"
						value="<%=curso.getNombre_curso()%>" required
						style="margin: 10px 0;"
						size="60" autofocus>
				</div>
			</div>
		
			<div class="form-group">
				<label for="duracion" class="col-sm-2 control-label"
					style="margin: 10px 0;">Duracion</label>
				<div class="col-sm-10">
					<input type="text" name="duracion" 
						value="<%=curso.getDuracion()%>" size="60" required style="margin: 10px 0;">
				</div>
			</div>

			<div class="form-group">
				<label for="fecha_inicio" class="col-sm-2 control-label"
					style="margin: 10px 0;">Fecha de Inicio</label>
				<div class="col-sm-10">
					<%
						GregorianCalendar calendar = new GregorianCalendar(1900, 0, 1);
						Date fechaInicio = new Date(calendar.getTimeInMillis());
						if (curso.getFecha_inicio().equals(fechaInicio)) {
					%>
					<input type="text" name="fecha" placeholder="Ejem.: 1982-08-10"
						required
						pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
						style="margin: 10px 0;">
					<% 
					} else {
					%>
					<input type="text" name="fecha"
						value="<%=curso.getFecha_inicio()%>" size="60" required
						pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
						style="margin: 10px 0;">
					<%
						}
					%>
				</div>
			</div>
			
			<div class="form-group">
				<label for="fecha_fin" class="col-sm-2 control-label"
					style="margin: 10px 0;">Fecha de fin</label>
				<div class="col-sm-10">
					<%
						GregorianCalendar calendario = new GregorianCalendar(1900, 0, 1);
						Date fechaFin = new Date(calendar.getTimeInMillis());
						if (curso.getFecha_fin().equals(fechaFin)) {
					%>
					<input type="text" name="fecha" placeholder="Ejem.: 1982-08-10"
						required
						pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
						style="margin: 10px 0;">
					<% 
					} else {
					%>
					<input type="text" name="fecha"
						value="<%=curso.getFecha_fin()%>" size="60" required
						pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
						style="margin: 10px 0;">
					<%
						}
					%>
				</div>
			</div>

			<div class="form-group">
				<label for="nivel" class="col-sm-2 control-label"
					style="margin: 80px 0;">Nivel necesario</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="nivel"
						placeholder="Escribe algo sobre ti" style="margin: 10px 0;"><%=curso.getNivel_requerido()%></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label for="area" class="col-sm-2 control-label"
					style="margin: 80px 0;">Area de conocimiento</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="nivel"
						placeholder="Escribe algo sobre ti" style="margin: 10px 0;"><%=curso.getArea()%></textarea>
				</div>
			</div>

	<input type="hidden" name="id" value="<%=curso.getId()%>"> 
	<input type="hidden" name="nombre" value="<%=curso.getNombre_curso()%>"> 
	<input type="hidden" name="duracion" value="<%=curso.getDuracion()%>"> 
	<input type="hidden" name="inicio" value="<%=curso.getFecha_inicio()%>">  
	<input type="hidden" name="fin" value="<%=curso.getFecha_fin()%>"> 
	<input type="hidden" name="nivel" value="<%=curso.getNivel_requerido()%>">
	<input type="hidden" name="area" value="<%=curso.getArea()%>">  
	
	
	<input type="hidden" name="op"
				value="<%=Constantes.OP_MODIFICAR%>">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<%
						if (isNew) {
					%>
					<button type="submit" class="btn btn-primary"
						style="margin: 10px 0;">Crear</button>
					<%
						} else {
					%>
					<button type="submit" class="btn btn-primary"
						style="margin: 10px 0;">Modificar</button>
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#eliminar">Eliminar</button>
					<%
						}
					%>
				</div>
			</div>
		</form>
		<!-- Pop Up de eliminación-->
		<div class="modal fade" id="eliminar" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Cerrar</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Eliminación de
							curso</h4>
					</div>
					<div id="nuevaAventura" class="modal-body">
						<form method="post" action="/back/cursos">
							<div class="form-group">
								<input type="hidden" name="op"
									value="<%=Constantes.OP_ELIMINAR%>"> <input
									type="hidden" name="id" value="<%=curso.getId()%>"> <label
									for="aviso">¿Está seguro que desea eliminar al curso?
									Esta acción no se puede deshacer.</label>
								<button type="submit" class="btn btn-danger" id="eliminacion"
									style="margin: 10px 0;">Eliminar</button>
								<button type="button" class="btn btn-success"
									data-dismiss="modal" style="margin: 10px 0;">Cerrar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- fin Pop Up de eliminación-->
	</div>
	<!-- END <div class="row"> -->
</div>
<!-- END <div id="page-wrapper"> -->

<%@include file="../../includes/footer.jsp"%>
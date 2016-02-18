<%@ page contentType="text/html; charset=UTF-8"%>

<%@page import="com.ipartek.formacion.pruebagorka.pojo.Alumno"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page
	import="com.ipartek.formacion.pruebapractica.pruebaGorka.Constantes"%>
<%@page import="java.util.Calendar"%>
<%@include file="../../includes/head.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<%
				//recoger "atributo persona de la request
				Alumno alumno = (Alumno) request.getAttribute("persona");
				boolean isNew = (alumno.getId() == -1);
			%>
			<h1 class="page-header"><%=alumno.getNombre()%></h1>
		</div>

		<!-- Formularios -->
		<form method="post" action="back/alumnos">

			<div class="form-group">
				<label for="id" class="col-sm-2 control-label"
					style="margin: 10px 0;">ID</label>
				<div class="col-sm-10">
					<label for="id" class="col-sm-2 control-label"
						style="margin: 10px 0;"><%=alumno.getId()%></label>
				</div>
			</div>
			
			

			<div class="form-group">
				<label for="nombre" class="col-sm-2 control-label"
					style="margin: 10px 0;">Nombre</label>
				<div class="col-sm-10">
					<input type="text" name="nombre" placeholder="Escribe tu nombre"
						value="<%=alumno.getNombre()%>" required
						style="margin: 10px 0;"
						size="60" autofocus>
				</div>
			</div>

			<div class="form-group">
				<label for="dni" class="col-sm-2 control-label"
					style="margin: 10px 0;">DNI</label>
				<div class="col-sm-10">
					<input type="text" name="dni" placeholder="Escribe tu DNI"
						value="<%=alumno.getDni()%>" size="60" required style="margin: 10px 0;">
				</div>
			</div>

			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label"
					style="margin: 10px 0;">Pass</label>
				<div class="col-sm-10">
					<input type="text" name="pass" placeholder="Escribe tu clave (recuerda que es tu primer apellido):"
						value="<%=alumno.getApellido_primero()%>" size="60" required style="margin: 10px 0;">
				</div>
			</div>

			<div class="form-group">
				<label for="nivelestudios" class="col-sm-2 control-label"
					style="margin: 80px 0;">Nivel de estudios</label>
				<div class="col-sm-10">
				<input type="text" name="pass" placeholder="Escribe tu nivel de estudios:"
						value="<%=alumno.getNivel_estudios()%>" size="60" required style="margin: 10px 0;">
					
				</div>
			</div>

			<div class="form-group">
				<label for="edad" class="col-sm-2 control-label"
					style="margin: 10px 0;">Email</label>
				<div class="col-sm-10">
					<input type="text" name="edad" placeholder="Escribe tu edad"
						value="<%=alumno.getEdad()%>" size="60" required style="margin: 10px 0;">
				</div>
			</div>

			
						
			<input type="hidden" name="id" value="<%=alumno.getId()%>"> <input
				type="hidden" name="dni" value="<%=alumno.getDni()%>"> <input
				type="hidden" name="pass" value="<%=alumno.getApellido_primero()%>"> <input
				type="hidden" name="edad" value="<%=alumno.getEdad()%>"> 
				<input
				type="hidden" name="nivelestudios"
				value="<%=alumno.getNivel_estudios()%>"> <input type="hidden"
				name="edad" value="<%=alumno.getEdad()%>"> <input
				type="hidden" name="op"
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
							usuario</h4>
					</div>
					<div id="nuevaAventura" class="modal-body">
						<form method="post" action="back/usuarios">
							<div class="form-group">
								<input type="hidden" name="op"
									value="<%=Constantes.OP_ELIMINAR%>"> <input
									type="hidden" name="id" value="<%=alumno.getId()%>"> <label
									for="aviso">¿Está seguro que desea eliminar al usuario?
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
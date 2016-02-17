
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ipartek.formacion.pruebagorka.pojo.Alumno"%>
<%@page
	import="com.ipartek.formacion.pruebapractica.pruebaGorka.Constantes"%>
<%@page import="java.util.Calendar"%>

<!-- /.panel-heading -->
<div class="panel-body">
	<div class="row">
		<div class="col-lg-12">
			<div class="table-responsive">
				<table
					class="datatable table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Nombre</th>
							<th>Apellido (Password)</th>
							<th>DNI</th>
							<th>NIVEL FORMATIVO</th>							
							<th>Edad</th>
							
						</tr>
					</thead>
					<tbody>
						<%
							//recoger "atributo listado alumnos de la request
							ArrayList<Alumno> lista = (ArrayList<Alumno>) request.getAttribute("listaAlumnos");
							if (lista == null)
								lista = new ArrayList<Alumno>();

							for (int i = 1; i <= lista.size(); i++) {
								Alumno alumno = lista.get(i - 1);
						%>
						<tr>
							<td><%=i%></td>
							<td><a
								href="<%=Constantes.CONTROLLER_ALUMNOS%>?op=<%=Constantes.OP_DETALLE%>&id=<%=alumno.getId()%>"
								title="Ir al detalle de <%=alumno.getNombre()%>"><%=alumno.getNombre()%></a></td>
							<td><%=alumno.getApellido_primero()%></td>
							<td><%=alumno.getDni()%></td>
							<td><%=alumno.getNivel_estudios()%></td>
							<td><%=alumno.getEdad()%></td>
							
							
						</tr>
						<%
							} //end for
						%>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.col-lg-4 (nested) -->
		<div class="col-lg-8">
			<div id="morris-bar-chart"></div>
		</div>
		<!-- /.col-lg-8 (nested) -->
	</div>
	<!-- /.row -->
</div>
<!-- /.panel-body -->
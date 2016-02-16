package com.ipartek.formacion.pruebagorka.controladores;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.pruebagorka.pojo.Alumno;
import com.ipartek.formacion.pruebapractica.pruebaGorka.Constantes;


/**
 * Servlet implementation class UsuarioServlet
 */
public class AlumnoServlet extends MasterServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static int operacion;
	private static String pId; // Parámetro identificador del usuario, aunque sea un id, es un string, luego se parsea
		
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);		
	}

	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {	
			// recoger parámetros a realizar
			if (request.getParameter("op") != null) {
				operacion = Integer.parseInt(request.getParameter("op"));
			} else {
				operacion = Constantes.OP_LISTAR;
			}

			// Realizar accion
			switch (operacion) {
			case Constantes.OP_LISTAR:
				listar(request);
				break;
			case Constantes.OP_DETALLE:
				detalle(request);
				break;
			case Constantes.OP_NUEVO:
				nuevo(request);
				break;
			case Constantes.OP_ELIMINAR:
				eliminar(request);
				break;
			case Constantes.OP_MODIFICAR:
				modificarCrear(request);
				break;
			}
			request.setAttribute("msj", msj);
			/*
			 * forward para servir la jsp (lanzarlo). en forward hay que poner
			 * dos argumentos. doGet tiene dos request y response, al ser una
			 * petición interna, hay que poner los mismos
			 */
			dispatch.forward(request, response);
		} catch (Exception e) {
			// TODO mejor en un LOG
			e.printStackTrace();

			// TODO ir a página error 404.jsp o 500.jsp
		}
	}

	/**
	 * Modifica o crea una nueva persona
	 * 
	 * @param request
	 * @throws ParseException 
	 * @throws SQLException 
	 */
	private void modificarCrear(HttpServletRequest request) throws ParseException, SQLException {
		
			// recoger parámetros formulario
			int id = Integer.parseInt(request.getParameter("id"));
			Integer.parseInt(request.getParameter("rol"));
			String pNombre = request.getParameter("nombre"), pDni = request.getParameter("dni"),
					pApellido = request.getParameter("apellido"), pEstudios = request.getParameter("nivel_estudios"),
					pEdad = request.getParameter("edad"), pIdCurso = request.getParameter("id_curso");

			
			// construir persona
			Alumno alumno = new Alumno();
			alumno.setId(id);
			alumno.setId_curso(Integer.parseInt(pIdCurso));
			alumno.setNombre(pNombre);
			alumno.setApellido_primero(pApellido);
			alumno.setDni(pDni);
			alumno.setNivel_estudios(pEstudios);
			alumno.setEdad(Integer.parseInt(pEdad));
			
			// persistir en la bbdd
			if (alumno.getId() == -1) {
				if (alumnoDao.insert(alumno) != -1) {
					msj = new Mensaje("Usuario insertado con éxito", Mensaje.TIPO_SUCCESS);
				} else {
					msj = new Mensaje("No se ha insertado el usuario", Mensaje.TIPO_WARNING);
				}
			} else if (alumnoDao.update(alumno)) {
				msj = new Mensaje( 
						 MessageFormat.format(
								 	messages.getString("msj.registro.modificado"), 
								 	messages.getString("label.usuario")
								 ), 
						 Mensaje.TIPO_SUCCESS);
			} else {
				msj = new Mensaje("No se ha modificado el registro", Mensaje.TIPO_WARNING);
			}
			// listar
			listar(request);
	}

	private void eliminar(HttpServletRequest request) throws SQLException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			if (alumnoDao.delete(id)) {
				msj = new Mensaje("Registro eliminado con éxito", Mensaje.TIPO_SUCCESS);
			} else {
				msj = new Mensaje("No se ha eliminado el registro", Mensaje.TIPO_DANGER);
			}
		} catch (Exception e) {
			msj = new Mensaje("No se ha eliminado el registro", Mensaje.TIPO_DANGER);
		}
		listar(request);
	}

	/**
	 * Nos lleva a la vista del formulario para crear una persona
	 * 
	 * @param request
	 * @throws SQLException 
	 */
	private void nuevo(HttpServletRequest request) throws SQLException {
		Alumno al = new Alumno();
		request.setAttribute("alumno", al);
		
		dispatch = request.getRequestDispatcher( Constantes.VIEW_PUPIL_FORM );
	}

	private void listar(HttpServletRequest request) throws SQLException {
		
			// Llamar modelo para obtener listado
			ArrayList<Alumno> listaAlumnos = (ArrayList<Alumno>) alumnoDao.getAll();

			// Guardar listado como atributo en request
			request.setAttribute("listaAlumnos", listaAlumnos);

			// Petición interna a la jsp (RequestDistapecher es para decirle a donde tiene que ir, se carga el dispatcher)
			dispatch = request.getRequestDispatcher(Constantes.VIEW_PUPIL_LIST);
		
	}

	private void detalle(HttpServletRequest request) throws NumberFormatException, SQLException {
		pId = request.getParameter("id");
		Alumno al = alumnoDao.getById(Integer.parseInt(pId));
		request.setAttribute("alumno", al);
		dispatch = request.getRequestDispatcher(Constantes.VIEW_PUPIL_FORM );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
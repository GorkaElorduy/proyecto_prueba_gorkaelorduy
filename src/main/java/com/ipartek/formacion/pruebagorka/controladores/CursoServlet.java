package com.ipartek.formacion.pruebagorka.controladores;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.pruebagorka.pojo.Curso;
import com.ipartek.formacion.pruebapractica.pruebaGorka.Constantes;

/**
 * Servlet implementation class CursoServlet
 */
public class CursoServlet extends MasterServlet {
	private static final long serialVersionUID = 1L;

	private static int operacion;
	private static String pId; // Parámetro identificador del curso, aunque sea
								// un id, es un string, luego se parsea

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.service(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

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

			e.printStackTrace();

		}

	}

	/**
	 * Modifica o crea una nuevo curso
	 * 
	 * @param request
	 * @throws ParseException
	 * @throws SQLException
	 */

	private void modificarCrear(HttpServletRequest request)
			throws ParseException, SQLException {
		Integer.parseInt(request.getParameter("duracion"));

		String pNombreCurso = request.getParameter("nombre"), pNivel = request
				.getParameter("nivel_requerido"), pFechaInicio = request
				.getParameter("fechaInicio"), pFechaFin = request
				.getParameter("fechaFin"), pArea = request.getParameter("area");

		// construir persona
		Curso curso = new Curso();
		// curso.setId(pId);
		curso.setNombre_curso(pNombreCurso);
		curso.setNivel_requerido(pNivel);
		curso.setArea(pArea);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsedInicio = format.parse(pFechaInicio);
		curso.setFecha_inicio(new java.sql.Date(parsedInicio.getTime()));

		java.util.Date parsedFin = format.parse(pFechaFin);
		curso.setFecha_fin(new java.sql.Date(parsedFin.getTime()));

		// persistir en la bbdd
		if (curso.getId() == -1) {
			if (cursoDao.insert(curso) != -1) {
				msj = new Mensaje("Curso insertado con éxito",
						Mensaje.TIPO_SUCCESS);
			} else {
				msj = new Mensaje("No se ha insertado el curso",
						Mensaje.TIPO_WARNING);
			}
		} else if (cursoDao.update(curso)) {
			msj = new Mensaje(MessageFormat.format(
					messages.getString("msj.registro.modificado"),
					messages.getString("label.curso")), Mensaje.TIPO_SUCCESS);
		} else {
			msj = new Mensaje("No se ha modificado el registro",
					Mensaje.TIPO_WARNING);
		}
		// listar
		listar(request);

	}

	private void eliminar(HttpServletRequest request) throws SQLException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			if (cursoDao.delete(id)) {
				msj = new Mensaje("Registro eliminado con éxito",
						Mensaje.TIPO_SUCCESS);
			} else {
				msj = new Mensaje("No se ha eliminado el registro",
						Mensaje.TIPO_DANGER);
			}
		} catch (Exception e) {
			msj = new Mensaje("No se ha eliminado el registro",
					Mensaje.TIPO_DANGER);
		}
		listar(request);

	}

	/**
	 * Nos lleva a la vista del formulario para crear un curso
	 * 
	 * @param request
	 * @throws SQLException
	 */
	private void nuevo(HttpServletRequest request) throws SQLException {
		Curso curso = new Curso();
		request.setAttribute("curso", curso);
		cursoDao.getAll();
		dispatch = request.getRequestDispatcher(Constantes.VIEW_CURSO_FORM);

	}

	private void detalle(HttpServletRequest request)
			throws NumberFormatException, SQLException {
		pId = request.getParameter("id");
		Curso curso = cursoDao.getById(Integer.parseInt(pId));
		request.setAttribute("curso", curso);
		ArrayList<Curso> cursos = (ArrayList<Curso>) cursoDao.getAll();
		request.setAttribute("cursos", cursos);
		dispatch = request.getRequestDispatcher(Constantes.VIEW_CURSO_FORM);

	}

	private void listar(HttpServletRequest request) throws SQLException {
		// Llamar modelo para obtener listado

		ArrayList<Curso> listaCursos = (ArrayList<Curso>) cursoDao.getAll();

		// Guardar listado como atributo en request
		request.setAttribute("listaCursos", listaCursos);

		// Petición interna a la jsp (RequestDistapecher es para decirle a donde
		// tiene que ir, se carga el dispatcher)
		dispatch = request.getRequestDispatcher(Constantes.VIEW_CURSO_LIST);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.ipartek.formacion.pruebagorka.controladores;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.pruebagorka.modelo.AlumnoDao;
import com.ipartek.formacion.pruebagorka.pojo.Alumno;
import com.ipartek.formacion.pruebapractica.pruebaGorka.Constantes;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static AlumnoDao daoAlumno;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("1 petición a este servlet");
		daoAlumno = new AlumnoDao();
	}

	/**
	 * @see Servlet#destroy()
	 */
	@Override
	public void destroy() {
		System.out.println("Servlet destruido");
		daoAlumno = null;
	}

	/**
	 * Ahora se llamaría a este método y de este método llamaría a doGet o
	 * doPost mediante thread
	 */
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		super.service(request, response);

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * Hacemos lo mismo venga de doGet o doPost
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * @throws SQLException
	 */
	private void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Guardar el listado como atributo en request
		String criterio = request.getParameter("criterio");
		log("Buscando criterio " + criterio);
		ArrayList<Alumno> listaAlumnos = new ArrayList<Alumno>();

		try {
			listaAlumnos = (ArrayList<Alumno>) daoAlumno.getAll();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		// cargamos la jsp
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("listaUsuarios", listaAlumnos);
		request.setAttribute("criterio", criterio);
		request.getRequestDispatcher(Constantes.VIEW_PUPIL_SEARCH).forward(
				request, response);

	}
}

package com.ipartek.formacion.pruebagorka.controladores;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.pruebagorka.modelo.AlumnoDao;
import com.ipartek.formacion.pruebagorka.modelo.CursoDao;

/**
 * Servlet implementation class MasterServlet Servlet maestro que va a ser padre
 * de todos los servlets
 */
public class MasterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// DAOs
	protected static AlumnoDao alumnoDao;
	protected static CursoDao cursoDao;

	protected RequestDispatcher dispatch; // El que se encarga de enrutar. Solo
											// puede ir a un sitio, no se puede
											// cargar dos veces
	protected HttpSession session;

	protected ResourceBundle messages; // fichero de properties
	protected static Mensaje msj; // Mensaje a mostrar la usuario

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		alumnoDao = new AlumnoDao();
		cursoDao = new CursoDao();
	}

	/**
	 * @see Servlet#destroy()
	 */
	@Override
	public void destroy() {
		alumnoDao = null;
		cursoDao = null;
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		msj = null;
		session = request.getSession();
		// idioma = (String)session.getAttribute(
		// Constantes.SESSION_USER_LANGUAGE );
		super.service(request, response);
	}

}
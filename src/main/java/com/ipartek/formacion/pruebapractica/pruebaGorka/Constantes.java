package com.ipartek.formacion.pruebapractica.pruebaGorka;

/**
 * 
 * @author Gorka Constantes que se usan (RUTAS, SERVIDORES)
 *
 */
public class Constantes {

	// Generales
	public static final String APP_NAME = "gorka_v.1.0.0";
	public static final String SERVER = "http://localhost:8080/";
	public static final String ROOT = SERVER + APP_NAME + "/";

	// Variables session
	public static final String SESSION_USER_LOGGED = "userlogged";

	// OPERACIONES CONTROLADORES
	public static final int OP_NUEVO = 0;
	public static final int OP_DETALLE = 1;
	public static final int OP_LISTAR = 2;
	public static final int OP_MODIFICAR = 3;
	public static final int OP_ELIMINAR = 4;

	// CONTROLADORES
	public static final String CONTROLLER_LOGIN = "loginAlumno";

	public static final String CONTROLLER_ALUMNOS = "back/alumnos";
	public static final String CONTROLLER_CURSOS = "back/cursos";

	// VISTAS
	public static final String VIEW_LOGIN = "login.jsp";
	public static final String VIEW_INDEX = "index.jsp";
	
	public static final String VIEW_PUPIL_LIST = "/pages/users/alumnos.jsp";
	public static final String VIEW_PUPIL_FORM = "/pages/users/alumnoDetalle.jsp";
	

	public static final String VIEW_CURSO_FORM = "/pages/curso/form.jsp";
	public static final String VIEW_CURSO_LIST = "/pages/curso/list.jsp";

}

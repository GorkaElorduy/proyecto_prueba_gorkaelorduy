package com.ipartek.formacion.pruebagorka.pojo;

/**
 * Clase que representa a un alumno, con sus atributos y metodos
 * 
 * @author Curso
 *
 */
public class Alumno {

	/**
	 * Atributos de la clase alumno
	 * 
	 */

	private int id;
	private int id_curso;
	private String nombre;
	private String apellido_primero;
	private String dni;
	private String nivel_estudios;
	private int edad;

	/**
	 * Constructor de la clase alumno
	 */
	public Alumno() {
		super();
		this.id = -1;
		this.id_curso = -1;
		this.nombre = "";
		this.apellido_primero = "";
		this.dni = "";
		this.nivel_estudios = "";
		this.edad = 0;
	}

	/**
	 * Constructor con parametros
	 * 
	 * @param id
	 * @param id_curso
	 * @param nombre
	 * @param apellido_primero
	 * @param dni
	 * @param nivel_estudios
	 * @param edad
	 */
	public Alumno(int id, int id_curso, String nombre, String apellido_primero,
			String dni, String nivel_estudios, int edad) {
		super();
		this.id = id;
		this.id_curso = id_curso;
		this.nombre = nombre;
		this.apellido_primero = apellido_primero;
		this.dni = dni;
		this.nivel_estudios = nivel_estudios;
		this.edad = edad;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the id_curso
	 */
	public int getId_curso() {
		return id_curso;
	}

	/**
	 * @param id_curso
	 *            the id_curso to set
	 */
	public void setId_curso(int id_curso) {
		this.id_curso = id_curso;
	}

	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre
	 *            the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the apellido_primero
	 */
	public String getApellido_primero() {
		return apellido_primero;
	}

	/**
	 * @param apellido_primero
	 *            the apellido_primero to set
	 */
	public void setApellido_primero(String apellido_primero) {
		this.apellido_primero = apellido_primero;
	}

	/**
	 * @return the dni
	 */
	public String getDni() {
		return dni;
	}

	/**
	 * @param dni
	 *            the dni to set
	 */
	public void setDni(String dni) {
		this.dni = dni;
	}

	/**
	 * @return the nivel_estudios
	 */
	public String getNivel_estudios() {
		return nivel_estudios;
	}

	/**
	 * @param nivel_estudios
	 *            the nivel_estudios to set
	 */
	public void setNivel_estudios(String nivel_estudios) {
		this.nivel_estudios = nivel_estudios;
	}

	/**
	 * @return the edad
	 */
	public int getEdad() {
		return edad;
	}

	/**
	 * @param edad
	 *            the edad to set
	 */
	public void setEdad(int edad) {
		this.edad = edad;
	}

}

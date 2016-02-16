package com.ipartek.formacion.pruebagorka.pojo;

import java.util.Date;

/**
 * Clase que es el molde para cursos, con sus atributos y metodos
 * 
 * @author Curso
 *
 */
public class Curso {
	/**
	 * Atributos de la clase curso
	 */
	private int id;
	private String nombre_curso;
	private Date fecha_inicio;
	private Date fecha_fin;
	private String nivel_requerido;
	private String area;
	private int duracion;

	/**
	 * Constructores de la clase Curso
	 */
	public Curso() {
		super();
		this.id = -1;
		this.nombre_curso = "";
		this.fecha_inicio = null;
		this.fecha_fin = null;
		this.nivel_requerido = "";
		this.area = "";
		this.duracion = 0;
	}

	public Curso(int id, String nombre_curso, Date fecha_inicio,
			Date fecha_fin, String nivel_requerido, String area, int duracion) {
		super();
		this.id = id;
		this.nombre_curso = nombre_curso;
		this.fecha_inicio = fecha_inicio;
		this.fecha_fin = fecha_fin;
		this.nivel_requerido = nivel_requerido;
		this.area = area;
		this.duracion = duracion;
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
	 * @return the nombre_curso
	 */
	public String getNombre_curso() {
		return nombre_curso;
	}

	/**
	 * @param nombre_curso
	 *            the nombre_curso to set
	 */
	public void setNombre_curso(String nombre_curso) {
		this.nombre_curso = nombre_curso;
	}

	/**
	 * @return the fecha_inicio
	 */
	public Date getFecha_inicio() {
		return fecha_inicio;
	}

	/**
	 * @param fecha_inicio
	 *            the fecha_inicio to set
	 */
	public void setFecha_inicio(Date fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}

	/**
	 * @return the fecha_fin
	 */
	public Date getFecha_fin() {
		return fecha_fin;
	}

	/**
	 * @param fecha_fin
	 *            the fecha_fin to set
	 */
	public void setFecha_fin(Date fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	/**
	 * @return the nivel_requerido
	 */
	public String getNivel_requerido() {
		return nivel_requerido;
	}

	/**
	 * @param nivel_requerido
	 *            the nivel_requerido to set
	 */
	public void setNivel_requerido(String nivel_requerido) {
		this.nivel_requerido = nivel_requerido;
	}

	/**
	 * @return the area
	 */
	public String getArea() {
		return area;
	}

	/**
	 * @param area
	 *            the area to set
	 */
	public void setArea(String area) {
		this.area = area;
	}

	/**
	 * @return the duracion
	 */
	public int getDuracion() {
		return duracion;
	}

	/**
	 * @param duracion
	 *            the duracion to set
	 */
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

}

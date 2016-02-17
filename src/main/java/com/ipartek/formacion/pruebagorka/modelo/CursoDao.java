package com.ipartek.formacion.pruebagorka.modelo;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.formacion.pruebagorka.pojo.Curso;
import com.mysql.jdbc.PreparedStatement;

/**
 * Clase que representa el DAO de cursos CRUD: CREATE, READ, UPDATE Y DELETE
 * 
 * @author Curso
 *
 */
public class CursoDao implements Persistable<Curso> {
	/**
	 * Nos devuelve todos los cursos de nuestra BBDD
	 */
	public List<Curso> getAll() throws SQLException {
		DbConnection conn = new DbConnection();
		String sentencia = "select " + "`cursos.id`, "
				+ "`cursos.nombre_curso`, " + "`cursos.fecha_inicio`, "
				+ "`cursos.fecha_fin`, " + "`cursos.nivel_requerido`, "
				+ " cursos.area, " + "`cursos.duracion`  from `cursos`;";
		PreparedStatement consulta = (PreparedStatement) conn.getConnection()
				.prepareStatement(sentencia);
		ResultSet result = consulta.executeQuery();
		ArrayList<Curso> cursos = new ArrayList<Curso>();
		while (result.next()) {
			cursos.add(mapeo(result));
		}
		result.close();
		consulta.close();
		conn.desconectar();
		return cursos;
	}

	public Curso getById(int id) throws SQLException {
		// Se abre conexión
		DbConnection conn = new DbConnection();
		// nombre de la clase y ctrl + espacio
		String sql = "select `cursos.id`, `cursos.nombre_curso`, `cursos.fecha_inicio`, `cursos.fecha_fin`,"
				+ " `cursos.nivel_requerido`, "
				+ " cursos.area, "
				+ "cursos.duracion " + " from curso " + " where `id` = ?;";

		PreparedStatement consulta = (PreparedStatement) conn.getConnection()
				.prepareStatement(sql);
		consulta.setInt(1, id);
		// ejecutar la consulta
		ResultSet res = consulta.executeQuery();

		// iterar sobre los resultados (SOLO HAY UNO)
		res.next();
		Curso c = mapeo(res);

		res.close();
		consulta.close();
		conn.desconectar();
		return c;
	}

	public boolean delete(int id) throws SQLException {
		DbConnection conn = new DbConnection();
		boolean resul = false;
		String sql = "delete from `cursos` where `id` = ?;";
		PreparedStatement pst = (PreparedStatement) conn.getConnection()
				.prepareStatement(sql);
		pst.setInt(1, id);
		if (pst.executeUpdate() == 1) {
			resul = true;
		}
		return resul;

	}

	public boolean update(Curso persistable) throws SQLException {
		boolean resul = false;
		if (persistable != null) {
			DbConnection conn = new DbConnection();
			String sql = "update `cursos` set nombre_curso = ?, feha_inicio = ?, fecha_fin = ?, nivel_requerido = ?, area = ?, duracion = ? where `id` = ? ;";
			PreparedStatement pst = (PreparedStatement) conn.getConnection()
					.prepareStatement(sql);
			pst.setString(1, persistable.getNombre_curso());
			pst.setDate(2, (Date) persistable.getFecha_inicio());
			pst.setDate(3, (Date) persistable.getFecha_fin());
			pst.setString(4, persistable.getNivel_requerido());
			pst.setString(5, persistable.getArea());
			pst.setInt(6, persistable.getDuracion());
			pst.setInt(7, persistable.getId());

			if (pst.executeUpdate() == 1) {
				resul = true;
			}
		}
		return resul;

	}

	public int insert(Curso persistable) throws SQLException {
		int i;
		// Se abre conexión (COMO SIEMPRE)
		DbConnection conn = new DbConnection();
		try {
			String sql = "INSERT INTO `cursos` (`nombre_curso`, `fecha_inicio`, `fecha_fin`, `nivel_requerido`, `area`,`duracion´) VALUES (?,?,?,?,?,?);";
			PreparedStatement pst = (PreparedStatement) conn.getConnection()
					.prepareStatement(sql,
							PreparedStatement.RETURN_GENERATED_KEYS);

			pst.setString(1, persistable.getNombre_curso());
			pst.setDate(2, (Date) persistable.getFecha_inicio());
			pst.setDate(3, (Date) persistable.getFecha_fin());
			pst.setString(4, persistable.getNivel_requerido());
			pst.setString(5, persistable.getArea());
			pst.setInt(6, persistable.getDuracion());
			// ejecutar la consulta. Si no afecta a una línea, lanzamos la
			// excepción
			if (pst.executeUpdate() != 1) {
				throw new SQLException("No se ha insertado el dato");
			}

			ResultSet generatedKeys = pst.getGeneratedKeys();
			generatedKeys.next();
			i = generatedKeys.getInt(1);
			persistable.setId(i);
			pst.close();

		} catch (Exception e) {
			i = -1;
			e.printStackTrace();
		}
		conn.desconectar();
		return i;
	}

	private Curso mapeo(ResultSet res) throws SQLException {

		Curso c = new Curso();
		c.setId(res.getInt("id"));
		c.setNombre_curso(res.getString("nombre_curso"));
		c.setFecha_inicio(res.getDate("fecha_inicio"));
		c.setFecha_fin(res.getDate("fecha_fin"));
		c.setNivel_requerido(res.getString("nivel_requerido"));
		c.setArea(res.getString("area"));
		c.setDuracion(res.getInt("duracion"));

		return c;
	}

}

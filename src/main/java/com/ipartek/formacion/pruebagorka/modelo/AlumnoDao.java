package com.ipartek.formacion.pruebagorka.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.formacion.pruebagorka.pojo.Alumno;

public class AlumnoDao implements Persistable<Alumno> {

	public List<Alumno> getAll() throws SQLException {
		DbConnection conn = new DbConnection();

		String sentencia = "select " + "`alumnos.id`, " + "`alumnos.nombre`, "
				+ "`alumnos.apellido_primero`, " + "`alumnos.dni`, "
				+ "`alumnos.nivel_estudios`, " + " alumnos.edad"
				+ " from `alumnos`;";
		PreparedStatement consulta = conn.getConnection().prepareStatement(
				sentencia);
		ResultSet res = consulta.executeQuery();
		ArrayList<Alumno> alumnos = new ArrayList<Alumno>();

		while (res.next()) {
			alumnos.add(mapeo(res));
		}
		res.close();
		consulta.close();
		conn.desconectar();

		return alumnos;
	}

	public Alumno getById(int id) throws SQLException {
		// Se abre conexión
		DbConnection conn = new DbConnection();
		// nombre de la clase y ctrl + espacio
		String sql = "select `alumnos.id`, alumnos.id_curso, `alumnos.nombre`, `alumnos.apellido_primero`, `alumnos.dni`,"
				+ " `alumnos.nivel_estudios`, "
				+ " alumnos.edad "
				+ " from alumnos " + " where `id` = ?;";

		PreparedStatement consulta = conn.getConnection().prepareStatement(sql);
		consulta.setInt(1, id);
		// ejecutar la consulta
		ResultSet res = consulta.executeQuery();

		// iterar sobre los resultados
		res.next();
		Alumno alumno = mapeo(res);

		res.close();
		consulta.close();
		conn.desconectar();
		return alumno;
	}

	public boolean delete(int id) throws SQLException {
		DbConnection conn = new DbConnection();
		boolean resul = false;
		String sql = "delete from `alumnos` where `id` = ?;";
		PreparedStatement pst = conn.getConnection().prepareStatement(sql);
		pst.setInt(1, id);
		if (pst.executeUpdate() == 1) {
			resul = true;
		}
		return resul;
	}

	public boolean update(Alumno persistable) throws SQLException {

		boolean resul = false;
		if (persistable != null) {
			DbConnection conn = new DbConnection();
			String sql = "update `alumnos` set nombre = ?, apellido_primero = ?, dni = ?, nivel_estudios = ?, edad = ? where `id` = ? ;";
			PreparedStatement pst = conn.getConnection().prepareStatement(sql);
			pst.setString(1, persistable.getNombre());
			pst.setString(2, persistable.getApellido_primero());
			pst.setString(3, persistable.getDni());
			pst.setString(4, persistable.getNivel_estudios());
			pst.setInt(5, persistable.getEdad());
			pst.setInt(6, persistable.getId());

			if (pst.executeUpdate() == 1) {
				resul = true;
			}
		}
		return resul;
	}

	public int insert(Alumno persistable) throws SQLException {
		int i;
		// Se abre conexión
		DbConnection conn = new DbConnection();
		try {
			String sql = "INSERT INTO `alumnos` (`id_curso`,`nombre`, `apellido_primero`, `dni`, `nivel_estudios`, `edad`) VALUES (?,?,?,?,?,?);";
			PreparedStatement pst = conn.getConnection().prepareStatement(sql,
					PreparedStatement.RETURN_GENERATED_KEYS);

			pst.setInt(1, persistable.getId_curso());
			pst.setString(2, persistable.getNombre());
			pst.setString(3, persistable.getApellido_primero());
			pst.setString(4, persistable.getDni());
			pst.setString(5, persistable.getNivel_estudios());
			pst.setInt(6, persistable.getEdad());
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

	private Alumno mapeo(ResultSet res) throws SQLException {

		Alumno al = new Alumno();
		al.setId(res.getInt("id"));
		al.setId_curso(res.getInt("id_curso"));
		al.setNombre(res.getString("nombre"));
		al.setApellido_primero(res.getString("apellido_primero"));
		al.setDni(res.getString("dni"));
		al.setNivel_estudios(res.getString("nivel_estudios"));
		al.setEdad(res.getInt("edad"));

		return al;
	}

	public Alumno login(String nombre, String apellido) throws SQLException {
		
		//para ENTRAR al login, se usa nombre y apellido
		Alumno alumno = null;
		DbConnection conn = new DbConnection();
		String sentencia = "select `alumnos.id`, alumnos.id_curso, `alumnos.nombre`, `alumnos.apellido_primero`, `alumnos.dni`,"
				+ " `alumnos.nivel_estudios`, "
				+ " alumnos.edad "
				+ " from alumnos " + " where `alumnos.nombre` = ? and alumnos.apellido_primero = ?;";

		PreparedStatement pst = conn.getConnection().prepareStatement(sentencia);
		pst.setString(1,nombre);
		pst.setString(2,nombre);
		//EJECUTAMOS LA CONSULTA
		ResultSet rs = pst.executeQuery();
		rs.next();
		
		alumno = mapeo(rs);
		
		return alumno;
	}

}
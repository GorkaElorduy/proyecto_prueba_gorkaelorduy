package com.ipartek.formacion.pruebatest;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Ignore;

import com.ipartek.formacion.pruebagorka.modelo.AlumnoDao;
import com.ipartek.formacion.pruebagorka.modelo.DbConnection;
import com.ipartek.formacion.pruebagorka.pojo.Alumno;

/**
 * 
 * @author Curso TESTEO DE ALUMNOS. COMPROBAR SI DA FALLOS
 */
public class AlumnoDaoTest {

	static DbConnection db;
	static Connection conn;
	static AlumnoDao dao;
	static Alumno aMock1, aMock2;
	static int id1, id2; // identificador de la última operación realizada en el

	// PARA EL CHECK STYLE, HABRIA QUE DECLARAR VARIABLES
	// PARA NOMBRES Y EDADES

	@Ignore
	public static void setUpBeforeClass() throws Exception {

		db = new DbConnection();
		conn = db.getConnection();
		conn.setAutoCommit(false);
		dao = new AlumnoDao();
	}

	@Ignore
	public static void tearDownAfterClass() throws Exception {
		conn.rollback();
		db.desconectar();
		db = null;
		dao = null;
	}

	@Ignore
	public void setUp() throws Exception {

		aMock1 = new Alumno(3, "Pepito", "Perez", "11111111H", "ESO", 30);
		aMock2 = new Alumno(4, "Juanito", "Gonzalez", "44444444G", "Ingeniero",
				50);

		id1 = dao.insert(aMock1);
		assertTrue("No se ha realizado la inserción", id1 > 0);
	}

	@Ignore
	public void tearDown() {
		try {
			assertTrue("No se pudo eliminar", dao.delete(id1));
		} catch (SQLException e) {
			fail("Hay algún problema en el test: " + e.getMessage());
		}
	}

	@Ignore
	public void testGetAll() {
		try {
			int personasSize = dao.getAll().size();
			assertTrue("debería al menos recuperar una persona",
					personasSize > 0);
			id2 = dao.insert(aMock2);
			assertTrue("No se ha realizado la inserción", id2 > 0);

			assertTrue("No se pudo eliminar", dao.delete(id2));
		} catch (SQLException e) {
			fail("Hay algún problema en el test: " + e.getMessage());
		}
	}

	@Ignore
	public void testGetById() {
		Alumno alumno1;
		try {
			alumno1 = dao.getById(id1);
			System.out.println(aMock1 + "\n" + alumno1);
			assertTrue("No tienen los mismos atributos", aMock1.equals(alumno1));
		} catch (SQLException e) {
			fail("Hay algún problema en el test: " + e.getMessage());
		}
	}

	// Comprobar caso de id inexistente
	@Ignore
	public void testDelete() {
		try {
			assertFalse("No puede eliminar lo que no existe", dao.delete(-1));
		} catch (SQLException e) {
			fail("Hay algún problema en el test: " + e.getMessage());
		}
	}

	@Ignore
	public void testUpdate() {
		try {
			Alumno alumno2 = dao.getById(id1);
			alumno2.setDni("12345678E");
			alumno2.setNombre("Gorka");
			alumno2.setEdad(35);
			assertTrue(dao.update(alumno2));
			assertTrue("No tienen los mismos atributos",
					alumno2.equals(dao.getById(id1)));

			// Test null
			assertFalse(
					"no se puede modifica la base una persona que no existe",
					dao.update(null));

			// Test persona vacia
			Alumno alumno3 = new Alumno();
			assertFalse(
					"no se puede modifica la base una persona que no existe",
					dao.update(alumno3));

		} catch (SQLException e) {
			fail("Hay algún problema en el test: " + e.getMessage());
		}

		// Test persona que no existe
	}

}
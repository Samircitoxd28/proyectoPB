/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Tuf
 */
public class pruebaconexion {
     private static final String URL = "jdbc:postgresql://localhost:5432/proyectopw";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";

    public static void main(String[] args) {
        Connection connection = null;

        try {
            // Intentar conectar a la base de datos
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            if (connection != null) {
                System.out.println("Conexión exitosa a la base de datos!");
            }
        } catch (SQLException e) {
            // Manejo de errores en la conexión
            System.err.println("Error al conectar a la base de datos:");
            e.printStackTrace();
        } finally {
            // Cerrar la conexión si fue abierta
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

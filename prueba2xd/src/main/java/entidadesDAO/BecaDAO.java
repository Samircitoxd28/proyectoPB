/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidadesDAO;

import entidades.Beca;
import conexion.conexionbd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO para gestionar los datos de la tabla becas
 */
public class BecaDAO {

    // Método para obtener la lista de becas con paginación
    public List<Beca> getListadoBecas(int pagina, int cantidad) {
        List<Beca> listaBecas = new ArrayList<>();
        String strSQL = "SELECT * FROM becas ORDER BY id ASC LIMIT ? OFFSET ?";

        try (Connection con = conexionbd.getConnection();
             PreparedStatement pst = con.prepareStatement(strSQL)) {

            pst.setInt(1, cantidad);
            pst.setInt(2, (pagina - 1) * cantidad);
            ResultSet rst = pst.executeQuery();

            while (rst.next()) {
                Beca beca = new Beca();
                beca.setId(rst.getInt("id"));
                beca.setTitulo(rst.getString("titulo"));
                beca.setTipo(rst.getString("tipo"));
                beca.setCarrera(rst.getString("carrera"));
                beca.setDescripcion(rst.getString("descripcion"));
                beca.setFechaInicio(rst.getDate("fecha_inicio"));
                beca.setFechaFin(rst.getDate("fecha_fin"));
                beca.setCupos(rst.getInt("cupos"));
                beca.setPorcentaje(rst.getInt("porcentaje"));
                beca.setGenero(rst.getString("genero"));
                beca.setNacionalidad(rst.getString("nacionalidad"));
                beca.setSoloDiscapacitados(rst.getBoolean("solo_discapacitados"));
                beca.setTipoDiscapacidad(rst.getString("tipo_discapacidad"));
                beca.setPorcentajeDiscapacidad(rst.getInt("porcentaje_discapacidad"));

                listaBecas.add(beca);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
        return listaBecas;
    }

    // Método para contar el total de becas
    public int contarBecas() {
        int total = 0;
        String strSQL = "SELECT COUNT(*) FROM becas";

        try (Connection con = conexionbd.getConnection();
             PreparedStatement pst = con.prepareStatement(strSQL);
             ResultSet rst = pst.executeQuery()) {

            if (rst.next()) {
                total = rst.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
}

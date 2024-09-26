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
    public List<Beca> getListadoBecas(int pagina, int cantidad, String titulo, String tipo, String carrera, Integer porcentaje, String genero, String nacionalidad, Boolean soloDiscapacitados) {
        List<Beca> listaBecas = new ArrayList<>();
        StringBuilder strSQL = new StringBuilder("SELECT * FROM becas WHERE 1=1");

        if (!titulo.isEmpty()) {
            strSQL.append(" AND titulo LIKE ?");
        }
        if (!tipo.isEmpty()) {
            strSQL.append(" AND tipo = ?");
        }
        if (!carrera.isEmpty()) {
            strSQL.append(" AND carrera = ?");
        }
        if (porcentaje != null) {
            strSQL.append(" AND porcentaje >= ?");
        }
        if (!genero.isEmpty()) {
            strSQL.append(" AND genero = ?");
        }
        if (!nacionalidad.isEmpty()) {
            strSQL.append(" AND nacionalidad = ?");
        }
        if (soloDiscapacitados != null && soloDiscapacitados) {
            strSQL.append(" AND solo_discapacitados = true");
        }

        strSQL.append(" ORDER BY id ASC LIMIT ? OFFSET ?");

        try (Connection con = conexionbd.getConnection(); PreparedStatement pst = con.prepareStatement(strSQL.toString())) {

            int index = 1;

            if (!titulo.isEmpty()) {
                pst.setString(index++, "%" + titulo + "%");
            }
            if (!tipo.isEmpty()) {
                pst.setString(index++, tipo);
            }
            if (!carrera.isEmpty()) {
                pst.setString(index++, carrera);
            }
            if (porcentaje != null) {
                pst.setInt(index++, porcentaje);
            }
            if (!genero.isEmpty()) {
                pst.setString(index++, genero);
            }
            if (!nacionalidad.isEmpty()) {
                pst.setString(index++, nacionalidad);
            }
            pst.setInt(index++, cantidad);
            pst.setInt(index++, (pagina - 1) * cantidad);

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
    public int contarBecas(String titulo, String tipo, String carrera, Integer porcentaje, String genero, String nacionalidad, Boolean soloDiscapacitados) {
    int total = 0;
    StringBuilder strSQL = new StringBuilder("SELECT COUNT(*) FROM becas WHERE 1=1");
    
    if (!titulo.isEmpty()) {
        strSQL.append(" AND titulo LIKE ?");
    }
    if (!tipo.isEmpty()) {
        strSQL.append(" AND tipo = ?");
    }
    if (!carrera.isEmpty()) {
        strSQL.append(" AND carrera = ?");
    }
    if (porcentaje != null) {
        strSQL.append(" AND porcentaje >= ?");
    }
    if (!genero.isEmpty()) {
        strSQL.append(" AND genero = ?");
    }
    if (!nacionalidad.isEmpty()) {
        strSQL.append(" AND nacionalidad = ?");
    }
    if (soloDiscapacitados != null && soloDiscapacitados) {
        strSQL.append(" AND solo_discapacitados = true");
    }

    try (Connection con = conexionbd.getConnection();
         PreparedStatement pst = con.prepareStatement(strSQL.toString())) {

        int index = 1;

        if (!titulo.isEmpty()) {
            pst.setString(index++, "%" + titulo + "%");
        }
        if (!tipo.isEmpty()) {
            pst.setString(index++, tipo);
        }
        if (!carrera.isEmpty()) {
            pst.setString(index++, carrera);
        }
        if (porcentaje != null) {
            pst.setInt(index++, porcentaje);
        }
        if (!genero.isEmpty()) {
            pst.setString(index++, genero);
        }
        if (!nacionalidad.isEmpty()) {
            pst.setString(index++, nacionalidad);
        }
        
        ResultSet rst = pst.executeQuery();
        if (rst.next()) {
            total = rst.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return total;
}
}

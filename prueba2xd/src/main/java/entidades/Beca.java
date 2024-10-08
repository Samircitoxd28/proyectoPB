/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Clase Beca para representar la entidad Beca en la base de datos
 */
    // Constructor vacío
    public class Beca {
    private int id;
    private String titulo;
    private String tipo;
    private String carrera;
    private String descripcion;
    private Date fechaInicio;
    private Date fechaFin;
    private int cupos;
    private int porcentaje;
    private String genero;
    private String nacionalidad;
    private boolean soloDiscapacitados;
    private String tipoDiscapacidad;
    private int porcentajeDiscapacidad;
    private boolean confirmacion;
    private Timestamp fechaCreacion; // Cambiado a Timestamp

    // Constructor vacío
    public Beca() {
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getCarrera() { return carrera; }
    public void setCarrera(String carrera) { this.carrera = carrera; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public Date getFechaInicio() { return fechaInicio; }
    public void setFechaInicio(Date fechaInicio) { this.fechaInicio = fechaInicio; }

    public Date getFechaFin() { return fechaFin; }
    public void setFechaFin(Date fechaFin) { this.fechaFin = fechaFin; }

    public int getCupos() { return cupos; }
    public void setCupos(int cupos) { this.cupos = cupos; }

    public int getPorcentaje() { return porcentaje; }
    public void setPorcentaje(int porcentaje) { this.porcentaje = porcentaje; }

    public String getGenero() { return genero; }
    public void setGenero(String genero) { this.genero = genero; }

    public String getNacionalidad() { return nacionalidad; }
    public void setNacionalidad(String nacionalidad) { this.nacionalidad = nacionalidad; }

    public boolean isSoloDiscapacitados() { return soloDiscapacitados; }
    public void setSoloDiscapacitados(boolean soloDiscapacitados) { this.soloDiscapacitados = soloDiscapacitados; }

    public String getTipoDiscapacidad() { return tipoDiscapacidad; }
    public void setTipoDiscapacidad(String tipoDiscapacidad) { this.tipoDiscapacidad = tipoDiscapacidad; }

    public int getPorcentajeDiscapacidad() { return porcentajeDiscapacidad; }
    public void setPorcentajeDiscapacidad(int porcentajeDiscapacidad) { this.porcentajeDiscapacidad = porcentajeDiscapacidad; }

    public boolean isConfirmacion() { return confirmacion; }
    public void setConfirmacion(boolean confirmacion) { this.confirmacion = confirmacion; }

    public Timestamp getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(Timestamp fechaCreacion) { this.fechaCreacion = fechaCreacion; }
}
    
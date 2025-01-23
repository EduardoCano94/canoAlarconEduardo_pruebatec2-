package com.hackaboss.logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "turno")
public class Turno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String numeroTurno;

    @Temporal(TemporalType.DATE)
    private Date fecha;

    private String estado; // "En espera" o "Ya atendido"
   
    @Column
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "ciudadano_id", nullable = false)
    private Ciudadano ciudadano;

    @ManyToOne
    @JoinColumn(name = "tramite_id", nullable = false)
    private Tramite tramite;
    


    public Turno() {
    }

    public Turno(String numeroTurno, Date fecha, String estado, String descripcion, Ciudadano ciudadano, Tramite tramite) {
        this.numeroTurno = numeroTurno;
        this.fecha = fecha;
        this.estado = estado;
        this.descripcion = descripcion;
        this.ciudadano = ciudadano;
        this.tramite = tramite;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumeroTurno() {
        return numeroTurno;
    }

    public void setNumeroTurno(String numeroTurno) {
        this.numeroTurno = numeroTurno;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

    public Tramite getTramite() {
        return tramite;
    }

    public void setTramite(Tramite tramite) {
        this.tramite = tramite;
    }

   
}
package com.hackaboss.logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "tramite")
public class Tramite implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 100)
    private String nombre;

    @Column
    private String descripcion;
    @OneToMany(mappedBy = "tramite", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Turno> turnos;

    public Tramite() {
    }

    public Tramite( String descripcion, List<Turno> turnos) {
        this.descripcion = descripcion;
        this.turnos = turnos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public List<Turno> getTurnos() {
        return turnos;
    }

    public void setTurnos(List<Turno> turnos) {
        this.turnos = turnos;
    }
}

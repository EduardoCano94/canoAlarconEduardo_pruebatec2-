package com.hackaboss.logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
public class Ciudadano implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;
    private String apellido;
    private String dni;

    @OneToMany(mappedBy = "ciudadano", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Turno> turnos;

    public Ciudadano() {
    }

    public Ciudadano(String nombre, String apellido, String dni, List<Turno> turnos) {

        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.turnos = turnos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public List<Turno> getTurnos() {
        return turnos;
    }

    public void setTurnos(List<Turno> turnos) {
        this.turnos = turnos;
    }
}

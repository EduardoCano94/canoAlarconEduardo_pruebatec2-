package com.hackaboss.logica;

import com.hackaboss.persistencia.*;
import com.hackaboss.persistencia.exceptions.IllegalOrphanException;
import com.hackaboss.persistencia.exceptions.NonexistentEntityException;
import java.util.Date;
import java.util.List;

public class ControladoraLogica {

    private final CiudadanoJpaController ciudadanoController = new CiudadanoJpaController();
    private final TurnoJpaController turnoController = new TurnoJpaController();
    private final TramiteJpaController tramiteController = new TramiteJpaController();
    private final UsuarioJpaController usuarioController = new UsuarioJpaController();

    // CRUD para Ciudadano
    public void crearCiudadano(String nombre, String apellido, String dni) {
        Ciudadano ciudadano = new Ciudadano();
        ciudadano.setNombre(nombre);
        ciudadano.setApellido(apellido);
        ciudadano.setDni(dni);
        ciudadanoController.create(ciudadano);
    }

    public List<Ciudadano> listarCiudadanos() {
        return ciudadanoController.findCiudadanoEntities();
    }

    public Ciudadano buscarCiudadano(Long id) {
        return ciudadanoController.findCiudadano(id);
    }

    public void actualizarCiudadano( Long id,String nombre, String apellido, String dni) throws NonexistentEntityException, Exception {
        Ciudadano ciudadano = ciudadanoController.findCiudadano(id);
        if (ciudadano != null) {
            ciudadano.setNombre(nombre);
            ciudadano.setApellido(apellido);
            ciudadano.setDni(dni);
            ciudadanoController.edit(ciudadano);
        }
    }

    public void eliminarCiudadano(Long id) throws IllegalOrphanException, NonexistentEntityException {
        ciudadanoController.destroy(id);
    }

    // CRUD para Trámite
    public void crearTramite(String descripcion) {
        Tramite tramite = new Tramite();
        tramite.setDescripcion(descripcion);
        tramiteController.create(tramite);
    }

    public List<Tramite> listarTramites() {
        return tramiteController.findTramiteEntities();
    }

    public Tramite buscarTramite(Long id) {
        return tramiteController.findTramite(id);
    }

    public void actualizarTramite(Long id, String descripcion) throws NonexistentEntityException, Exception {
        Tramite tramite = tramiteController.findTramite(id);
        if (tramite != null) {
            tramite.setDescripcion(descripcion);
            tramiteController.edit(tramite);
        }
    }

    public void eliminarTramite(Long id) throws IllegalOrphanException, NonexistentEntityException {
        tramiteController.destroy(id);
    }

    // CRUD para Turno
    public void crearTurno(String numeroTurno, String descripcion, String estado, Date fecha, Long ciudadanoId, Long tramiteId) {
        Turno turno = new Turno();
        turno.setNumeroTurno(numeroTurno);
        turno.setDescripcion(descripcion);
        turno.setEstado(estado);
        turno.setFecha(fecha);
        turno.setCiudadano(ciudadanoController.findCiudadano(ciudadanoId));
        turno.setTramite(tramiteController.findTramite(tramiteId));
        turnoController.create(turno);
    }

    public List<Turno> listarTurnos() {
        return turnoController.findTurnoEntities();
    }

    public List<Turno> listarTurnosPorFecha(Date fecha) {
        return turnoController.findTurnosByFecha(fecha);
    }

    public Turno buscarTurno(Long id) {
        return turnoController.findTurno(id);
    }

    public void actualizarTurno(Long id, String descripcion, String estado, Date fecha, Long ciudadanoId, Long tramiteId) throws Exception {
        Turno turno = turnoController.findTurno(id);
        if (turno != null) {
            turno.setDescripcion(descripcion);
            turno.setEstado(estado);
            turno.setFecha(fecha);
            turno.setCiudadano(ciudadanoController.findCiudadano(ciudadanoId));
            turno.setTramite(tramiteController.findTramite(tramiteId));
            turnoController.edit(turno);
        }
    }

    public void actualizarEstadoTurno(Long id, String nuevoEstado) throws Exception {
        Turno turno = turnoController.findTurno(id);
        if (turno != null) {
            turno.setEstado(nuevoEstado);
            turnoController.edit(turno);
        }
    }

    public void eliminarTurno(Long id) throws NonexistentEntityException {
        turnoController.destroy(id);
    }

    // CRUD para Usuario
    public void crearUsuario(String nombre, String contrasena) {
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setContrasena(contrasena);
        usuarioController.create(usuario);
    }

    public List<Usuario> listarUsuarios() {
        return usuarioController.findUsuarioEntities();
    }

    public Usuario buscarUsuario(Long id) {
        return usuarioController.findUsuario(id);
    }

    public void actualizarUsuario(Long id, String nombre, String contrasena) {
        Usuario usuario = usuarioController.findUsuario(id);
        if (usuario != null) {
            usuario.setNombre(nombre);
            usuario.setContrasena(contrasena);
            usuarioController.edit(usuario);
        }
    }

    public void eliminarUsuario(Long id) {
        usuarioController.destroy(id);
    }

   
}

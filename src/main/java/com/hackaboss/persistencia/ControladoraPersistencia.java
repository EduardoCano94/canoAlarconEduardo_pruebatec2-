package com.hackaboss.persistencia;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.Tramite;
import com.hackaboss.logica.Turno;
import com.hackaboss.logica.Usuario;
import java.util.List;

public class ControladoraPersistencia {
   private final CiudadanoJpaController ciudadanoController = new CiudadanoJpaController();
    private final TurnoJpaController turnoController = new TurnoJpaController();
    private final TramiteJpaController tramiteController = new TramiteJpaController();
    private final UsuarioJpaController usuarioController = new UsuarioJpaController();

    // Operaciones con Ciudadano
    public void crearCiudadano(Ciudadano ciudadano) throws Exception {
        ciudadanoController.create(ciudadano);
    }

    public Ciudadano buscarCiudadano(Long id) {
        return ciudadanoController.findCiudadano(id);
    }

    public List<Ciudadano> listarCiudadanos() {
        return ciudadanoController.findCiudadanoEntities();
    }
    public void eliminarCiudadano(Long id) throws Exception{
         ciudadanoController.destroy(id);
    }
            
    // Operaciones con Turno
    public void crearTurno(Turno turno) throws Exception {
        turnoController.create(turno);
    }

    public Turno buscarTurno(Long id) {
        return turnoController.findTurno(id);
    }

    public List<Turno> listarTurnos() {
        return turnoController.findTurnoEntities();
    }

    public void actualizarTurno(Turno turno) throws Exception {
        turnoController.edit(turno);
    }

    public void eliminarTurno(Long id) throws Exception {
        turnoController.destroy(id);
    }

    // Operaciones con Tramite
    public void crearTramite(Tramite tramite) throws Exception {
        tramiteController.create(tramite);
    }

    public Tramite buscarTramite(Long id) {
        return tramiteController.findTramite(id);
    }
    
    public void actualizarTramite(Turno turno) throws Exception {
        turnoController.edit(turno);
    }

    public List<Tramite> listarTramites() {
        return tramiteController.findTramiteEntities();
    }

    // Operaciones con Usuario
    public void crearUsuario(Usuario usuario) throws Exception {
        usuarioController.create(usuario);
    }

    public Usuario buscarUsuario(Long id) {
        return usuarioController.findUsuario(id);
    }

    public List<Usuario> listarUsuarios() {
        return usuarioController.findUsuarioEntities();
    }
}
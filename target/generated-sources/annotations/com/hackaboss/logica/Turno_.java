package com.hackaboss.logica;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.Tramite;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-01-23T04:48:49")
@StaticMetamodel(Turno.class)
public class Turno_ { 

    public static volatile SingularAttribute<Turno, String> numeroTurno;
    public static volatile SingularAttribute<Turno, String> descripcion;
    public static volatile SingularAttribute<Turno, Date> fecha;
    public static volatile SingularAttribute<Turno, String> estado;
    public static volatile SingularAttribute<Turno, Tramite> tramite;
    public static volatile SingularAttribute<Turno, Long> id;
    public static volatile SingularAttribute<Turno, Ciudadano> ciudadano;

}
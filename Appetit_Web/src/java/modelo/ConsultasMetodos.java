/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author User
 */
public interface ConsultasMetodos {

    public List<empleados> Listarempleados();

    public List<turnos> Listarturnos();

    public List<control> Listarcontrol();

    public String Agregarempleado(empleados empleado);

    public String Agregarturnos(turnos turno);
    
    public String ControlarAsistencia(control contr);
    
    public String ControlarSalida(String dato, int id);
    
    public boolean eliminarEmpleado(int id);
    
    public boolean eliminarTurno(int id);

    public boolean eliminarAsistencia(int id);
}

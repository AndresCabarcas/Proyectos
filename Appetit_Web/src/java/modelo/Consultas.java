/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author User
 */
public class Consultas implements ConsultasMetodos {

    Connection cn = Conexion.getConexion();

    @Override
    public List<empleados> Listarempleados() {
        List<empleados> Listaempleados = new ArrayList<empleados>();
        try {
            String sql = "SELECT e.*, t.hora_entrada, t.hora_salida FROM empleados e INNER JOIN turnos t WHERE e.turno_p = t.id;";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                String apellido = rs.getString(3);
                String turnoi = rs.getString(5);
                String turnos = rs.getString(6);
                String turno = turnoi + " - " + turnos;

                empleados empleado = new empleados(id, nombre, apellido, turno);

                Listaempleados.add(empleado);
            }

        } catch (Exception e) {
            System.out.println("error de conexion: " + e);
        }
        return Listaempleados;
    }

    @Override
    public List<turnos> Listarturnos() {
        List<turnos> Listaturnos = new ArrayList<turnos>();
        try {
            String sql = "SELECT * FROM turnos";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String entrada = rs.getString(2);
                String salida = rs.getString(3);

                turnos turno = new turnos(id, entrada, salida);

                Listaturnos.add(turno);
            }

        } catch (Exception e) {
            System.out.println("error de conexion");
        }
        return Listaturnos;
    }

    @Override
    public List<control> Listarcontrol() {
        List<control> Listacontrol = new ArrayList<control>();
        try {
            String sql = "SELECT e.*, t.hora_entrada, t.hora_salida, c.nombres, c.apellidos FROM control e INNER JOIN turnos t INNER JOIN empleados c WHERE e.turno_empleado = t.id and e.empleado = c.id;";
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String entrada = rs.getString(2);
                String salida = rs.getString(3);
                String empleado_nombre = rs.getString(8);
                String empleado_apellido = rs.getString(9);
                String empleado = empleado_nombre + " " + empleado_apellido;
                String turnoi = rs.getString(6);
                String turnos = rs.getString(7);
                String turno = turnoi + " - " + turnos;

                control contro = new control(id, entrada, salida, empleado, turno);

                Listacontrol.add(contro);
            }

        } catch (Exception e) {
            System.out.println("error de conexion");
        }
        return Listacontrol;
    }

    @Override
    public String Agregarempleado(empleados empleado) {
        String mensaje = "";
        try {
            String sql = "INSERT INTO empleados VALUES(?,?,?,?)";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setInt(1, empleado.getId());
            pstm.setString(2, empleado.getNombre());
            pstm.setString(3, empleado.getApellido());
            pstm.setInt(4, empleado.getIdTurno());
            pstm.executeUpdate();
            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
            System.out.println("data: " + e);
        }
        return mensaje;
    }

    @Override
    public String Agregarturnos(turnos turno) {
        String mensaje = "";
        try {
            String sql = "INSERT INTO turnos VALUES(?,?,?)";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setInt(1, turno.getId());
            pstm.setString(2, turno.getHora_entrada());
            pstm.setString(3, turno.getHora_salida());
            pstm.executeUpdate();
            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
            System.out.println("data: " + e);
        }
        return mensaje;
    }

    @Override
    public String ControlarAsistencia(control contr) {
        String mensaje = "";
        try {
            String sql = "INSERT INTO control VALUES(?,?,?,?,?)";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setInt(1, contr.getId());
            pstm.setString(2, contr.getHora_ingreso());
            pstm.setString(3, contr.getHora_salida());
            pstm.setInt(4, contr.getId_empleado());
            pstm.setInt(5, contr.getId_turno());
            pstm.executeUpdate();
            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
            System.out.println("data: " + e);
        }
        return mensaje;
    }

    @Override
    public boolean eliminarEmpleado(int id) {
        String sql = "delete from empleados where Id=" + id;
        try {
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return false;
    }

    @Override
    public boolean eliminarTurno(int id) {
        String sql = "delete from turnos where Id=" + id;
        try {
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return false;
    }

    @Override
    public boolean eliminarAsistencia(int id) {
        String sql = "delete from control where Id=" + id;
        try {
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return false;
    }

    @Override
    public String ControlarSalida(String dato, int id) {
        String mensaje = "";
        try {
            String sql = "update control set hora_salida='" +dato+ "'where Id=" +id;
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.executeUpdate();
            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
            System.out.println("data: " + e);
        }
        return mensaje;
    }

}

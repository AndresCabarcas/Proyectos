/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class Conexion {
        public static Connection getConexion(){
        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/appetit_empleados?autoReconnect=true&useSSL=false", "root", "andres123");
        } catch (Exception e) {
            System.out.println("error al conectar a la base de datos");
        }
        return cn;
    }
}

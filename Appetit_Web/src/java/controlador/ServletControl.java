/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Consultas;
import modelo.control;

/**
 *
 * @author User
 */
@WebServlet(name = "ServletControl", urlPatterns = {"/ServletControl"})
public class ServletControl extends HttpServlet {
    
    
    Consultas in = new Consultas();
    String listar = "indexjsp";
    String add = "index.jsp";
    String edit = "index.jsp";
    control p = new control();
    Consultas dao = new Consultas();
    int id;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("dato servlet");

        String acceso = "";

        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("doPost")) {
            doPost(request, response);
        } else {
            if (accion.equalsIgnoreCase("eliminar")) {
                id = Integer.parseInt(request.getParameter("id"));
                p.setId(id);
                dao.eliminarAsistencia(id);
                acceso = listar;
                RequestDispatcher vista = request.getRequestDispatcher("index.jsp");
                vista.forward(request, response);
            } else {
                if (accion.equalsIgnoreCase("editar")) {

                    
                    String salida = new String(request.getParameter("salida").getBytes("ISO-8859-1"), "UTF-8");
                    System.out.println(":  "+salida);
                    String id = new String(request.getParameter("getid").getBytes("ISO-8859-1"), "UTF-8");
                    System.out.println("dat: "+id);
                    int ids = Integer.parseInt(id);
                    
                  in.ControlarSalida(salida, ids);
                   // turnos obj = new turnos(); settets
                   
                    

                    //  String mensaje = in.editarGrupo(grupo);
                    //  System.out.println("mensaje: " + mensaje);
                    request.getRequestDispatcher("control.jsp").forward(request, response);

                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
                    
                    String salida = new String(request.getParameter("salida").getBytes("ISO-8859-1"), "UTF-8");
                    System.out.println(":  "+salida);
                    String id = new String(request.getParameter("getid").getBytes("ISO-8859-1"), "UTF-8");
                    System.out.println("dat: "+id);
                    int ids = Integer.parseInt(id);
                    
                  in.ControlarSalida(salida, ids);
                   // turnos obj = new turnos(); settets
                   
                    

                    //  String mensaje = in.editarGrupo(grupo);
                    //  System.out.println("mensaje: " + mensaje);
                    request.getRequestDispatcher("control.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     try {

            String empleado = new String(request.getParameter("empleados").getBytes("ISO-8859-1"), "UTF-8");
            int emp = Integer.parseInt(empleado);
            String ingreso = new String(request.getParameter("party").getBytes("ISO-8859-1"), "UTF-8");
            String ing = new String(request.getParameter("turnos").getBytes("ISO-8859-1"), "UTF-8");
            int turnos = Integer.parseInt(ing);
            
           control ob = new control();
            
            ob.setId_empleado(emp);
            ob.setId_turno(turnos);
            ob.setHora_ingreso(ingreso);
            
            String mensaje = in.ControlarAsistencia(ob);

            if (mensaje.equals("Agregado")) {
                System.out.println("error: " + mensaje);
            } else {
                System.out.println("error: " + mensaje);
            }

            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("3: " + e);
            request.setAttribute("error", e);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

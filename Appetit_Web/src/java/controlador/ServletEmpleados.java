/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Consultas;
import modelo.empleados;

/**
 *
 * @author User
 */
@WebServlet(name = "ServletEmpleados", urlPatterns = {"/ServletEmpleados"})
public class ServletEmpleados extends HttpServlet {

    Consultas in = new Consultas();
    String listar = "indexjsp";
    String add = "index.jsp";
    String edit = "index.jsp";
    empleados p = new empleados();
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
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("dato servlet");

        String acceso = "";

        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("doPost")) {
            doPost(request, response);
        } else {
            if (accion.equalsIgnoreCase("eliminar")) {
                id = Integer.parseInt(request.getParameter("id"));
                p.setId(id);
                dao.eliminarEmpleado(id);
                acceso = listar;
                RequestDispatcher vista = request.getRequestDispatcher("index.jsp");
                vista.forward(request, response);
            } else {
                if (accion.equalsIgnoreCase("editar")) {

                    String nombre = new String(request.getParameter("nombres").getBytes("ISO-8859-1"), "UTF-8");
                    String apellido = new String(request.getParameter("apellidos").getBytes("ISO-8859-1"), "UTF-8");
                    int idturno = Integer.parseInt(request.getParameter("turno"));
                    int idEmpleado = Integer.parseInt(request.getParameter("id"));

                    empleados obj = new empleados();

                    obj.setNombre(nombre);
                    obj.setApellido(apellido);
                    obj.setIdTurno(idturno);
                    obj.setId(idEmpleado);

                    //  String mensaje = in.editarGrupo(grupo);
                    //  System.out.println("mensaje: " + mensaje);
                    request.getRequestDispatcher("index.jsp").forward(request, response);

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
        processRequest(request, response);
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
        System.out.println("dato 1");
        try {

            String nombre = new String(request.getParameter("nombres").getBytes("ISO-8859-1"), "UTF-8");
            String apellido = new String(request.getParameter("apellidos").getBytes("ISO-8859-1"), "UTF-8");
            int idturno = Integer.parseInt(request.getParameter("turnos"));

            System.out.println("dato :  "+nombre);
            System.out.println("dato :  "+apellido);
            System.out.println("dato :  "+idturno);
            empleados ob = new empleados();
            
            ob.setNombre(nombre);
            ob.setApellido(apellido);
            ob.setIdTurno(idturno);
            
            String mensaje = in.Agregarempleado(ob);

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

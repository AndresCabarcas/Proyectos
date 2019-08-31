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
import modelo.turnos;

/**
 *
 * @author User
 */
@WebServlet(name = "ServletTurnos", urlPatterns = {"/ServletTurnos"})
public class ServletTurnos extends HttpServlet {
    
        Consultas in = new Consultas();
    String listar = "indexjsp";
    String add = "index.jsp";
    String edit = "index.jsp";
    turnos p = new turnos();
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
                dao.eliminarTurno(id);
                acceso = listar;
                RequestDispatcher vista = request.getRequestDispatcher("index.jsp");
                vista.forward(request, response);
            } else {
                if (accion.equalsIgnoreCase("editar")) {

                    String entrada = new String(request.getParameter("horae").getBytes("ISO-8859-1"), "UTF-8");
                    String salida = new String(request.getParameter("horas").getBytes("ISO-8859-1"), "UTF-8");
                    int idturno = Integer.parseInt(request.getParameter("turno"));

                    turnos obj = new turnos();
                    obj.setId(idturno);
                    obj.setHora_salida(salida);
                    obj.setHora_entrada(entrada);
                    

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
                try {

            String entrada = new String(request.getParameter("horae").getBytes("ISO-8859-1"), "UTF-8");
            String salida = new String(request.getParameter("horas").getBytes("ISO-8859-1"), "UTF-8");
            
            turnos ob = new turnos();
            
            ob.setHora_entrada(entrada);
            ob.setHora_salida(salida);
            
            String mensaje = in.Agregarturnos(ob);

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

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;
import persistence.CaronasDAOException;
import persistence.UsuarioDAO;

/**
 *
 * @author hugo
 */
public class BuscaUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuscaUsuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuscaUsuarios at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UsuarioDAO uDAO = new UsuarioDAO();
            List<Usuario> listaUsuarios;
            
            String cidade = request.getParameter("nomeCidade");
            listaUsuarios = uDAO.consultaMultipla(cidade);
            request.setAttribute("listaUsuarios", listaUsuarios);
            
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/resultadoBusca.jsp");
            rd.forward(request, response);
        } catch (CaronasDAOException ex) {
            Logger.getLogger(BuscaUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            throw new ServletException(ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(BuscaUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            throw new ServletException(ex.getMessage());
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

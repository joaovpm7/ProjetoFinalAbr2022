/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;

/**
 *
 * @author João Victor Pereira Miranda
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

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
       
//        if(request.getParameter("login") != null &&
//                request.getParameter("senha") != null){
//            String login = request.getParameter("login");
//            String senha = request.getParameter("senha");
//            
//            Usuario user = new Usuario();
//            user.setLogin(login);
//            user.setSenha(senha);
//            boolean talogado = user.TemUsuario();
//            
//            //talogado == true
//            if(talogado){
//                request.setAttribute("idusuario", user);
//                request.getRequestDispatcher("tela/cadastrar.jsp").forward(request, response);
//            } else {
//                response.sendRedirect("tela/login.jsp?auth=false");
//            }
//        }
        
        if(request.getParameter("login")!= null){
            
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            Usuario user = new Usuario();
            user.setLogin(login);
            user.setSenha(senha);
            
            boolean temUsuario = user.verificarUsuario();
            
            if(temUsuario == true){
                request.setAttribute("bananauser", user.getId());
                request.getRequestDispatcher("cadastrar.jsp")
                        .forward(request, response);
            } 
            else{
                response.sendRedirect("login.jsp");
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


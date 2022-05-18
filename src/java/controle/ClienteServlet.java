/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

/**
 *
 * @author sala305b
 */
/**
 *
 * @author sala305b
 */
@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

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

        if (request.getParameter("acao") != null) {

            if (request.getParameter("acao").equals("editar")) {
                Cliente cli = new Cliente();
                cli.setNome(request.getParameter("nomerazao"));
                cli.setTpRequerente(request.getParameter("requerente"));
                cli.setEmail(request.getParameter("email"));
                cli.setDdd(request.getParameter("ddd"));
                cli.setLogradouro(request.getParameter("logradouro"));
                cli.setNumero(request.getParameter("numero"));
                cli.setCep(request.getParameter("cep"));
                cli.setComplemento(request.getParameter("complemento"));
                cli.setBairro(request.getParameter("bairro"));
                cli.setCidade(request.getParameter("cidade"));
                cli.setUf(request.getParameter("uf"));
                cli.setImagem(request.getParameter("imagem"));

                String strtelefone = request.getParameter("telefone");
                strtelefone = strtelefone.replace("(", "");
                strtelefone = strtelefone.replace(")", "");
                strtelefone = strtelefone.replace(" ", "");
                strtelefone = strtelefone.replace("-", "");

                cli.setTelefone(strtelefone.substring(2));
                cli.setDdd(strtelefone.substring(0, 2));

                String stridusuario = request.getParameter("idusuario");

                cli.setIdusuario(Integer.parseInt(stridusuario));

                boolean atualizou = cli.Atualizar();
                if (atualizou == true) {
                    response.sendRedirect("cadastro2.jsp");
                } else {
                    response.sendRedirect("index.jsp?erro=atualizarPonto");
                }
            } else if (request.getParameter("acao").equals("apagar")) {
                int client = Integer.parseInt(request.getParameter("ipessoa"));
                Cliente.Excluir(client);
                String mensagem
                        = "<h1>Produto Apagado com Sucesso</h1>";
                response.getWriter().print(mensagem);
            } else {
                Cliente cli = new Cliente();
                cli.setNome(request.getParameter("nomerazao"));
                cli.setEmail(request.getParameter("email"));
                cli.setDdd(request.getParameter("ddd"));
                cli.setLogradouro(request.getParameter("logradouro"));
                cli.setNumero(request.getParameter("numero"));
                cli.setCep(request.getParameter("cep"));
                cli.setComplemento(request.getParameter("complemento"));
                cli.setBairro(request.getParameter("bairro"));
                cli.setCidade(request.getParameter("cidade"));
                cli.setUf(request.getParameter("uf"));
                cli.setImagem(request.getParameter("imagem"));
                
                String tprequerente = request.getParameter("requerente");
                if (tprequerente.equals("PF")){
                    cli.setTpRequerente(request.getParameter("requerente"));
                } else if (tprequerente.equals("PJ")) {
                    cli.setTpRequerente(request.getParameter("requerente"));
                }

                String strtelefone = request.getParameter("telefone");
                strtelefone = strtelefone.replace("(", "");
                strtelefone = strtelefone.replace(")", "");
                strtelefone = strtelefone.replace(" ", "");
                strtelefone = strtelefone.replace("-", "");

                cli.setTelefone(strtelefone.substring(2));
                cli.setDdd(strtelefone.substring(0, 2));

                String stridusuario = request.getParameter("idusuario");

                cli.setIdusuario(Integer.parseInt(stridusuario));
                boolean cadastrou = cli.Cadastrar();
                if (cadastrou = true) {
                    response.sendRedirect("listar.jsp");
                } else {
                    response.sendRedirect("index.jsp?erro=cadastrarPonto");
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

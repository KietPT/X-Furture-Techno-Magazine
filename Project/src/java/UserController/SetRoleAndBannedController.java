/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kietpt.dao.UserDAO;
import kietpt.dto.UsersDTO;

/**
 *
 * @author KietPT
 */
public class SetRoleAndBannedController extends HttpServlet {

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
        String url = "Error.jsp";
        String txtRole, txtStatusId, userId;
        int role = 0, statusId = 0;
        UserDAO dao = new UserDAO();
        UsersDTO dto = new UsersDTO();
        try {
            System.out.println("SetRoleAndBannedController");

            userId = request.getParameter("txtUserId");
            txtRole = request.getParameter("listRole");
            if (txtRole.equals("Moderator")) {
                role = 3;
            } else if (txtRole.equals("Collaborator")) {
                role = 2;
            } else if (txtRole.equals("Member")) {
                role = 1;
            }

            txtStatusId = request.getParameter("listStatus");
            if (txtStatusId.equals("Banned")) {
                statusId = 0;
            } else if (txtStatusId.equals("Active")) {
                statusId = 1;
            }

            boolean check = dao.SetRoleAndBanAccount(userId, role, statusId);
            if (check) {
                System.out.println("lalala");
                request.setAttribute("AdUdSuccess", "Update Successful!");
                dto = dao.findByUserID(userId);
                request.setAttribute("AccountDetails", dto);
                url = "SetRoleAndBan.jsp";
            } else {
                url = "SetRoleAndBan.jsp";
            }

        } catch (Exception e) {
            log("ERROR at SetRoleAndBannedController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

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
import javax.servlet.http.HttpSession;
import kietpt.dao.UserDAO;
import kietpt.dto.ErrorObject;

/**
 *
 * @author KietPT
 */
public class ChangePassModerController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = "Error.jsp";
        try {

            UserDAO dao = new UserDAO();
            boolean check = true, checkOldPass = true;
            String userId = request.getParameter("txtUserId");
            String oldPass = request.getParameter("txtOldPassword");
            String newPass = request.getParameter("txtNewPassword");
            String confirmPass = request.getParameter("txtConfirmPassword");

            ErrorObject error = new ErrorObject();
            checkOldPass = dao.checkOldPass(userId, oldPass);
            if (checkOldPass != true) {
                error.setOldPassword("Old Password is incorrect!");
                check = false;
            }
            if (oldPass.equals(newPass) || oldPass.equals(confirmPass) || oldPass.equals("")) {
                error.setOldPassword("Old Password not equal newPass and ConfirmPass!");
                check = false;
            }
            if (!newPass.equals(confirmPass) || newPass.equals("") || confirmPass.equals("")) {
                error.setEqualError("NewPass have to be equal ConfirmPass!");
                check = false;
            }
            if (check) {
                if (dao.changePass(userId, newPass)) {
                    request.setAttribute("SUCCESSCHANGEPASS", "Change pass successfull!");
                    url = "ChangePassModerator.jsp";
                }
            } else {
                request.setAttribute("ERROROLDPASS", error);
                url = "ChangePassModerator.jsp";
            }
        } catch (Exception e) {
            log("ERROR at ChangePassCollaController: " + e.getMessage());
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

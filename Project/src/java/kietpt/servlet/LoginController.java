/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.servlet;

import java.io.IOException;
import java.util.List;
import javafx.scene.Camera;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kietpt.dto.CategoryDTO;
import kietpt.dao.UserDAO;
import kietpt.dto.ErrorObject;
import kietpt.dto.UserDTO;
import kietpt.dto.UsersDTO;

/**
 *
 * @author KietPT
 */
public class LoginController extends HttpServlet {

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
            HttpSession session = request.getSession();
            String userId = request.getParameter("txtUserId");
            String pass = request.getParameter("txtPassword");
            String page = request.getParameter("page");
            System.out.println("áđá" + page);
            ErrorObject error = new ErrorObject();
            UserDAO dao = new UserDAO();
            switch (dao.checkLogin(userId, pass)) {
                case -1:
                    error.setUserPassError("Invalid Username or Password!");
                    request.setAttribute("ERRORLOGIN", error);
                    url = "logintp.jsp";
                    break;
                case 0:
                    error.setAccountBanned("Your account has been banned!");
                    request.setAttribute("ERRORLOGIN", error);
                    url = "logintp.jsp";
                    break;
                case 1:
                    UsersDTO reader = new UsersDTO();
                    reader = dao.findByUserID(userId);
                    if (reader != null) {
                        session.setAttribute("READER",reader);
                        switch(page){
                            case "index":
                                url = "index.jsp";
                                break;
                            case "camera":
                                url="Camera.jsp";
                                break;
                            case "mobile":
                                url="Mobile.jsp";
                                break;
                            case "laptop":
                                url="Laptop.jsp";
                                break;
                            case "postDetail":
                                url="PostDetail.jsp";
                                break;
                        }                         
                    }
                    break;
                case 2:
                    UsersDTO dto = new UsersDTO();
                    dto = dao.findByUserID(userId);
                    if (dto != null) {
                        session.setAttribute("COLLABORATOR", dto);
                        url = "UpdateProfileCollaborator.jsp";
                        System.out.println("da qua loginCollaborator"+    "  abcbcbcbcbcbcb    ");
                    }
                    break;
                case 3:
                    UsersDTO dtoMo = new UsersDTO();
                    dtoMo = dao.findByUserID(userId);
                    if (dtoMo != null) {
                        session.setAttribute("MODERATOR", dtoMo);
                        url = "UpdateProfileModerator.jsp";
                        System.out.println("da qua loginModerator"+    "  abcbcbcbcbcbcb    ");
                    }
                    break;
                case 4:
                    UsersDTO admin = new UsersDTO();
                    admin = dao.findByUserID(userId);
                    if (admin != null) {
                        session.setAttribute("ADMIN", admin);                        
                        url = "ManageAccountAdmin.jsp";
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            //out.close();
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

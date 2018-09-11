/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PostController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kietpt.dao.PostDAO;
import kietpt.dto.CommentDTO;
import kietpt.dto.ErrorObject;

/**
 *
 * @author KietPT
 */
public class InsertComment extends HttpServlet {

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
            PostDAO dao = new PostDAO();
            String postId = request.getParameter("txtPostId");
            int id = Integer.parseInt(postId);
            String userId = request.getParameter("txtUserId");
            ErrorObject error = new ErrorObject();
            boolean check = true;
            if (userId == null || userId.equals("")) {
                error.setMessage("Please Login!!!!!!!!!!!! ");
                check = false;
            }
            String contentOfComment = request.getParameter("txtComment");
            Timestamp now = new Timestamp(System.currentTimeMillis());
            if (check) {
                CommentDTO comment = new CommentDTO();
                comment.setPostId(id);
                comment.setContentOfCmt(contentOfComment);
                comment.setTimeOfCmt(now);
                comment.setStatus(true);
                comment.setUserId(userId);
                if (dao.insertComment(comment)) {
                    url = "ShowPostDetail?txtpostId="+postId;
                }
            }else{
                request.setAttribute("ERROR", error);
                url = "PostDetail.jsp";
                
            }
        } catch (Exception e) {
            e.printStackTrace();
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

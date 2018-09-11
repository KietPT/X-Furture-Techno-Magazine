/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PostController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kietpt.dao.PostDAO;
import kietpt.dto.ErrorObject;
import kietpt.dto.PostDTO;

/**
 *
 * @author KietPT
 */
public class SaveDraftUpdatePostColla extends HttpServlet {

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
            // controller này dùng cho nút save draft của trang updatePost
            String search = request.getParameter("txtSearch");
            PostDAO dao = new PostDAO();
            String postId = request.getParameter("txtPostId");
            int pId = Integer.parseInt(postId);
            String content = request.getParameter("txtContent");
            String collaborator = request.getParameter("txtUserId");
            String title = request.getParameter("txtTitle");
            Timestamp now = new Timestamp(System.currentTimeMillis());
            int status = 4; // 1:submit 2:waiting 3 rejected 4 save draft
            String cateName = request.getParameter("txtCategory");
            int cateId;
            if (cateName.equals("Laptop")) {
                cateId = 1;
            } else if (cateName.equals("Camera")) {
                cateId = 2;
            } else {
                cateId = 3;
            }
            String sympic = request.getParameter("txtSymbolPic");
            String mainContent = request.getParameter("txtMainContent");

            boolean check = true;
            ErrorObject error = new ErrorObject();
            if (check) {
                PostDTO post = new PostDTO(content, collaborator, title, mainContent, sympic, cateId, status, pId, now);
                if (dao.saveDraftPostDetailColla(post)) {
                    url = "SearchPostModerColla?subActionPost=updatePostCo&txtSearch="+search+"&txtUserId"+collaborator;
                    error.setMessage("Save Draft Successfully");
                    request.setAttribute("Success", error);
                }
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

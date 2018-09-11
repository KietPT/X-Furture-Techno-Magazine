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
import kietpt.dao.PostDAO;
import kietpt.dto.ErrorObject;
import kietpt.dto.PostDTO;

/**
 *
 * @author KietPT
 */
public class SubmitSaveDraftPostColla extends HttpServlet {

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
            String postId = request.getParameter("txtPostId");
            String search = request.getParameter("txtSearch");
            int pId = Integer.parseInt(postId);
            String content = request.getParameter("txtContent");
            System.out.println(content);
            String collaborator = request.getParameter("txtUserId");
            System.out.println(collaborator);
            String title = request.getParameter("txtTitle");
            System.out.println(title);
            Timestamp now = new Timestamp(System.currentTimeMillis());
            int status = 2; // 1:submit 2:waiting 3 rejected 4 save draft
            String cateName = request.getParameter("txtCategory");
            int cateId;
            System.out.println(cateName);
            if (cateName.equals("Laptop")) {
                cateId = 1;
            } else if (cateName.equals("Camera")) {
                cateId = 2;
            } else {
                cateId = 3;
            }
            String sympic = request.getParameter("txtSymbolPic");
            System.out.println(sympic);
            String mainContent = request.getParameter("txtMainContent");
            System.out.println(mainContent);
            PostDAO dao = new PostDAO();
            boolean check = true;
            ErrorObject error = new ErrorObject();
            if (check) {
                PostDTO post = new PostDTO(content, collaborator, title, mainContent, sympic, cateId, status, pId, now);
                if (dao.updatePostByColla(post)) {
                    url = "SearchPostModerColla?subActionPost=saveDraftPostCo&txtSearch="+search+"&txtUserId="+collaborator;
                    error.setMessage("Submit Successfully");
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

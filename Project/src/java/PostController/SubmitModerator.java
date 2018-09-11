/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PostController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class SubmitModerator extends HttpServlet {

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
            String Id = request.getParameter("txtPostId");
            String search = request.getParameter("txtSearch");
            int postId = Integer.parseInt(Id);
            String title = request.getParameter("txtTitle");
            String catetory = request.getParameter("txtCategory");
            int cateId;
            if (catetory.equals("Laptop")) {
                cateId = 1;
            } else if (catetory.equals("Camera")) {
                cateId = 2;
            } else {
                cateId = 3;
            }
            String mainContent = request.getParameter("txtMainContent");
            String content = request.getParameter("txtContent");
            String collaborator = request.getParameter("txtUserId");
            String moderator = request.getParameter("txtModerId");
            Timestamp posted = new Timestamp(System.currentTimeMillis());
            String symPic = request.getParameter("txtSymbolPic");
            int status = 1;
            System.out.println(postId);
            System.out.println(title);
            System.out.println(cateId);
            System.out.println(mainContent);
            System.out.println(content);
            System.out.println(collaborator);
            System.out.println(moderator);
            PostDAO dao = new PostDAO();
            PostDTO dto = new PostDTO();
            dto.setPostId(postId);
            dto.setTitle(title);
            dto.setCateId(cateId);
            dto.setMainContent(mainContent);
            dto.setContent(content);
            dto.setCollaborator(collaborator);
            dto.setModerator(moderator);
            dto.setStatus(status);
            dto.setSymbolPic(symPic);
            dto.setPostedDate(posted);
            ErrorObject error = new ErrorObject();
            if (dao.submitPostByModerator(dto)) {
                url = "SearchPostModerColla?subActionPost=managePostMo&txtSearch="+search;
                error.setMessage("Submit Successfully");
                request.setAttribute("Success", error);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PostController;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kietpt.dao.PostDAO;
import kietpt.dto.PostDTO;
import kietpt.dao.UserDAO;

/**
 *
 * @author KietPT
 */
public class SearchPostModerColla extends HttpServlet {

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
        String json = "";
        try {
            String search = request.getParameter("txtSearch");
            System.out.println(search + " - ");
            String userId = request.getParameter("txtUserId");
            PostDAO dao = new PostDAO();
            String subActionPost = request.getParameter("subActionPost");
            System.out.println(subActionPost +"  -  ");
            if (subActionPost.equals("managePostMo")) { // dùng trả về 1 list cho trang ManagePost
                List<PostDTO> list = dao.showPostByModer(search);
                if (list != null || list.isEmpty()) {

                    request.setAttribute("LIST", list);
                    request.setAttribute("lastSearch", search);

                    response.setContentType("application/json");
                    json = new Gson().toJson(list);
                    System.out.println("KIETTT " + json);
                    response.getWriter().write(json);

                    url = "ManagePostModer.jsp";
                }
            } else if (subActionPost.equals("submittedPostMo")) { // dùng trả về 1 list cho trang SubmittedPostMo
                List<PostDTO> list = dao.showSubmittedPostByModer(search);
                if (list != null || list.isEmpty()) {
                    request.setAttribute("LIST", list);
                    request.setAttribute("lastSearch", search);
                    url = "SubmittedPostByModerator.jsp";
                }
            } else if (subActionPost.equals("rejectedPostMo")) {  // dùng trả về 1 list cho trang RejecttedPostMo
                List<PostDTO> list = dao.showRejectedPostByModer(search);
                if (list != null || list.isEmpty()) {
                    request.setAttribute("LIST", list);
                    request.setAttribute("lastSearch", search);
                    url = "RejecttedPostModerator.jsp";
                }
            } else if (subActionPost.equals("submittedPostCo")) {   // dùng trả về 1 list cho trang SubmmitedPostCo
                System.out.println("da vao submittedPostCo");
                System.out.println(userId);
                List<PostDTO> list = dao.showSubmittedPostColla(search, userId);
                if (list != null || list.isEmpty()) {
                    request.setAttribute("LIST", list);
                    request.setAttribute("lastSearch", search);
                    url = "SubmittedPostCollaborator.jsp";
                }
            } else if (subActionPost.equals("saveDraftPostCo")) {  //dùng để trả về 1 list cho trang SaveDraftPostCo
                System.out.println("da vao saveDraftPostCo");
                System.out.println(userId);
                List<PostDTO> list = dao.showSaveDraftPostColla(search, userId);
                if (list != null || list.isEmpty()) {
                    request.setAttribute("LIST", list);
                    request.setAttribute("lastSearch", search);

                    url = "SaveDraftPostByCollaborator.jsp";
                }
            } else if (subActionPost.equals("updatePostCo")) {  // dùng để trả về 1 List cho trang UpdatePostCo
                System.out.println("da vao updatePostCo");
                System.out.println(userId);
                List<PostDTO> list = dao.showUpdatePostColla(search, userId);
                if (list != null || list.isEmpty()) {
                    request.setAttribute("LIST", list);
                    request.setAttribute("lastSearch", search);
                    url = "UpdatePostCollaborator.jsp";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //request.getRequestDispatcher(url).forward(request, response);
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

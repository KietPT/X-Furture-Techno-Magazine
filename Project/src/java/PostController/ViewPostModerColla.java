/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PostController;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kietpt.dao.PostDAO;
import kietpt.dto.PostDTO;

/**
 *
 * @author KietPT
 */
public class ViewPostModerColla extends HttpServlet {

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
            String pid = request.getParameter("txtPostId");
            String search = request.getParameter("txtSearch");
            PostDAO dao = new PostDAO();
            String subAction = request.getParameter("subView");
            if (subAction.equals("sumittedPostMoDetail")) {  // dùng đẻ trả về 1 dto cho trang SubmittedPostDetail
                PostDTO dto = dao.showPostDetail(pid);
                if (dto != null) {
                    
                    response.setContentType("application/json");
                    String json = json = new Gson().toJson(dto);
                    System.out.println("KIETTT " + json);
                    response.getWriter().write(json);

                    request.setAttribute("INFO", dto);
                    url = "SubmittedPostByMoDetail.jsp";
                    System.out.println("da chuyen Post Detail di");
                }
            } else if (subAction.equals("rejectedPostMoDetail")) {  // dùng đẻ trả về 1 dto cho trang RejectedPostMoDetail
                PostDTO dto = dao.showPostDetail(pid);
                if (dto != null) {
                    request.setAttribute("INFO", dto);
                    url = "RejecttedPostMoDetail.jsp";
                    System.out.println("da chuyen Post Detail di");
                }
            } else if (subAction.equals("managePostMoDetail")) {   // dùng đẻ trả về 1 dto cho trang ManagePostDetailMo
                PostDTO dto = dao.showPostDetail(pid);
                if (dto != null) {
                    request.setAttribute("INFO", dto);
                    request.setAttribute("lastSearch", search);
                    url = "ManagePostDetailModer.jsp";
                    System.out.println("da chuyen Post Detail di");
                }
            } else if (subAction.equals("submittedPostCoDetail")) {  // dùng đẻ trả về 1 dto cho trang SubmittedPostDetailCo
                PostDTO dto = dao.showPostDetail(pid);
                if (dto != null) {
                    request.setAttribute("INFO", dto);
                    url = "SubmittedPostCollaDetail.jsp";
                    System.out.println("da chuyen Post Detail di");
                }
            } else if (subAction.equals("saveDraftPostCoDetail")) {  // dùng đẻ trả về 1 dto cho trang SaveDraftPostDetai
                PostDTO dto = dao.showPostDetail(pid);
                if (dto != null) {
                    request.setAttribute("INFO", dto);
                    request.setAttribute("lastSearch", search);
                    url = "SaveDraftPostCollaDetail.jsp";
                    System.out.println("da chuyen Post Detail di");
                }
            } else if (subAction.equals("updatePostCoDetail")) {  // dùng đẻ trả về 1 dto cho trang UpdatePostDetail
                PostDTO dto = dao.showPostDetail(pid);
                if (dto != null) {
                    request.setAttribute("INFO", dto);
                    request.setAttribute("lastSearch", search);
                    url = "UpdatePostCollaDetail.jsp";
                    System.out.println("da chuyen Post Detail di");
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

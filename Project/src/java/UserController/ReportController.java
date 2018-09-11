/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kietpt.dao.PostDAO;
import kietpt.dao.UserDAO;
import kietpt.dto.ErrorObject;
import kietpt.dto.PostDTO;

/**
 *
 * @author MyPC
 */
public class ReportController extends HttpServlet {

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
        ArrayList<PostDTO> result = new ArrayList<>();
        UserDAO dao = new UserDAO();
        ErrorObject error = new ErrorObject();
        String txtFrom, txtTo;
        Timestamp from, to;
        int yearF, monthF, dateF, yearT, monthT, dateT;
        boolean check = true;

        try {
            txtFrom = request.getParameter("txtFrom");
            String[] tmpF = txtFrom.split("-");
            yearF = Integer.parseInt(tmpF[0]);
            monthF = Integer.parseInt(tmpF[1]);
            dateF = Integer.parseInt(tmpF[2]);
            from = new Timestamp(yearF - 1900, monthF - 1, dateF, 0, 0, 0, 0);

            txtTo = request.getParameter("txtTo");
            String[] tmpT = txtTo.split("-");
            yearT = Integer.parseInt(tmpT[0]);
            monthT = Integer.parseInt(tmpT[1]);
            dateT = Integer.parseInt(tmpT[2]);
            to = new Timestamp(yearT - 1900, monthT - 1, dateT, 0, 0, 0, 0);

            if (from.after(to)) {
                error.setFromtoError("Date From can't be after date To!");
                check = false;
            }

            if (check) {
                result = dao.topPost(from, to);
                if (!result.isEmpty()) {
                    request.setAttribute("TOPPOST", result);
                    url = "Report.jsp";
                } else {
                    error.setSearchError("No Record Found!");
                    request.setAttribute("SEARCHERROR", error);
                    url = "Report.jsp";
                }
            } else {
                request.setAttribute("FROMTOERROR", error);
                url = "Report.jsp";
            }

        } catch (Exception e) {
            log("ERROR at ReportController: " + e.getMessage());
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

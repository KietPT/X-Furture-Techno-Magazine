/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KietPT
 */
public class MainController extends HttpServlet {

    private static final String Register = "RegisterController";
    private static final String Login = "LoginController";
    private static final String UpdateProfileReader = "UpdateProfileReaderController";
    private static final String ChangePassReader = "ChangePassReaderController";
    private static final String ManageAccountAdmin = "ManageAccountAdminController";
    private static final String ViewDetailAccount = "ViewDetailAccountController";
    private static final String AdminCreateAccount = "AdminCreateAccountController";
    private static final String UpdateProfileModer = "UpdateProfileModeratorController";
    private static final String ChangePassColla = "ChangePassCollaController";
    private static final String UpdateProfileColla = "UpdateProfileCollaController";
    private static final String ChangePassModer = "ChangePassModerController";
    private static final String SetRoleAndBanned = "SetRoleAndBannedController";
    private static final String Report = "ReportController";

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
            String abc = request.getParameter("txtAbc");
            
            String action = request.getParameter("action");
            System.out.println(action + " -  ");
            
            String subAction = request.getParameter("subAction");
            System.out.println(subAction +" - - -  ");
            if (action.equals("Login")) {
                System.out.println("sadsadsa");
                url = Login;
            } else if (action.equals("Search")) {
                if (subAction.equals("ManageAccountAdmin")) {
                    url = ManageAccountAdmin;
                } else if (subAction.equals("subSearchPost")) {
                    url = "SearchPostModerColla";                    
                } else if (subAction.equals("Report")) {
                    url = Report;
                }
            } else if (action.equals("View")) {
                if (subAction.equals("ViewDetailAccount")) {
                    url = ViewDetailAccount;
                } else if (subAction.equals("subViewPost")) {
                    url = "ViewPostModerColla";
                    System.out.println("da qua ViewPostModerColla");
                }
            } else if (action.equals("Submit")) {
                if (subAction.equals("AddPostColla")) {
                    System.out.println("da vao day");
                    url = "AddPostCollaborator";
                } else if (subAction.equals("SubmitPostMo")) {
                    url = "SubmitModerator";
                } else if (subAction.equals("SubmitSaveDraftPostColla")) {
                    url = "SubmitSaveDraftPostColla";
                }
            } else if (action.equals("Reject")) {
                url = "RejectedPostModerator";
            } else if (action.equals("Update")) {
                if (subAction.equals("UpdateProfileReader")) {
                    url = UpdateProfileReader;
                } else if (subAction.equals("UpdatePassReader")) {
                    url = ChangePassReader;
                } else if (subAction.equals("UpdateProfileModer")) {
                    url = UpdateProfileModer;
                } else if (subAction.equals("UpdatePassColla")) {
                    url = ChangePassColla;
                } else if (subAction.equals("UpdateProfileColla")) {
                    url = UpdateProfileColla;
                } else if (subAction.equals("UpdatePassModer")) {
                    url = ChangePassModer;
                } else if (subAction.equals("SetRoleAndBanned")) {
                    url = SetRoleAndBanned;
                } else if (subAction.equals("subUpdatePost")) {
                    url = "UpdatePostCollaborator";
                }
            } else if (action.equals("Save Draft")) {
                String subSaveDraft = request.getParameter("subSaveDraft");
                if (subSaveDraft.equals("AddPostSaveDraft")) {
                    url = "SaveDraftPostCollaborator";
                } else if (subSaveDraft.equals("SaveDraftPostSaveDraft")) {
                    url = "SaveDraftPostSaveDraft";
                } else if (subSaveDraft.equals("SaveDraftPostUpdate")) {
                    url = "SaveDraftUpdatePostColla";
                }
            } else if (action.equals("Insert")) {
                url = "InsertComment";
            } else if (action.equals("Logout")) {
                url = "LogoutController";
            } else if (action.equals("Register")) {
                System.out.println("33333333333333333333333333");
                url = Register;
            } else if (action.equals("AdminCreateAccount")) {
                url = AdminCreateAccount;
            } else if (action.equals("View Profile")) {
                if (subAction.equals("ViewProfileReader")) {
                    url = "UpdateProfileReader.jsp";
                }
            } else {
                request.setAttribute("ERROR", "Does not support");
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

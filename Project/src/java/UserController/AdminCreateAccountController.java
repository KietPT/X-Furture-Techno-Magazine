/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kietpt.dao.PostDAO;
import kietpt.dto.PostDTO;
import kietpt.dao.UserDAO;
import kietpt.dto.Error_UserDTO;
import kietpt.dto.UserDTO;
import kietpt.dto.UsersDTO;

/**
 *
 * @author KietPT
 */
public class AdminCreateAccountController extends HttpServlet {

    private static String DEFAULT_PASSWORD = "1";

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
        System.out.println("lalalaaaaaaaaaaaaaaaaaaaaaaa");
        String url = "Error.jsp";

        try {
            UsersDTO dto = new UsersDTO();
            UserDAO dao = new UserDAO();
            String userId = "", fullname = "", phone = "", address = "", email = "", txtBirthday = "",
                    txtSex = "", txtRole = "";
            int role = 0, statusId = 1;
            boolean sex;
            boolean check = true, checkPK = false;
            Timestamp birthday;
            fullname = request.getParameter("txtFullname");
            txtBirthday = request.getParameter("txtBirthday");
            String[] tmp = txtBirthday.split("-");
            int year = Integer.parseInt(tmp[0]);
            int month = Integer.parseInt(tmp[1]);
            int date = Integer.parseInt(tmp[2]);
            birthday = new Timestamp(year - 1900, month - 1, date, 0, 0, 0, 0);
            txtSex = request.getParameter("radioSex");
            if (txtSex.equals("Male")) {
                sex = true;
            } else {
                sex = false;
            }
            phone = request.getParameter("txtPhone");
            email = request.getParameter("txtEmail");
            address = request.getParameter("txtAddress");
            txtRole = request.getParameter("listRole");
            String prefix = "";
            if (txtRole.equals("Moderator")) {
                role = 3;
                prefix = "MO";
            } else if (txtRole.equals("Collaborator")) {
                role = 2;
                prefix = "CO";
            }
            Error_UserDTO error = new Error_UserDTO();
            // check validation

            if (fullname.equals("")) {
                error.setErrorFullname("Fullname can't be blank!");
                check = false;
            }
            int count = dao.coutUser() + 1;
            userId = prefix + "-" + fullname + "-" + String.format("%03d", count);
            System.out.println("userid = " + userId);
            
            
            if (email.equals("") || !email.matches("[a-zA-Z0-9]{1,30}+@[a-z]{3,5}.[a-z]{3,5}")) {
                System.out.println("eeeeeeeeeeeeeee");
                error.setErrorMail("Email can't be blank! and Email format: abc@gmail.com! ");
                check = false;
            }
            if (txtBirthday.equals("") || year < 1900) {
                error.setErrorDob("Please input birthdate and year > 1900 ");
                check = false;
            }
            if (phone.equals("") || !phone.matches("[0-9]{10,11}")) {
                error.setErrorPhone("Phone can't be blank!  and have 10-11 digits ");
                check = false;
            }
            if (address.equals("")) {
                error.setErrorAddr("Address can't be blank!");
                check = false;
            }
            if (check) {
                dto.setUserId(userId);
                dto.setPassword(DEFAULT_PASSWORD);
                dto.setFullname(fullname);
                dto.setBirthday(birthday);
                dto.setSex(sex);
                dto.setPhone(phone);
                dto.setMail(email);
                dto.setAddress(address);
                dto.setRole(role);
                dto.setStatusId(statusId);
                System.out.println("444444444444444444444");
                if (dao.adminCreateAccount(dto)) {
                    System.out.println("55555555555555555555555");
                    request.setAttribute("INFOCREATE", dto);
                    request.setAttribute("CREATESUCCESS", "Create successful!");
                    url = "CreateAccountAdmin.jsp";
                }
            } else {
                request.setAttribute("CREATEERROR", error);
                url = "CreateAccountAdmin.jsp";
            }
        } catch (Exception e) {
            log("Error at AdminCreateAccountController: " + e.getMessage());
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

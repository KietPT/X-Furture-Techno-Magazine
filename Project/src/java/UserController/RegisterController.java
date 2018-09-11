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
import kietpt.dao.UserDAO;
import kietpt.dto.Error_UserDTO;
import kietpt.dto.UsersDTO;

/**
 *
 * @author KietPT
 */
public class RegisterController extends HttpServlet {

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
            UserDAO dao = new UserDAO();
            String UserId="", password="", fullname="", phone="", address="", email="",
                    txtBirthday="", txtSex="",confirmPass="";
            int role = 1, statusId = 1;
            boolean sex, check = true;
            Timestamp birthday;
            System.out.println("REGISTER");
            UserId = request.getParameter("txtUserId");
            password = request.getParameter("txtPassword");
            fullname = request.getParameter("txtFullname");
            txtBirthday = request.getParameter("txtBirthday");
            confirmPass = request.getParameter("txtConfirmPassword");
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

            Error_UserDTO error = new Error_UserDTO();
            if (UserId.equals("")) {
                System.out.println("bbbbbbbbbbbb");
                error.setErrorUserId("Username ca'nt be blank!");
                check = false;
            }
            if (password.equals("") || !password.matches("^[a-zA-Z0-9@!,]{6,12}$")) {
                System.out.println("cccccccc");
                error.setErrorPass("Password can't be blank! and Password length must contains 6-12 characters!");
                check = false;
            }
            if(!password.equals(confirmPass)){
                error.setErrorPass("Please input same password");
                check = false;
            }
            if (fullname.equals("")) {
                System.out.println("ddddddddddddddddd");
                error.setErrorFullname("Fullname can't be blank!");
                check = false;
            }
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
                System.out.println("ggggggggggggggggggggg");
                error.setErrorPhone("Phone can't be blank!");
                check = false;
            }
            if (address.equals("")) {
                System.out.println("kkkkkkkkkkkkkkkkkkk");
                error.setErrorAddr("Address can't be blank!");
                check = false;
            }
            boolean checkPK = dao.checkPK(UserId);
            if (checkPK) {
                System.out.println("1000000000000000000000000000");
                request.setAttribute("DupPK", "Duplicated PK!");
                check = false;
            }
            UsersDTO dto = new UsersDTO();
            if (check) {
                System.out.println("1111111111111111111111");
                dto.setUserId(UserId);
                dto.setPassword(password);
                dto.setFullname(fullname);
                dto.setBirthday(birthday);
                dto.setSex(sex);
                dto.setPhone(phone);
                dto.setMail(email);
                dto.setAddress(address);
                dto.setRole(role);
                dto.setStatusId(statusId);
                if (dao.registerAccount(dto)) {
                    System.out.println("da vao register");
                    request.setAttribute("INFOREGISTER", dto);
                    request.setAttribute("CREATESUCCESS", "Create successful!");
                    url = "Register.jsp";
                } else {
                    System.out.println("13333333333333333333333");
                    request.setAttribute("INFOREGISTER", dto);
                    url = "Register.jsp";
                }
            } else {
                request.setAttribute("INFOREGISTER", dto);
                request.setAttribute("REGISTERERROR", error);
                System.out.println("da bao loi exception register");
                url = "Register.jsp";
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author KawaiiScorpy
 */
@WebServlet(name = "UserCreateController", urlPatterns = {"/UserCreateController"})
public class UserCreateController extends HttpServlet {
private static final String ERROR="createUser2.jsp";
private static final String SUCCESS="Login.jsp";
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
         String url = ERROR;
        UserError userError = new UserError();
        try{
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String roleID = "US";
            String confirm = request.getParameter("confirm");
            
            boolean check = true;
            if(userID.length()<2 || userID.length()>10){
                userError.setUserID("UserID must be [2,10]!");
                check = false;
            }
            if(!fullName.matches("([\\sa-zA-Z]+)")){
                userError.setFullName("Name cannot be a number");
                check = false;
            }
            else if(fullName.length()<5 || fullName.length()>50){
                userError.setFullName("fullName must be [5,50]!");
                check = false;
            }
            if(roleID.isEmpty()){
                userError.setRoleID("Please select roleID");
                check = false;
            }
            if(password.length()<2 || password.length()>10){
                userError.setPassword("Password must be [2,10]!");
                check = false;
            }
            if(!confirm.equals(password)){
                userError.setConfirm("2 password ko giong nhau !");
                check = false;
            }
            if(address.length()<5 || address.length()>50){
                userError.setAddress("Address must be [5,50] !");
            }
            if(!phone.matches("^[\\d]+$")){
                userError.setPhone("Phone must be a number ! "); 
            }
            else if(phone.length()<10 || phone.length()>13){
                    userError.setPhone("Phone must be [10,13] !");
                }
            UserDAO dao = new UserDAO();
            if(check){
            boolean checkInsert = dao.insertV2(new UserDTO(userID, fullName, roleID, password, address, phone));
            if(checkInsert){
            url = SUCCESS;
            }
            }else{
            request.setAttribute("USER_ERROR", userError);
            }
        }catch(Exception e){
            log("Error at CreateController : "+e.toString());
            if(e.toString().contains("duplicate")){
            userError.setUserID("Trung ID !! ");
            request.setAttribute("USER_ERROR", userError);
            }
        }finally{
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

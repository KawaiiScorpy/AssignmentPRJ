/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.order.CartProductDTO;
import sample.order.OrderDTO;
import sample.order.OrderDetailsDTO;
import sample.product.Cart;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDTO;

/**
 *
 * @author KawaiiScorpy
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "user.jsp";

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
        ProductDAO dao = new ProductDAO();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        ArrayList<String> cartError = new ArrayList<>();
        boolean checkProduct = true;
        boolean urlSuccess = false;
        try {
            for (Map.Entry entry : cart.getItems().entrySet()) {
                String productID = (String) entry.getKey();
                ProductDTO order = (ProductDTO) entry.getValue();
                int quantity = order.getProductQuantity();
                if (!dao.getQuantityOfProduct(productID, quantity)) {
                    cartError.add("Product: " + order.getProductName() + " don't have enough to buy");
                    checkProduct = false;
                }
            }
            if (checkProduct) {
                int OrderID = (int) (Math.random() * 100000);
                Date date = new Date(System.currentTimeMillis());
                float total=0;
                for(ProductDTO product : cart.getItems().values()){
                    total += product.getProductPrice()*product.getProductQuantity();
                }
                String userID = ((UserDTO) session.getAttribute("LOGIN_USER")).getUserID();
                OrderDTO order = new OrderDTO(OrderID, date, total, userID);
                dao.addOrder(order);
                List<ProductDTO> listProduct = dao.getListProduct();
                if (OrderID != 0) {
                    for (Map.Entry entry : cart.getItems().entrySet()) {
                        String productID = (String) entry.getKey();
                        double price = 0;
                        int quantity2 = 0;
                        for(ProductDTO p : listProduct){
                            if (p.getProductID().equals(productID)) {
                                quantity2 = cart.getItems().get(p.getProductID()).getProductQuantity();
                                price = p.getProductPrice();
                                break;
                            }
                        };
                        int DetailID = (int) (Math.random() * 100000);
                        OrderDetailsDTO detail = new OrderDetailsDTO(DetailID, price, quantity2, OrderID, productID);
                        dao.addDetail(detail);
                        for (ProductDTO product : listProduct) {
                            if (product.getProductID().equals(productID)) {
                                int quantity = product.getProductQuantity();
                                if (quantity >= quantity2) {
                                    dao.updateQuantityOfProduct(productID, quantity - quantity2);
                                    urlSuccess = true;
                                } else if (quantity < quantity2) {
                                    //dao.setStatusBookWhenOutOfShock(productID);
                                }
                            }
                        }
                        
                    }
                } 
                
            }else {
                   urlSuccess = false;
                   request.setAttribute("CART_ERROR", cartError);
            }
            if(urlSuccess){
                session.removeAttribute("CART");
                request.setAttribute("OK", "Thank you for your purchase!");
                url = "GetAllProductController";
            }
            else{
                url = ERROR;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
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

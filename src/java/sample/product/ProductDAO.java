/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.order.OrderDTO;
import sample.order.OrderDetailsDTO;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author KawaiiScorpy
 */
public class ProductDAO {
    public List<ProductDTO> getListProduct(String search) throws ClassNotFoundException, SQLException{
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql=" SELECT ProductID, ProductName, ProductImage, Quantity, Price, CategoryID  "
                        + " FROM tblProduct "
                        + " WHERE ProductName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+ search+"%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    String productImg = rs.getString("ProductImage");
                    int productQuantity = rs.getInt("Quantity");
                    double productPrice = rs.getDouble("Price");
                    String productCaterogy = rs.getString("CategoryID");
                    list.add(new ProductDTO(productID, productName, productImg, productQuantity, productPrice, productCaterogy));
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return list;
    }
    public List<ProductDTO> getListProduct() throws ClassNotFoundException, SQLException{
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql=" SELECT ProductID, ProductName, ProductImage, Quantity, Price, CategoryID  "
                        + " FROM tblProduct "
                        ;
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    String productImg = rs.getString("ProductImage");
                    int productQuantity = rs.getInt("Quantity");
                    double productPrice = rs.getDouble("Price");
                    String productCaterogy = rs.getString("CategoryID");
                    list.add(new ProductDTO(productID, productName, productImg, productQuantity, productPrice, productCaterogy));
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return list;
    }
    public ProductDTO getProduct(String productName) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
               String sql=" SELECT ProductID, ProductName, ProductImage, Quantity, Price "
                        + " FROM tblProduct "
                        + " WHERE ProductName = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, productName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String name = rs.getString("ProductName");
                    String image = rs.getString("ProductImage");
                    int quantity = 1;
                    double money = rs.getDouble("Price");
                    ProductDTO dto = new ProductDTO(productID, name, image, quantity, money);
                    return dto;
                }
            }
        }   catch(Exception e){
            e.printStackTrace();
                }
            finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
    public List<ProductDTO> getProductByCategory(String categoryFilter) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT ProductID, ProductName, ProductImage, Quantity, Price, CategoryID"
                    + " FROM tblProduct"
                    + " WHERE CategoryID like ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + categoryFilter + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("ProductID");
                String productName = rs.getString("ProductName");
                String image = rs.getString("ProductImage");
                int quantity = Integer.parseInt(rs.getString("Quantity"));
                double price = Double.parseDouble(rs.getString("Price"));
                String category = rs.getString("CategoryID");
                list.add(new ProductDTO(productID, productName, image, quantity, price, category));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    public int updateQuantityOfProduct(String ProductID, int Quantity) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProduct\n"
                        + "SET Quantity = ?\n"
                        + "WHERE ProductID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, Quantity);
                stm.setString(2, ProductID);
                return stm.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return -1;
    }
    public int addDetail(OrderDetailsDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblOrderDetail values(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getProductID());
                stm.setInt(2, dto.getOrderID());
                stm.setDouble(3, dto.getPrice());
                stm.setInt(4, dto.getQuantity());
                return stm.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return -1;
    }

    public int addOrder(OrderDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblOrder values(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, dto.getOrderID());
                stm.setDate(2, dto.getDate());
                stm.setString(3, dto.getUserID());
                stm.setFloat(4, dto.getTotal());
                return stm.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return -1;
    }
    public boolean getQuantityOfProduct(String productID, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT ProductID, ProductName, Quantity FROM tblProduct"
                    + " WHERE ProductID = ? AND Quantity >= ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, productID);
            stm.setInt(2, quantity);
            rs = stm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public ArrayList<OrderDTO> listOrderID(String UserID) throws SQLException {
        ArrayList<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT OrderID, Date, Total "
                        + "FROM tblOrder "
                        + "WHERE UserID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new OrderDTO(rs.getInt("OrderID"),
                            rs.getDate("Date"),
                            rs.getFloat("Total"),
                            UserID));
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
     public ProductDTO getProductByID(String proid) throws SQLException {
        ProductDTO dto = new ProductDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ProductID, ProductName, ProductImage, Quantity, Price, CategoryID "
                        + "FROM tblProduct "
                        + "WHERE ProductID = ? ";

                stm = conn.prepareStatement(sql);
                stm.setString(1, proid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    dto = new ProductDTO(rs.getString("ProductID"),
                            rs.getString("ProductName"),
                            rs.getString("ProductImage"),
                            rs.getInt("Quantity"),
                            rs.getDouble("Price"),
                            rs.getString("CategoryID"));
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }
     public ArrayList<OrderDetailsDTO> getListDetailByOrderID(int orderid) throws SQLException {
        ArrayList<OrderDetailsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO dao = new ProductDAO();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT ProductID, OrderID, Price, Quantity "
                        + "FROM tblOrderDetail "
                        + "WHERE OrderID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderid);
                rs = stm.executeQuery();
                while (rs.next()) {
                    
                 
                    ProductDTO dto = dao.getProductByID(rs.getString("ProductID"));
                    list.add(new OrderDetailsDTO(0, rs.getDouble("Price"), rs.getInt("Quantity"), rs.getInt("OrderID"),  dto));
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}

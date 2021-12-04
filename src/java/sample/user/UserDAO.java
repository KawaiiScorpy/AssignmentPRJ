/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author KawaiiScorpy
 */
public class UserDAO {
    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql=" SELECT Name, Address, Phone, RoleID "
                        + " FROM tblUsers "
                        + " WHERE UserID=? AND Password= ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if(rs.next()){
                    String fullName = rs.getString("Name");
                    String address = rs.getString("Address");
                    String phone = rs.getString("Phone");
                    String roleID = rs.getString("RoleID");
                    user = new UserDTO(userID, fullName, roleID, password, address, phone);
                }
            }
        }
    catch(Exception e){
        e.printStackTrace();
    }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
    return user;
}
     public List<UserDTO> getListUser(String search) throws ClassNotFoundException, SQLException{
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql=" SELECT UserID, Name, Password, Address, Phone, RoleID  "
                        + " FROM tblUsers "
                        + " WHERE Name like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+ search+"%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String userID = rs.getString("UserID");
                    String fullName = rs.getString("Name");
                    String password="***";
                    String address = rs.getString("Address");
                    String phone = rs.getString("Phone");
                    String roleID = rs.getString("RoleID");
                    list.add(new UserDTO(userID, fullName, roleID, password, address, phone));
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
     public boolean delete(String userID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql=" DELETE tblUsers "
                        + " WHERE UserID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                check = stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){ 
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
      public boolean update(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
        conn = DBUtils.getConnection();
            if(conn!=null){
                String sql=" UPDATE tblUsers SET Name=?, Address=?, Phone=?, RoleID=? "
                        + " WHERE UserID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getAddress());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getRoleID());
                stm.setString(5, user.getUserID());
                check = stm.executeUpdate()>0? true:false;
            }
        }catch(Exception e){
        e.printStackTrace();
        }finally{
        if(stm!=null) stm.close();
        if(conn!=null) conn.close();
        }
        return check;
    }
      public UserDTO getuserInfo(String userID) throws SQLException, ClassNotFoundException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql=" SELECT Name, Password, Address, Phone, RoleID "
                        + " FROM tblUsers "
                        + " WHERE UserID=?  ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if(rs.next()){
                    String fullName = rs.getString("Name");
                    String roleID = rs.getString("RoleID");
                    String password = rs.getString("Password");
                    String address = rs.getString("Address");
                    String phone = rs.getString("Phone");
                    user = new UserDTO(userID, fullName, roleID, password, address, phone);
                }
            }
        }
    catch(Exception e){
        e.printStackTrace();
    }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
    return user;
}
      public boolean checkDuplicate(String userID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
        conn = DBUtils.getConnection();
        if(conn!=null){
        String sql=" SELECT UserID "
                + " FROM tblUsers "
                + " WHERE UserID=?";
        stm = conn.prepareStatement(sql);
        stm.setString(1, userID);
        rs = stm.executeQuery();
        if(rs.next()){
        check = true;
        }
        }
        }catch(Exception e){
        e.printStackTrace();
        }finally{
        if(rs!=null) rs.close();
        if(stm!=null) stm.close();
        if(conn!=null) conn.close();
        }
        return check;
    }
    public boolean insert(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
        conn = DBUtils.getConnection();
        if(conn!=null){
        String sql=" INSERT INTO tblUsers(UserID, Name, RoleID, Password)"
                + " VALUES(?,?,?,?)";
        stm = conn.prepareStatement(sql);
        stm.setString(1, user.getUserID());
        stm.setString(2, user.getFullName());
        stm.setString(3, user.getRoleID());
        stm.setString(4, user.getPassword());
        check = stm.executeUpdate()>0? true:false;
        
        }
        }catch(Exception e){
        e.printStackTrace();
        }finally{
        if(stm!=null) stm.close();
        if(conn!=null) conn.close();
        }
        return check;
    }
    public boolean insertV2(UserDTO user) throws SQLException, ClassNotFoundException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
        conn = DBUtils.getConnection();
        if(conn!=null){
        String sql=" INSERT INTO tblUsers(UserID, Name, Password, Address, Phone, RoleID)"
                + " VALUES(?,?,?,?,?,?)";
        stm = conn.prepareStatement(sql);
        stm.setString(1, user.getUserID());
        stm.setString(2, user.getFullName());
        stm.setString(3, user.getPassword());
        stm.setString(4, user.getAddress());
        stm.setString(5, user.getPhone());
        stm.setString(6, user.getRoleID());
        check = stm.executeUpdate()>0? true:false;
        
        }
        }finally{
        if(stm!=null) stm.close();
        if(conn!=null) conn.close();
        }
        return check;
    }
}

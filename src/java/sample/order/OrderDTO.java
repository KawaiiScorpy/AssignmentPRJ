/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Date;

/**
 *
 * @author KawaiiScorpy
 */
public class OrderDTO {
    int OrderID;
    Date Date;
    float total;
    String UserID;

    public OrderDTO() {
    }

    public OrderDTO(int OrderID, Date Date, float total, String UserID) {
        this.OrderID = OrderID;
        this.Date = Date;
        this.total = total;
        this.UserID = UserID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }
    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import sample.product.ProductDTO;

/**
 *
 * @author KawaiiScorpy
 */
public class OrderDetailsDTO {
    int DetailID;
    double Price;
    int quantity;
    int OrderID;
    String productID;
    ProductDTO product;
    public OrderDetailsDTO() {
    }
    public OrderDetailsDTO(int DetailID, double Price, int quantity, int OrderID, String productID) {
        this.DetailID = DetailID;
        this.Price = Price;
        this.quantity = quantity;
        this.OrderID = OrderID;
        this.productID = productID;
    }

    public OrderDetailsDTO(int DetailID, double Price, int quantity, int OrderID, ProductDTO product) {
        this.DetailID = DetailID;
        this.Price = Price;
        this.quantity = quantity;
        this.OrderID = OrderID;
        this.product = product;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }
    
    public int getDetailID() {
        return DetailID;
    }
    public void setDetailID(int DetailID) {
        this.DetailID = DetailID;
    }
    public double getPrice() {
        return Price;
    }
    public void setPrice(double Price) {
        this.Price = Price;
    }
    
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public int getOrderID() {
        return OrderID;
    }
    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }
   
   
}

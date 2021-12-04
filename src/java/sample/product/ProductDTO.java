/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author KawaiiScorpy
 */
public class ProductDTO {
    private String productID;
    private String productName;
    private String productImg;
    private int productQuantity;
    private double productPrice;
    private String productCategory;
    
    public ProductDTO(){}

    public ProductDTO(String productID, String productName, String productImg, int productQuantity, double productPrice, String productCategory) {
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
    }
    public ProductDTO(String productID, String productName, int productQuantity, double productPrice){
        this.productID = productID;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
   }

    public ProductDTO(String productID, String productName, String productImg, int productQuantity, double productPrice) {
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
    }
    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", productName=" + productName + ", productImg=" + productImg + ", productQuantity=" + productQuantity + ", productPrice=" + productPrice + ", productCategory=" + productCategory + '}';
    }
    
    
    
}

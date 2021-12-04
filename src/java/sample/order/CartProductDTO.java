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
public class CartProductDTO {
    private int quantity;
    private ProductDTO product;

    public CartProductDTO() {
    }

    public CartProductDTO(int quantity, ProductDTO product) {
        this.quantity = quantity;
        this.product = product;
    }
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quanity) {
        this.quantity = quanity;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }
    
}

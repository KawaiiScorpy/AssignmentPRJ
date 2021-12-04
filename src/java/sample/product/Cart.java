/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author KawaiiScorpy
 */
public class Cart {
     private Map<String, ProductDTO> items = new HashMap<String, ProductDTO>();
     public Cart() {
    }
     public Map<String,ProductDTO> getItems(){
        return  items;
    }
    public void setItems(Map<String, ProductDTO> items) {
        this.items = items;
    }
    public void addProductToCart(ProductDTO dto){
        if(this.items==null){
            this.items = new HashMap<String, ProductDTO>();
        }
        int quantity = 1  ;
        if(this.items.containsKey(dto.getProductID())){
            quantity =  this.items.get(dto.getProductID()).getProductQuantity() + 1;
            dto.setProductQuantity(quantity);
        }
        this.items.put(dto.getProductID(), dto);
        System.out.println(dto);
    }
   public boolean delete(String id) {
        boolean check = false;
        if (items != null) {
            if (this.items.containsKey(id)) {
                this.items.remove(id);
                check = true;
            }
        }
        return check;
    }
    public boolean update(String id, ProductDTO dto) {
        boolean check = false;
        if (this.items != null) {
            if (this.items.containsKey(id)) {
                this.items.replace(id, dto);
                check = true;
            }
        }
        return check;
    }

}

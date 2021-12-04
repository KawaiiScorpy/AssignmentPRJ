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
public class CategoryDTO {
    private String CateID;
    private String CateName;

    public CategoryDTO() {
    }

    public CategoryDTO(String CateID, String CateName) {
        this.CateID = CateID;
        this.CateName = CateName;
    }

    public String getCateID() {
        return CateID;
    }

    public void setCateID(String CateID) {
        this.CateID = CateID;
    }

    public String getCateName() {
        return CateName;
    }

    public void setCateName(String CateName) {
        this.CateName = CateName;
    }
    
}

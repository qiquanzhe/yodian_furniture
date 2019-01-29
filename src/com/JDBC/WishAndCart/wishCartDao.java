package com.JDBC.WishAndCart;

import com.JDBC.Furniture.furnitureUnit;
import com.JDBC.User.userAccount;

import java.util.List;

public interface wishCartDao {
    public List<wishCart> searchWishByUser(userAccount ua);
    public List<wishCart> searchCartByUser(userAccount ua);
    public int delWishCart(userAccount ua, furnitureUnit fu,int stype);
    public int addWishCart(userAccount ua,furnitureUnit fu,int num,int stype);
    public int removeWishCart(userAccount ua,furnitureUnit fu,int num,int stype);
    public int cleanWishCart(userAccount ua,int stype);
}

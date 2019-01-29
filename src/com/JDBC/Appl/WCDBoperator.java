package com.JDBC.Appl;

import com.JDBC.Furniture.furnitureUnit;
import com.JDBC.User.userAccount;
import com.JDBC.WishAndCart.wishCart;
import com.JDBC.WishAndCart.wishCartDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class WCDBoperator {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    private wishCart wishcart ;
    private wishCartDao wishcartDao =
            (wishCartDao) applicationContext.getBean("wishcartDao");

    public List<wishCart> searchWishByUser(userAccount ua){
        return wishcartDao.searchWishByUser(ua);
    }

    public List<wishCart> searchCartByUser(userAccount ua)
    {
        return wishcartDao.searchCartByUser(ua);
    }

    public int delWishCart(userAccount ua, furnitureUnit fu, int stype){
        return wishcartDao.delWishCart(ua,fu,stype);
    }

    public int addWishCart(userAccount ua,furnitureUnit fu,int num,int stype)
    {
        List<wishCart> wclist;
        if(stype == 0)
            wclist = wishcartDao.searchWishByUser(ua);
        else
            wclist = wishcartDao.searchCartByUser(ua);
        for(wishCart wc:wclist)
        {
            if(wc.getFid() == fu.getFid())
                return 0;
        }
        return wishcartDao.addWishCart(ua, fu, num, stype);
    }

    public int removeWishCart(userAccount ua,furnitureUnit fu,int num,int stype)
    {
        return wishcartDao.removeWishCart(ua, fu, num, stype);
    }

    public int cleanWishCart(userAccount ua,int stype)
    {
        return wishcartDao.cleanWishCart(ua, stype);
    }
}

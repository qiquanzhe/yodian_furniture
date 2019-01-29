package com.JDBC.Appl;

import com.JDBC.Furniture.furnitureDao;
import com.JDBC.Furniture.furnitureUnit;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class FDBoperator {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    private furnitureDao fd =
            (furnitureDao) applicationContext.getBean("furnitureDao");
    private furnitureUnit furn;

    public FDBoperator() {
        furn = new furnitureUnit();
    }

    public int addFurniture(int fid,String fname,int fstock,double fprice,String ftype)
    {
        furn.setFid(fid);
        furn.setFname(fname);
        furn.setFstock(fstock);
        furn.setFprice(fprice);
        furn.setFtype(ftype);
        return fd.addFurniture(furn);
    }

    public int deleteFurniture(int fid)
    {
        return fd.deleteFurniture(fid);
    }

    public List<furnitureUnit> listFurniture()
    {
        return fd.findAllFurniture();
    }

    public List<furnitureUnit> searchFurnitureByType(String ftype)
    {
        return fd.searchFurnitureByType(ftype);
    }

    public furnitureUnit searchFurnitureById(int fid)
    {
        List<furnitureUnit> fu = fd.searchFurnitureByFid(fid);
        if(fu.size() == 0)
            return null;
        else return fu.get(0);
    }

    public int modFurniture(furnitureUnit furn)
    {
        return fd.modFuniture(furn);
    }
}

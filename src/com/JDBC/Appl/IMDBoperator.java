package com.JDBC.Appl;

import com.JDBC.ImgIO.ImageUnit;
import com.JDBC.ImgIO.imageDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class IMDBoperator {
    private ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    private imageDao imagedao = (imageDao) applicationContext.getBean("imageDao");
    private ImageUnit imageUnit = new ImageUnit();

    public IMDBoperator() {
        System.out.println("创建了空参构造");
    }

    public boolean addImage(int fid,String fimg)
    {
        imageUnit.setFid(fid);
        imageUnit.setFimg(fimg);
        int num = imagedao.addPicture(imageUnit);
        return num>0;
    }

    public List<ImageUnit> searchImageById(int fid)
    {
        return imagedao.searchImageById(fid);
    }
}

package com.JDBC.ImgIO;

import java.util.List;

public interface imageDao {
    public int addPicture(ImageUnit imageUnit);
    public List<ImageUnit> searchImageById(int fid);
}

package com.JDBC.ImgIO;

public class ImageUnit {
    private int fid;
    private String fimg;

    @Override
    public String toString() {
        return "ImageUnit{" +
                "fid=" + fid +
                ", fimg='" + fimg + '\'' +
                '}';
    }

    public ImageUnit() {
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFimg() {
        return fimg;
    }

    public void setFimg(String fimg) {
        this.fimg = fimg;
    }
}

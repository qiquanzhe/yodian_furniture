package com.JDBC.Furniture;

public class furnitureUnit {
    private int fid;
    private String fname;
    private int fstock;
    private String ftype;
    private double fprice;

    public furnitureUnit() {
    }

    public furnitureUnit(int fid, String fname, int fstock, String ftype, double fprice) {
        this.fid = fid;
        this.fname = fname;
        this.fstock = fstock;
        this.ftype = ftype;
        this.fprice = fprice;
    }

    public double getFprice() {
        return fprice;
    }

    public void setFprice(double fprice) {
        this.fprice = fprice;
    }

    private int fsellno;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public int getFstock() {
        return fstock;
    }

    public void setFstock(int fstock) {
        this.fstock = fstock;
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype;
    }

    public int getFsellno() {
        return fsellno;
    }

    public void setFsellno(int fsellno) {
        this.fsellno = fsellno;
    }

    @Override
    public String toString() {
        return "furnitureUnit{" +
                "fid='" + fid + '\'' +
                ", fname='" + fname + '\'' +
                ", fstock=" + fstock +
                ", ftype='" + ftype + '\'' +
                ", fsellno=" + fsellno +
                '}';
    }
}

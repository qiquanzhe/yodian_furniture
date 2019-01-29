package com.JDBC.WishAndCart;

public class wishCart {
    private String usertel;
    private int fid;
    private int stype;
    private int fnumber;

    public wishCart() {
    }

    @Override
    public String toString() {
        return "wishCart{" +
                "usertel='" + usertel + '\'' +
                ", fid=" + fid +
                ", stype='" + stype + '\'' +
                ", fnumber=" + fnumber +
                '}';
    }

    public String getUsertel() {
        return usertel;
    }

    public void setUsertel(String usertel) {
        this.usertel = usertel;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public int getStype() {
        return stype;
    }

    public void setStype(int stype) {
        this.stype = stype;
    }

    public int getFnumber() {
        return fnumber;
    }

    public void setFnumber(int fnumber) {
        this.fnumber = fnumber;
    }
}

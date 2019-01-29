package com.JDBC.admin;

public class adminAccount {
    private String admintel;

    public String getAdmintel() {
        return admintel;
    }

    public void setAdmintel(String admintel) {
        this.admintel = admintel;
    }

    @Override
    public String toString() {
        return "adminAccount{" +
                "admintel='" + admintel + '\'' +
                '}';
    }
}

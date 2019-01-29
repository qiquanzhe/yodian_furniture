package com.JDBC.admin;

import java.util.List;

public interface adminDao {
    public List<adminAccount> searchAdmin(adminAccount account);
}

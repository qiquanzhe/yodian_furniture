package com.JDBC.User;

import java.util.List;

public interface userAccountDao {
    public int addAccount(userAccount account);
    public List<userAccount> searchAccount(String condition, int model);
    public int searchAccount(userAccount account);
}

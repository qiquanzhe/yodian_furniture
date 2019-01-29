package com.JDBC.Appl;

import com.JDBC.User.userAccount;
import com.JDBC.User.userAccountDao;
import com.JDBC.admin.adminAccount;
import com.JDBC.admin.adminDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class DBoperator {

    private  ApplicationContext applicationContext =
            new ClassPathXmlApplicationContext("applicationContext.xml");
    private  userAccountDao accountDao =
            (userAccountDao) applicationContext.getBean("userAccountDao");
    private adminDao admindao =
            (adminDao) applicationContext.getBean("adminDao");
    private userAccount account = new userAccount();
    private adminAccount admin = new adminAccount();

    public DBoperator() {
    }

    public int registerAccount(String username, String password, String useremail, String usertel)
    {
        account.setUsername(username);
        account.setUserpwd(password);
        account.setUserpwd(usertel);
        account.setUseremail(useremail);
        int num = accountDao.searchAccount(account);
        if(num != 0)
            return num;
        else
        {
            num = accountDao.addAccount(account);
            return 0;
        }
    }

    public userAccount loginAccount(String condition,int model)
    {
        List<userAccount> account = accountDao.searchAccount(condition, model);
        if(account.size() == 0)
            return null;
        else
            return account.get(0);
    }

    public boolean isAdmin(String tel)
    {
        admin.setAdmintel(tel);
        List<adminAccount> tmpAdmin = admindao.searchAdmin(admin);
        if(tmpAdmin.size()>0)
            return true;
        else
            return false;
    }

    public List<userAccount> searchAccount(String condition,int model)
    {
        return accountDao.searchAccount(condition, model);
    }

}

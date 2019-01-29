package com.JDBC.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;

public class userAccountDaoImpl implements userAccountDao {
    private JdbcTemplate jdbcTemplate;

    public userAccountDaoImpl() {
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int addAccount(userAccount account) {

        String sql = "insert into user(username,userpwd,useremail,usertel) value(?,?,?,?)";
        Object[] objects = new Object[]{
                account.getUsername(),
                account.getUserpwd(),
                account.getUseremail(),
                account.getUsertel()
        };

        int num = this.jdbcTemplate.update(sql,objects);
        return  num;
    }

    @Override
    public List<userAccount> searchAccount(String condition, int model) {
        String sql;
        if (model == 1)
            sql = "select * from user where username=?";
        else if (model == 2)
            sql = "select * from user where useremail=?";
        else
            sql = "select * from user where usertel=?";

        RowMapper<userAccount> rowMapper =
                new BeanPropertyRowMapper<userAccount>(userAccount.class);

        return this.jdbcTemplate.query(sql, rowMapper, condition);
    }

    @Override
    public int searchAccount(userAccount account) {
        String sql = "select * from user where username=?";
        int num = this.jdbcTemplate.update(sql,account.getUsername());
        if(num > 0)
            return 1;//返回1，用户名已存在
        sql = "select * from user where useremail=?;";
        num = this.jdbcTemplate.update(sql,account.getUseremail());
        if(num > 0)
            return 2;//返回2，邮箱已存在
        sql = "select * from user where usertel=?;";
        num=this.jdbcTemplate.update(sql,account.getUsertel());
        if(num>0)
            return 3;//返回3，手机已存在
        return 0;//返回0，可以创建
    }

}

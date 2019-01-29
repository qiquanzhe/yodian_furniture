package com.JDBC.admin;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;

public class adminDaoImpl implements adminDao {

    private JdbcTemplate jdbcTemplate;

    public adminDaoImpl() {
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<adminAccount> searchAdmin(adminAccount account) {
        String sql = "select * from admin where admintel=?";

        RowMapper<adminAccount> rowMapper =
                new BeanPropertyRowMapper<adminAccount>(adminAccount.class);
        return  this.jdbcTemplate.query(sql,rowMapper,account.getAdmintel());
    }
}

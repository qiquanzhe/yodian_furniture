package com.JDBC.WishAndCart;

import com.JDBC.Furniture.furnitureUnit;
import com.JDBC.User.userAccount;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;
import java.util.Objects;

public class wishCartDaoImpl implements wishCartDao {

    private JdbcTemplate jdbcTemplate;

    public wishCartDaoImpl() {
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<wishCart> searchWishByUser(userAccount ua) {
        String sql = "select * from wishcart where usertel=? and stype=0";
        RowMapper<wishCart> rowMapper =
                new BeanPropertyRowMapper<wishCart>(wishCart.class);
        return this.jdbcTemplate.query(sql,rowMapper,ua.getUsertel());
    }

    @Override
    public List<wishCart> searchCartByUser(userAccount ua) {
        String sql = "select * from wishcart where usertel=? and stype=1";
        RowMapper<wishCart> rowMapper =
                new BeanPropertyRowMapper<wishCart>(wishCart.class);
        return this.jdbcTemplate.query(sql,rowMapper,ua.getUsertel());
    }

    @Override
    public int delWishCart(userAccount ua, furnitureUnit fu,  int stype) {
        String sql = "delete from wishcart where usertel=? and stype=? and fid=?";
        Object[] objects = new Object[]{
                ua.getUsertel(),
                stype,
                fu.getFid()
        };
        return this.jdbcTemplate.update(sql,objects);
    }

    @Override
    public int addWishCart(userAccount ua, furnitureUnit fu, int num, int stype) {
        String sql = "insert into wishcart(usertel,fid,stype,fnumber) values(?,?,?,?)";
        Object[] objects = new Object[]{
                ua.getUsertel(),
                fu.getFid(),
                stype,
                num
        };
        return this.jdbcTemplate.update(sql,objects);
    }

    @Override
    public int removeWishCart(userAccount ua, furnitureUnit fu, int num, int stype) {
        String sql = "update wishcart set fnumber=fnumber-? where usertel=? and fid=? and stype=?";
        Object[] objects = new Object[]{
                num,
                ua.getUsertel(),
                fu.getFid(),
                stype
        };
        return this.jdbcTemplate.update(sql,objects);
    }

    @Override
    public int cleanWishCart(userAccount ua, int stype) {
        String sql = "delete from wishcart where usertel=? and stype=?";
        Object[] objects = new Object[]{
                ua.getUsertel(),
                stype
        };
        return this.jdbcTemplate.update(sql,objects);
    }
}

package com.JDBC.Furniture;

import com.JDBC.Appl.IMDBoperator;
import com.JDBC.ImgIO.ImageUnit;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import java.io.*;

import java.util.List;

public class furnitureDaoImpl implements furnitureDao {

    private JdbcTemplate jdbcTemplate;

    public furnitureDaoImpl() {
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public int addFurniture(furnitureUnit furn) {
        String sql = "insert into furn(fid,fname,fstock,fprice,ftype) values(?,?,?,?,?)";
        Object[] objects = new Object[]{
                furn.getFid(),
                furn.getFname(),
                furn.getFstock(),
                furn.getFprice(),
                furn.getFtype()
        };

        return this.jdbcTemplate.update(sql,objects);
    }

    @Override
    public List<furnitureUnit> findAllFurniture() {
        String sql = "select * from furn";
        RowMapper<furnitureUnit> rowMapper
                =new BeanPropertyRowMapper<furnitureUnit>(furnitureUnit.class);
        return this.jdbcTemplate.query(sql,rowMapper);
    }

    @Override
    public int deleteFurniture(int fid) {
        String sql = "delete from wishcart where fid=?";
        this.jdbcTemplate.update(sql,fid);
        sql = "delete from fpic where fid=?";
        this.jdbcTemplate.update(sql,fid);
        sql = "delete from furn where fid=?";
        return this.jdbcTemplate.update(sql,fid);
    }

    @Override
    public int modFuniture(furnitureUnit furn) {
        String sql = "update furn set fname=?,fstock=?,fprice=? where fid=?";
        Object[] objects = new Object[]{
                furn.getFname(),
                furn.getFstock(),
                furn.getFprice(),
                furn.getFid()
        };
        return this.jdbcTemplate.update(sql,objects);
    }

    @Override
    public List<furnitureUnit> searchFurnitureByType(String ftype) {
        String sql = "select * from furn where ftype=?";
        RowMapper<furnitureUnit> rowMapper =
                new BeanPropertyRowMapper<furnitureUnit>(furnitureUnit.class);

        return this.jdbcTemplate.query(sql,rowMapper,ftype);
    }

    @Override
    public List<furnitureUnit> searchFurnitureByFid(int fid) {
        String sql = "select * from furn where fid=?";
        RowMapper<furnitureUnit> rowMapper =
                new BeanPropertyRowMapper<furnitureUnit>(furnitureUnit.class);

        return this.jdbcTemplate.query(sql,rowMapper,fid);
    }
}

package com.JDBC.ImgIO;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;

public class imageDaoImpl implements imageDao {

    private JdbcTemplate jdbcTemplate;
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int addPicture(ImageUnit imageUnit) {
        String sql = "insert into fpic values(?,?)";
        Object[] objects = new Object[]{
                imageUnit.getFid(),
                imageUnit.getFimg()
        };
        return this.jdbcTemplate.update(sql,objects);
    }

    @Override
    public List<ImageUnit> searchImageById(int fid) {
        String sql = "select * from fpic where fid=?";
        RowMapper<ImageUnit> rowMapper =
                new BeanPropertyRowMapper<ImageUnit>(ImageUnit.class);

        return this.jdbcTemplate.query(sql,rowMapper,fid);
    }
}

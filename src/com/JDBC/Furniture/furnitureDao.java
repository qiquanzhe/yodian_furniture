package com.JDBC.Furniture;

import java.util.List;

public interface furnitureDao {
    public int addFurniture(furnitureUnit furn);
    public List<furnitureUnit> findAllFurniture();
    public int deleteFurniture(int fid);
    public int modFuniture(furnitureUnit furn);
    public List<furnitureUnit> searchFurnitureByType(String ftype);
    public List<furnitureUnit> searchFurnitureByFid(int fid);
}

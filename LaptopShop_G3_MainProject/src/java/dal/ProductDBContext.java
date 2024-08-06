/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Product;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.ProductDetail;
import model.ProductImg;

/**
 *
 * @author VietAnh
 */
public class ProductDBContext extends DBContext {

    // List product
    public ArrayList<Product> getProducts(int page, int pageSize) {
        ArrayList<Product> listProducts = new ArrayList<>();
        try {
            String sql = "SELECT p.Product_ID, p.Product_Warranty, p.Product_Name, p.Product_Description, "
                    + "p.Product_Price, p.Product_SalePrice, p.Product_Image "
                    + "FROM Product p "
                    + "ORDER BY p.Product_ID "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (page - 1) * pageSize);
            stm.setInt(2, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setWarranty(rs.getString("Product_Warranty"));
                p.setName(rs.getString("Product_Name"));
                p.setDescription(rs.getString("Product_Description"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                listProducts.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProducts;
    }

    public int getTotalProducts() {
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) AS total FROM Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    // Search product by name
    public ArrayList<Product> SearchProductByName(String name) {
        ArrayList<Product> pro = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p\n"
                    + "where p.Product_Name like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));

                pro.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }

    // Sort product by price ascending
    public ArrayList<Product> SortProductByPriceASC(int page, int pageSize) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "SELECT p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image \n"
                    + "FROM Product p \n"
                    + "ORDER BY p.Product_SalePrice ASC \n"
                    + "Offset ? rows fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (page - 1) * pageSize);
            stm.setInt(2, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // Sort product by price descending
    public ArrayList<Product> SortProductByPriceDES(int page, int pageSize) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "SELECT p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image "
                    + "FROM Product p "
                    + "ORDER BY p.Product_SalePrice DESC "
                    + "Offset ? rows fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (page - 1) * pageSize);
            stm.setInt(2, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // List warranty
    public ArrayList<Product> getListWarranty() {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "select  p.Product_Warranty\n"
                    + "from Product p\n"
                    + "group by p.Product_Warranty";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setWarranty(rs.getString("Product_Warranty"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // Count list warranty
    public int CountWarranty(String warranty) {
        int count = 0;
        try {
            String sql = "select count(*) as total\n"
                    + "from Product p \n"
                    + "where p.Product_Warranty = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, warranty);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    // List product by warranty
    public ArrayList<Product> getListProductByWarranty(String warranty) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p\n"
                    + "where p.Product_Warranty = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, warranty);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // List brand
    public ArrayList<Brand> getListBrand() {
        ArrayList<Brand> brands = new ArrayList<>();
        try {
            String sql = "select b.BrandID, b.Brand_Name, b.Brand_Hotline, b.Brand_Address\n"
                    + "from Brand b ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand d = new Brand();
                d.setId(rs.getString("BrandID"));
                d.setName(rs.getString("Brand_Name"));
                d.setHotline(rs.getString("Brand_Hotline"));
                d.setAddress(rs.getString("Brand_Address"));
                brands.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brands;

    }

    // Count product by brand
    public int CountProductByBrand(String brandID) {
        int count = 0;
        try {
            String sql = "select count(*) as total\n"
                    + "from Product p\n"
                    + "where p.Brand_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, brandID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    // List product by brand
    public ArrayList<Product> getListProductByBrand(String brandID) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p\n"
                    + "where p.Brand_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, brandID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // List color product
    public ArrayList<ProductDetail> getListColor() {
        ArrayList<ProductDetail> procs = new ArrayList<>();
        try {
            String sql = "select pd.Laptop_Color\n"
                    + "from Product p join Product_Detail pd on p.Product_ID = pd.Product_ID\n"
                    + "group by pd.Laptop_Color";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductDetail pd = new ProductDetail();
                pd.setColor(rs.getString("Laptop_Color"));
                procs.add(pd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // Count product by color
    public int CountProductByColor(String color) {
        int count = 0;
        try {
            String sql = "select count(*) as total\n"
                    + "from Product p join Product_Detail pd on p.Product_ID = pd.Product_ID\n"
                    + "where pd.Laptop_Color = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, color);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    // List product by color
    public ArrayList<Product> getListProductByColor(String color) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p join Product_Detail pd on p.Product_ID = pd.Product_ID\n"
                    + "where pd.Laptop_Color = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, color);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // Product detail
    public Product getProduct(String productID) {
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Description, p.Product_SalePrice, pd.Laptop_CPU,pd.Laptop_Ram, \n"
                    + "pd.Laptop_Storage, pd.Laptop_GPU, pd.Laptop_Screen, pd.Laptop_Battery, pd.Laptop_Weight, pd.Laptop_Color, pimg.ProductImg_url\n"
                    + "from Product p join Product_Detail pd on p.Product_ID = pd.Product_ID\n"
                    + "join Product_Img pimg on p.Product_ID = pimg.Product_ID\n"
                    + "where p.Product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                ProductDetail pd = new ProductDetail();

                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setDescription(rs.getString("Product_Description"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));

                pd.setCpu(rs.getString("Laptop_CPU"));
                pd.setRam(rs.getString("Laptop_Ram"));
                pd.setStorage(rs.getString("Laptop_Storage"));
                pd.setGpu(rs.getString("Laptop_GPU"));
                pd.setScreen(rs.getString("Laptop_Screen"));
                pd.setBattery(rs.getString("Laptop_Battery"));
                pd.setWeight(rs.getString("Laptop_Weight"));
                pd.setColor(rs.getString("Laptop_Color"));
                p.setProductDetail(pd);

                List<ProductImg> images = new ArrayList<>();
                do {
                    ProductImg pimg = new ProductImg();
                    pimg.setImg_url((rs.getString("ProductImg_url")));
                    images.add(pimg);
                } while (rs.next());
                p.setProductImg(images);
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //You may also like 
    public ArrayList<Product> AdditionProduct() {
        ArrayList<Product> pro = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p\n";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                pro.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }
    
    public ArrayList<Product> getProductsBlog() {
        ArrayList<Product> listProducts = new ArrayList<>();
        try {
            String sql = "select top(3) * from Product Order by Product_SalePrice";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setWarranty(rs.getString("Product_Warranty"));
                p.setName(rs.getString("Product_Name"));
                p.setDescription(rs.getString("Product_Description"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                listProducts.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProducts;
    }
    

}

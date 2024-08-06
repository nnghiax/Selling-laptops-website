/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Category;
import model.Product;
import model.ProductCategory;
import model.ProductDetail;
import model.ProductImg;

/**
 *
 * @author VietAnh
 */
public class ManagerMarketingDBContext extends DBContext{
    
     // List Product and List Category
    public ArrayList<ProductCategory> getListProductCategory() {
        ArrayList<ProductCategory> ListPC = new ArrayList<>();
        try {
            String sql = "select c.Category_Name, p.Product_ID, p.Product_Image, p.Product_Name\n"
                    + "from Product_Category pc join Product p on pc.Product_ID = p.Product_ID\n"
                    + "join Category c on pc.Category_ID = c.Category_ID\n"
                    + "order by Category_Name";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryName(rs.getString("Category_Name"));

                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setImage(rs.getString("Product_Image"));
                p.setName(rs.getString("Product_Name"));

                ProductCategory pc = new ProductCategory();
                pc.setCategory(c);
                pc.setProduct(p);

                ListPC.add(pc);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListPC;
    }

    // List category
    public ArrayList<Category> getListCategory() {
        ArrayList<Category> cats = new ArrayList<>();
        try {
            String sql = "select c.Category_ID, c.Category_Name\n"
                    + "from Category c";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getString("Category_ID"));
                c.setCategoryName(rs.getString("Category_Name"));
                cats.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cats;
    }

    // Filter product by category
    public ArrayList<ProductCategory> filterListProductCategory(String cname) {
        ArrayList<ProductCategory> ListPC = new ArrayList<>();
        try {
            String sql = "select c.Category_Name, p.Product_ID, p.Product_Image, p.Product_Name\n"
                    + "from Product_Category pc join Product p on pc.Product_ID = p.Product_ID\n"
                    + "join Category c on pc.Category_ID = c.Category_ID\n"
                    + "where c.Category_ID = ?\n"
                    + "order by Category_Name";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, cname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryName(rs.getString("Category_Name"));

                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setImage(rs.getString("Product_Image"));
                p.setName(rs.getString("Product_Name"));

                ProductCategory pc = new ProductCategory();
                pc.setCategory(c);
                pc.setProduct(p);

                ListPC.add(pc);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListPC;
    }

    // Search product by ID
    public ArrayList<ProductCategory> searchListProductCategory(String pid) {
        ArrayList<ProductCategory> ListPC = new ArrayList<>();
        try {
            String sql = "select c.Category_Name, p.Product_ID, p.Product_Image, p.Product_Name\n"
                    + "from Product_Category pc join Product p on pc.Product_ID = p.Product_ID\n"
                    + "join Category c on pc.Category_ID = c.Category_ID\n"
                    + "where p.Product_ID = ?\n"
                    + "order by Category_Name";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryName(rs.getString("Category_Name"));

                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setImage(rs.getString("Product_Image"));
                p.setName(rs.getString("Product_Name"));

                ProductCategory pc = new ProductCategory();
                pc.setCategory(c);
                pc.setProduct(p);

                ListPC.add(pc);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ListPC;
    }

    // Add new category for product
    public void addNewCategoryForProduct(ProductCategory pc) {
        try {
            String sql = "INSERT INTO [dbo].[Product_Category]\n"
                    + "           ([Category_ID]\n"
                    + "           ,[Product_ID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pc.getCategory().getCategoryID());
            stm.setString(2, pc.getProduct().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
    
    
    
    
        // List product
    public ArrayList<Product> getProducts() {
        ArrayList<Product> listProducts = new ArrayList<>();
        try {
            String sql = "SELECT p.Product_ID, p.Product_Warranty, p.Product_Name, p.Product_Description, "
                    + "p.Product_Price, p.Product_SalePrice, p.Product_Image "
                    + "FROM Product p "
                    + "ORDER BY p.Product_ID ";
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
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProducts;
    }

    public int countTotalProduct() {
        int count = 0;
        try {
            String sql = "select count (*) as 'Total' from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    // List product by category
    public ArrayList<Product> getProductByCategory(int cid) {
        ArrayList<Product> listPC = new ArrayList<>();
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image\n"
                    + "from Product p join Product_Category pc on p.Product_ID = pc.Product_ID\n"
                    + "where pc.Category_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));

                listPC.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPC;
    }

    // Sort product by price ascending
    public ArrayList<Product> SortProductByPriceASC() {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "SELECT p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image \n"
                    + "FROM Product p \n"
                    + "ORDER BY p.Product_SalePrice ASC \n";
            PreparedStatement stm = connection.prepareStatement(sql);
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
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // Sort product by price descending
    public ArrayList<Product> SortProductByPriceDES() {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "SELECT p.Product_ID, p.Product_Name, p.Product_Price, p.Product_SalePrice, p.Product_Image "
                    + "FROM Product p "
                    + "ORDER BY p.Product_SalePrice DESC ";
            PreparedStatement stm = connection.prepareStatement(sql);
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
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    public int getTotalProduct() {
        try {
            String sql = "select count(*) from product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /*
                                -- 1 offset tu 0 (index-1)*10
                                -- 2 offset tu 10
                                -- 3 offset tu 20
     */
    public ArrayList<Product> pagingProduct(int index) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            String sql = "select p.*\n"
                    + "from Product p\n"
                    + "order by p.Product_ID\n"
                    + "offset ? rows fetch next 10 rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 3);
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
                procs.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    public ArrayList<Product> FilterProduct(String name, Float minPrice, Float maxPrice, String brandID) {
        ArrayList<Product> procs = new ArrayList<>();
        try {
            StringBuilder sql = new StringBuilder("SELECT p.Product_ID, p.Product_Name, p.Product_SalePrice, p.Product_Image ");
            sql.append("FROM Product p WHERE 1=1 ");

            ArrayList<Object> params = new ArrayList<>();

            if (name != null && !name.trim().isEmpty()) {
                sql.append("AND p.Product_Name LIKE ? ");
                params.add("%" + name + "%");
            }
            if (minPrice != null) {
                sql.append("AND p.Product_Price > ? ");
                params.add(minPrice);
            }
            if (maxPrice != null) {
                sql.append("AND p.Product_SalePrice < ? ");
                params.add(maxPrice);
            }
            if (brandID != null && !brandID.trim().isEmpty()) {
                sql.append("AND p.Brand_ID = ? ");
                params.add(brandID);
            }

            PreparedStatement stm = connection.prepareStatement(sql.toString());

            for (int i = 0; i < params.size(); i++) {
                stm.setObject(i + 1, params.get(i));
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));
                p.setImage(rs.getString("Product_Image"));
                procs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return procs;
    }

    // Product detail
    public Product getProductDetail(String code) {
        try {
            String sql = "select p.Product_ID, p.Product_Name, p.Product_Image, p.Product_Warranty, p.Product_Description,\n"
                    + "                    p.Product_Price, p.Product_SalePrice, pd.Laptop_CPU, pd.Laptop_Ram, pd.Laptop_Storage, pd.Laptop_GPU, \n"
                    + "                    pd.Laptop_Screen, pd.Laptop_Battery, pd.Laptop_Weight, pd.Laptop_Color, pd.Laptop_OS, b.BrandID, b.Brand_Name\n"
                    + "                    from Product p join Product_Detail pd on p.Product_ID = pd.Product_ID join Brand b on b.BrandID = p.Brand_ID\n"
                    + "                    where p.Product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                ProductDetail pd = new ProductDetail();

                p.setId(rs.getString("Product_ID"));
                p.setName(rs.getString("Product_Name"));
                p.setImage(rs.getString("Product_Image"));
                p.setWarranty(rs.getString("Product_Warranty"));
                p.setDescription(rs.getString("Product_Description"));
                p.setPrice(rs.getFloat("Product_Price"));
                p.setSalePrice(rs.getFloat("Product_SalePrice"));

                Brand b = new Brand();
                b.setId(rs.getString("BrandID"));
                b.setName(rs.getString("Brand_Name"));
                p.setBrand_ID(b);

                pd.setCpu(rs.getString("Laptop_CPU"));
                pd.setRam(rs.getString("Laptop_Ram"));
                pd.setStorage(rs.getString("Laptop_Storage"));
                pd.setGpu(rs.getString("Laptop_GPU"));
                pd.setScreen(rs.getString("Laptop_Screen"));
                pd.setBattery(rs.getString("Laptop_Battery"));
                pd.setWeight(rs.getString("Laptop_Weight"));
                pd.setColor(rs.getString("Laptop_Color"));
                pd.setOs(rs.getString("Laptop_OS"));

                p.setProductDetail(pd);

                return p;

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Update product 
    public void updateProduct(Product product) {
        try {
            String sql = "UPDATE [Product]\n"
                    + "   SET [Product_Warranty] = ?\n"
                    + "      ,[Brand_ID] = ?\n"
                    + "      ,[Product_Name] = ?\n"
                    + "      ,[Product_Description] = ?\n"
                    + "      ,[Product_Price] = ?\n"
                    + "      ,[Product_SalePrice] = ?\n"
                    + "      ,[Product_Image] = ?\n"
                    + " WHERE [Product_ID] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, product.getWarranty());
            stm.setString(2, product.getBrand_ID().getId());
            stm.setString(3, product.getName());
            stm.setString(4, product.getDescription());
            stm.setFloat(5, product.getPrice());
            stm.setFloat(6, product.getSalePrice());
            stm.setString(7, product.getImage());
            stm.setString(8, product.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Update product detail
    public void updateProductDetail(ProductDetail detail, String productCode) {
        try {
            String sql = "UPDATE [Product_Detail]\n"
                    + "   SET [Laptop_OS] = ?\n"
                    + "      ,[Laptop_CPU] = ?\n"
                    + "      ,[Laptop_Ram] = ?\n"
                    + "      ,[Laptop_Storage] = ?\n"
                    + "      ,[Laptop_GPU] = ?\n"
                    + "      ,[Laptop_Screen] = ?\n"
                    + "      ,[Laptop_Battery] = ?\n"
                    + "      ,[Laptop_Weight] = ?\n"
                    + "      ,[Laptop_Color] = ?\n"
                    + " WHERE [Product_ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, detail.getOs());
            stm.setString(2, detail.getCpu());
            stm.setString(3, detail.getRam());
            stm.setString(4, detail.getStorage());
            stm.setString(5, detail.getGpu());
            stm.setString(6, detail.getScreen());
            stm.setString(7, detail.getBattery());
            stm.setString(8, detail.getWeight());
            stm.setString(9, detail.getColor());
            stm.setString(10, productCode);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Add new product
    public void addNewProduct(Product p) {
        try {
            String sql = "INSERT INTO [Product]\n"
                    + "           ([Product_Warranty]\n"
                    + "           ,[Product_ID]\n"
                    + "           ,[Brand_ID]\n"
                    + "           ,[Product_Name]\n"
                    + "           ,[Product_Description]\n"
                    + "           ,[Product_Price]\n"
                    + "           ,[Product_SalePrice]\n"
                    + "           ,[Product_Image])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, p.getWarranty());
            stm.setString(2, p.getId());
            stm.setString(3, p.getBrand_ID().getId());
            stm.setString(4, p.getName());
            stm.setString(5, p.getDescription());
            stm.setFloat(6, p.getPrice());
            stm.setFloat(7, p.getSalePrice());
            stm.setString(8, p.getImage());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Add detail product
    public void addDetailProduct(ProductDetail pd, String productCode) {
        try {
            String sql = "INSERT INTO [Product_Detail]\n"
                    + "           ([Laptop_OS]\n"
                    + "           ,[Product_ID]\n"
                    + "           ,[Laptop_CPU]\n"
                    + "           ,[Laptop_Ram]\n"
                    + "           ,[Laptop_Storage]\n"
                    + "           ,[Laptop_GPU]\n"
                    + "           ,[Laptop_Screen]\n"
                    + "           ,[Laptop_Battery]\n"
                    + "           ,[Laptop_Weight]\n"
                    + "           ,[Laptop_Color])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pd.getOs());
            stm.setString(2, productCode);
            stm.setString(3, pd.getCpu());
            stm.setString(4, pd.getRam());
            stm.setString(5, pd.getStorage());
            stm.setString(6, pd.getGpu());
            stm.setString(7, pd.getScreen());
            stm.setString(8, pd.getBattery());
            stm.setString(9, pd.getWeight());
            stm.setString(10, pd.getColor());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // List Image by productID
    public ArrayList<ProductImg> getListImage(String pid) {
        ArrayList<ProductImg> pimg = new ArrayList<>();
        try {
            String sql = "select pimg.Product_ID, pimg.ProductImg_url\n"
                    + "from Product_Img pimg\n"
                    + "where pimg.Product_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProductImg p = new ProductImg();
                p.setProductID(rs.getString("Product_ID"));
                p.setImg_url(rs.getString("ProductImg_url"));
                pimg.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pimg;
    }

    // Add list image for product
    public void addListImageProduct(ProductImg pimg) {
        try {
            String sql = "INSERT INTO [Product_Img]\n"
                    + "           ([Product_ID]\n"
                    + "           ,[ProductImg_url])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pimg.getProductID());
            stm.setString(2, pimg.getImg_url());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    

    // Update List Image by productID
    public void updateListImageProduct(ProductImg pimg) {
        try {
            String sql = "UPDATE Product_Img SET ProductImg_url = ? WHERE Product_ID = ? AND ProductImg_url = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pimg.getImg_url());
            stm.setString(2, pimg.getProductID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerMarketingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
        // Delete product by ID
    public void deleteProduct(String productCode) {
        String deleteProductDetailSQL = "DELETE FROM [dbo].[Product_Detail] WHERE [Product_ID] = ?";
        String deleteProductImgSQL = "DELETE FROM [dbo].[Product_Img] WHERE [Product_ID] = ?";
        String deleteProductCategorySQL = "DELETE FROM [dbo].[Product_Category] WHERE [Product_ID] = ?";
        String deleteProductSQL = "DELETE FROM [dbo].[Product] WHERE [Product_ID] = ?";

        try {
            // Start transaction
            connection.setAutoCommit(false);

            // Delete from Product_Detail
            try (PreparedStatement ps = connection.prepareStatement(deleteProductDetailSQL)) {
                ps.setString(1, productCode);
                ps.executeUpdate();
            }


            // Delete from Product_Img
            try (PreparedStatement ps = connection.prepareStatement(deleteProductImgSQL)) {
                ps.setString(1, productCode);
                ps.executeUpdate();
            }

            // Delete from Product_Category
            try (PreparedStatement ps = connection.prepareStatement(deleteProductCategorySQL)) {
                ps.setString(1, productCode);
                ps.executeUpdate();
            }

            // Delete from Product
            try (PreparedStatement ps = connection.prepareStatement(deleteProductSQL)) {
                ps.setString(1, productCode);
                ps.executeUpdate();
            }

            // Commit the transaction if all delete operations succeed
            connection.commit();
        } catch (SQLException ex) {
            // Rollback the transaction if any delete operation fails
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            // Print error information
            ex.printStackTrace();
            throw new RuntimeException("Error deleting product: " + ex.getMessage(), ex);
        } finally {
            // Restore auto-commit mode
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
    }
    
    
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Nguyen Bao
 */
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.BlogNumByDate;
import model.BlogPostType;
import model.BlogStatus;
import model.ChangeHistory;
import model.SaleTrend;
import model.User;

public class BlogListDAO extends DBContext {

    public ArrayList<BlogPostType> getBlogType() throws SQLException {
        ArrayList<BlogPostType> lst = new ArrayList();
        String sql = "select * from BlogPost_Type";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogPostType c = new BlogPostType(rs.getString(1), rs.getString(2));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<Blog> getBlogList() throws SQLException {
        ArrayList<Blog> lst = new ArrayList();
        String sql = "select * from BlogPost";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Blog c = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<Blog> getBlogListExceptHot() throws SQLException {
        ArrayList<Blog> lst = new ArrayList();
        String sql = "WITH BlogPostWithRowNumber AS (\n"
                + "    SELECT *, ROW_NUMBER() OVER (ORDER BY BlogPost_Date DESC) AS RowNum \n"
                + "    FROM BlogPost \n"
                + "    WHERE Blog_Status = 1\n"
                + ")\n"
                + "SELECT * FROM BlogPostWithRowNumber \n"
                + "WHERE RowNum > 1;";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Blog c = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            lst.add(c);
        }
        return lst;
    }

    public Blog getBlogListIsHot() throws SQLException {
        Blog lst = new Blog();
        String sql = "SELECT TOP 1 * \n"
                + "FROM BlogPost \n"
                + "WHERE BLog_Status = 1 \n"
                + "ORDER BY BlogPost_Date DESC;";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            lst = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
        }
        return lst;
    }

    public ArrayList<Blog> getBlogByTypeExceptHot(String msg) throws SQLException {
        ArrayList<Blog> lst = new ArrayList();
        String sql = "WITH BlogPostWithRowNumber AS (\n"
                + "    SELECT *, ROW_NUMBER() OVER (ORDER BY BlogPost_Date DESC) AS RowNum\n"
                + "    FROM BlogPost\n"
                + "    WHERE TypeID = ?\n"
                + ")\n"
                + "SELECT *\n"
                + "FROM BlogPostWithRowNumber\n"
                + "WHERE RowNum > 1;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Blog c = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            lst.add(c);
        }
        return lst;
    }

    public Blog getBlogListByTypeIsHot(String msg) throws SQLException {
        Blog lst = new Blog();
        String sql = "SELECT TOP 1 * FROM BlogPost WHERE TypeID = ? ORDER BY BlogPost_Date DESC";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            lst = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
        }
        return lst;
    }

    public Blog getBlogById(String msg) throws SQLException {
        Blog lst = new Blog();
        String sql = "select b.BlogPost_ID, b.BlogPost_Title, b.BlogPost_Content, u.User_Name, b.BlogPost_Date, b.Img_url, b.Description, b.TypeID from BlogPost b join [User] u on b.User_ID = u.User_ID where BlogPost_ID = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            lst = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
        }
        return lst;
    }

    public ArrayList<Blog> getBlogListBySearch(String msg) throws SQLException {
        ArrayList<Blog> lst = new ArrayList();
        String sql = "SELECT * FROM BlogPost WHERE BlogPost_Title LIKE ?;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, "%" + msg + "%");
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Blog c = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BlogStatus> getAllBlogList() throws SQLException {
        ArrayList<BlogStatus> lst = new ArrayList<>();
        String sql = "select bl.BlogPost_ID, bl.BlogPost_Title, bl.BlogPost_Content, u.User_Name, bl.BlogPost_Date, bl.Img_url, bl.Description, bt.TypeName, bl.BLog_Status from BlogPost bl JOIN BlogPost_Type bt ON bl.TypeID = bt.TypeID JOIN [User] u ON bl.User_ID = u.User_ID";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogStatus c = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BlogStatus> searchAllBlogList(String msg) throws SQLException {
        ArrayList<BlogStatus> lst = new ArrayList<>();
        String sql = "SELECT \n"
                + "    bl.BlogPost_ID, \n"
                + "    bl.BlogPost_Title, \n"
                + "    bl.BlogPost_Content, \n"
                + "    u.User_Name, \n"
                + "    bl.BlogPost_Date, \n"
                + "    bl.Img_url, \n"
                + "    bl.Description, \n"
                + "    bt.TypeName, \n"
                + "    bl.BLog_Status \n"
                + "FROM \n"
                + "    BlogPost bl \n"
                + "JOIN \n"
                + "    BlogPost_Type bt ON bl.TypeID = bt.TypeID \n"
                + "JOIN \n"
                + "    [User] u ON bl.User_ID = u.User_ID \n"
                + "WHERE \n"
                + "    bl.BlogPost_Title LIKE ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, '%' + msg + '%');
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogStatus c = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BlogStatus> filterAllBlogListManage(String msg) throws SQLException {
        ArrayList<BlogStatus> lst = new ArrayList<>();
        String sql = "SELECT \n"
                + "    bl.BlogPost_ID, \n"
                + "    bl.BlogPost_Title, \n"
                + "    bl.BlogPost_Content, \n"
                + "    u.User_Name, \n"
                + "    bl.BlogPost_Date, \n"
                + "    bl.Img_url, \n"
                + "    bl.Description, \n"
                + "    bt.TypeName, \n"
                + "    bl.BLog_Status \n"
                + "FROM \n"
                + "    BlogPost bl \n"
                + "JOIN \n"
                + "    BlogPost_Type bt ON bl.TypeID = bt.TypeID \n"
                + "JOIN \n"
                + "    [User] u ON bl.User_ID = u.User_ID \n"
                + "WHERE \n"
                + "    bt.TypeName = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogStatus c = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<User> listAllAuthorBlog() throws SQLException {
        ArrayList<User> lst = new ArrayList<>();
        String sql = "SELECT * FROM [User] u join Role r ON u.Role_ID = r.Role_ID WHERE r.Role_ID = 2";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            User c = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BlogStatus> filterAllBlogListManageByAuthor(String msg) throws SQLException {
        ArrayList<BlogStatus> lst = new ArrayList<>();
        String sql = "select bl.BlogPost_ID, bl.BlogPost_Title, bl.BlogPost_Content, u.User_Name, bl.BlogPost_Date, bl.Img_url, bl.Description, bt.TypeName, bl.BLog_Status from BlogPost bl JOIN BlogPost_Type bt ON bl.TypeID = bt.TypeID JOIN [User] u ON bl.User_ID = u.User_ID WHERE u.User_Name = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogStatus c = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<BlogStatus> filterAllBlogListManageByStatus(String msg) throws SQLException {
        ArrayList<BlogStatus> lst = new ArrayList<>();
        String sql = "select bl.BlogPost_ID, bl.BlogPost_Title, bl.BlogPost_Content, u.User_Name, bl.BlogPost_Date, bl.Img_url, bl.Description, bt.TypeName, bl.BLog_Status from BlogPost bl JOIN BlogPost_Type bt ON bl.TypeID = bt.TypeID JOIN [User] u ON bl.User_ID = u.User_ID WHERE bl.BLog_Status = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogStatus c = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
            lst.add(c);
        }
        return lst;
    }

    public void UpdateStatusToTrue(String id) throws SQLException {
        String sql = "UPDATE BlogPost SET BLog_Status = 'True' WHERE BlogPost_ID = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        int rowsUpdated = st.executeUpdate();
    }

    public void UpdateStatusToFalse(String id) throws SQLException {
        String sql = "UPDATE BlogPost SET BLog_Status = 'False' WHERE BlogPost_ID = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        int rowsUpdated = st.executeUpdate();
    }

    public BlogStatus getBlogStatus(String id) throws SQLException {
        BlogStatus b = new BlogStatus();
        String sql = "select b.BlogPost_ID, b.BlogPost_Title, b.BlogPost_Content, u.User_Name, b.BlogPost_Date, b.Img_url, b.Description, b.TypeID, b.BLog_Status from BlogPost b join [User] u on b.User_ID = u.User_ID where BlogPost_ID = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            b = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
        }
        return b;
    }

    public void AddNewBlogDetail(String title, String content, int user_id, String date, String img_url, String description, String typeid, boolean status) throws SQLException, SQLException {
        String sql = "INSERT INTO [dbo].[BlogPost] ([BlogPost_Title], [BlogPost_Content], [User_ID], [BlogPost_Date], [Img_url], [Description], [TypeID], [BLog_Status])\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, title);
        st.setString(2, content);
        st.setInt(3, user_id);
        st.setString(4, date);
        st.setString(5, img_url);
        st.setString(6, description);
        st.setString(7, typeid);
        st.setBoolean(8, status);
        int rowsUpdated = st.executeUpdate();
    }

    public void UpdateBlogDetail(String title, String content, int user_id, String date, String img_url, String description, String typeid, boolean status, int id) throws SQLException, SQLException {
        try {
            String sql = "UPDATE [dbo].[BlogPost]\n"
                    + "SET [BlogPost_Title] = ?,\n"
                    + "    [BlogPost_Content] = ?,\n"
                    + "    [User_ID] = ?,\n"
                    + "    [BlogPost_Date] = ?,\n"
                    + "    [Img_url] = ?,\n"
                    + "    [Description] = ?,\n"
                    + "    [TypeID] = ?,\n"
                    + "    [Blog_Status] = ?\n"
                    + "WHERE [BlogPost_ID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setInt(3, user_id);
            st.setString(4, date);
            st.setString(5, img_url);
            st.setString(6, description);
            st.setString(7, typeid);
            st.setBoolean(8, status);
            st.setInt(9, id);
            int rowsUpdated = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserByName(String name) throws SQLException {
        User b = new User();
        String sql = "select * from [User] where User_Name = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, name);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            b = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
        }
        return b;
    }

    public void deleteBlogById(String id) throws SQLException {
        String sql = "DELETE FROM BlogPost WHERE BlogPost_ID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, id);
            st.executeUpdate(); // Execute the update statement (DELETE)
        } catch (SQLException ex) {
            // Handle exception appropriately, e.g., log or throw
            ex.printStackTrace(); // Example of logging the exception
            throw ex; // Rethrow the exception or handle it as needed
        }
    }

    public ArrayList<User> getCustomerForDashboard() throws SQLException {
        ArrayList<User> lst = new ArrayList<>();
        String sql = "select * from [User] u where u.Role_ID = 4";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> searchAllCustomerList(String msg) throws SQLException {
        ArrayList<User> lst = new ArrayList<>();
        String sql = "select * from [User] u where u.Role_ID = 4 and (u.User_Name LIKE ? OR u.User_Email LIKE ? OR u.User_Phone LIKE ?);";
        PreparedStatement st = connection.prepareStatement(sql);
        String searchTerm = '%' + msg + '%';
        st.setString(1, searchTerm);
        st.setString(2, searchTerm);
        st.setString(3, searchTerm);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> sortCustomerByNameAsc() throws SQLException {
        String sql = "SELECT * FROM [User] u WHERE u.Role_ID = 4 ORDER BY u.User_Name ASC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<User> lst = new ArrayList<>();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> sortCustomerByNameDesc() throws SQLException {
        String sql = "SELECT * FROM [User] u WHERE u.Role_ID = 4 ORDER BY u.User_Name DESC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<User> lst = new ArrayList<>();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> sortCustomerByEmailAsc() throws SQLException {
        String sql = "SELECT * FROM [User] u WHERE u.Role_ID = 4 ORDER BY u.User_Email ASC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<User> lst = new ArrayList<>();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> sortCustomerByEmailDesc() throws SQLException {
        String sql = "SELECT * FROM [User] u WHERE u.Role_ID = 4 ORDER BY u.User_Email DESC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<User> lst = new ArrayList<>();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> sortCustomerByPhoneAsc() throws SQLException {
        String sql = "SELECT * FROM [User] u WHERE u.Role_ID = 4 ORDER BY u.User_Phone ASC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<User> lst = new ArrayList<>();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public ArrayList<User> sortCustomerByPhoneDesc() throws SQLException {
        String sql = "SELECT * FROM [User] u WHERE u.Role_ID = 4 ORDER BY u.User_Phone DESC";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        ArrayList<User> lst = new ArrayList<>();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            lst.add(u);
        }
        return lst;
    }

    public User getUserById(int msg) throws SQLException {
        User user = null;
        String sql = "select * from [User] u where u.Role_ID = 4 and u.User_ID = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, msg);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
        }
        return user;
    }

    public void updateUser(String nameString, String emailString, String phoneString, int id) throws SQLException {
        String sql = "UPDATE [User] SET User_Name = ?, User_Email = ?, User_Phone = ? WHERE User_ID = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, nameString);
        st.setString(2, emailString);
        st.setString(3, phoneString);
        st.setInt(4, id);

        int rowsUpdated = st.executeUpdate();
    }

    public void insertChangeHistory(int userid, int changerid, String nameString, String emailString, String phoneString, String dateString) throws SQLException {
        String sql = "INSERT INTO ChangeHistory(User_ID, Changer_ID, Change_Name, Change_Email, Change_Phone, Change_Date) "
                + "VALUES (?, ?, ?, ?, ?, ?);";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, userid);
        st.setInt(2, changerid);
        st.setString(3, nameString);
        st.setString(4, emailString);
        st.setString(5, phoneString);
        st.setString(6, dateString);

        int rowsUpdated = st.executeUpdate();
    }

    public ArrayList<ChangeHistory> getChangeHistoryById(int id) throws SQLException {
        String sql = "SELECT c.User_ID, u2.User_Name, u1.User_Name AS Change_Name, c.Change_Email, c.Change_Phone, c.Change_Date\n"
                + "FROM ChangeHistory c\n"
                + "JOIN [User] u1 ON c.User_ID = u1.User_ID\n"
                + "JOIN [User] u2 ON c.Changer_ID = u2.User_ID\n"
                + "WHERE c.User_ID = ?;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        ArrayList<ChangeHistory> lst = new ArrayList<>();
        while (rs.next()) {
            ChangeHistory u = new ChangeHistory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            lst.add(u);
        }
        return lst;
    }

    public void AddNewBlogType(String type) throws SQLException, SQLException {
        String sql = "INSERT INTO dbo.BlogPost_Type (TypeName) VALUES (?);";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, type);
        int rowsUpdated = st.executeUpdate();
    }

    public BlogPostType getOnlyOneBlogType(int id) throws SQLException {
        BlogPostType blogPostType = null;
        String sql = "SELECT * FROM BlogPost_Type WHERE TypeID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    blogPostType = new BlogPostType(rs.getString("TypeID"), rs.getString("TypeName"));
                }
            }
        }
        return blogPostType;
    }

    public void UpdateBlogType(String type, int id) throws SQLException, SQLException {
        try {
            String sql = "UPDATE [dbo].[BlogPost_Type] SET [TypeName] = ?\n"
                    + "                  WHERE [TypeID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, type);
            st.setInt(2, id);
            int rowsUpdated = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBlogTypeById(int id) throws SQLException {
        String sql = "DELETE FROM [dbo].[BlogPost_Type]\n"
                + "WHERE [TypeID] = ?;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    public boolean checkBlog(int id) throws SQLException {
        String sql = "SELECT 1 FROM BlogPost WHERE TypeID = ?";
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            // Check if there is at least one result
            return rs.next();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public int getNumberBlogPage() throws SQLException {
        String sql = "select count(*) from BlogPost where Blog_Status = 1";
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total / 5;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage - 1;
            }
        } finally {
        }
        return 0; // Return 0 if no result found
    }

    public ArrayList<Blog> getBlogPaged(int id) throws SQLException {
        ArrayList<Blog> lst = new ArrayList();
        String sql = "SELECT *\n"
                + "FROM BlogPost\n"
                + "WHERE Blog_Status = 1\n"
                + "ORDER BY BlogPost_Date DESC\n"
                + "OFFSET ? ROWS FETCH FIRST 5 ROWS ONLY; ";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, (id - 1) * 5 + 1);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Blog c = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            lst.add(c);
        }
        return lst;
    }

    public int getBlogNumInDashBoard() throws SQLException {
        String sql = "select count(*) from BlogPost";
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = total / 7;
                if (total % 7 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } finally {
        }
        return 0; // Return 0 if no result found
    }

    public ArrayList<BlogStatus> getAllBlogListPagedDashboard(int id) throws SQLException {
        ArrayList<BlogStatus> lst = new ArrayList();
        String sql = "SELECT \n"
                + "    bl.BlogPost_ID, \n"
                + "    bl.BlogPost_Title, \n"
                + "    bl.BlogPost_Content, \n"
                + "    u.User_Name, \n"
                + "    bl.BlogPost_Date, \n"
                + "    bl.Img_url, \n"
                + "    bl.Description, \n"
                + "    bt.TypeName, \n"
                + "    bl.Blog_Status \n"
                + "FROM \n"
                + "    BlogPost bl \n"
                + "JOIN \n"
                + "    BlogPost_Type bt ON bl.TypeID = bt.TypeID \n"
                + "JOIN \n"
                + "    [User] u ON bl.User_ID = u.User_ID \n"
                + "ORDER BY \n"
                + "    bl.BlogPost_ID\n"
                + "OFFSET \n"
                + "    ? ROWS \n"
                + "FETCH NEXT \n"
                + "    7 ROWS ONLY;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, (id - 1) * 7);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BlogStatus c = new BlogStatus(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBoolean(9));
            lst.add(c);
        }
        return lst;
    }

    public ArrayList<SaleTrend> getSaleTrend(String from, String to) throws SQLException {
        ArrayList<SaleTrend> lst = new ArrayList();
        String sql = "SELECT \n"
                + "    O.Order_Date,\n"
                + "    SUM(OD.Quantity) AS TotalSold\n"
                + "FROM \n"
                + "    [Order] O\n"
                + "JOIN \n"
                + "    Order_Detail OD ON O.Order_ID = OD.Order_ID\n"
                + "WHERE \n"
                + "    O.Order_Date BETWEEN ? AND ?\n"
                + "GROUP BY \n"
                + "    O.Order_Date\n"
                + "ORDER BY \n"
                + "    O.Order_Date;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, from);
        st.setString(2, to);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            SaleTrend c = new SaleTrend(rs.getString(1), rs.getInt(2));
            lst.add(c);
        }
        return lst;
    }

    public static void main(String[] args) {
        try {
            BlogListDAO db = new BlogListDAO();
            System.out.println(db.getSaleTrend("2023-01-01", "2024-12-31"));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

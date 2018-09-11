/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.dao;

import kietpt.dto.PostDTO;
import kietpt.dto.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import kietpt.db.MyConnection;
import kietpt.dto.CommentDTO;

/**
 *
 * @author KietPT
 */
public class PostDAO {

    public void closeConnection(Connection conn, PreparedStatement preStm, ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    //show CategoryName
    public List<CategoryDTO> showCategoryName() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<CategoryDTO> result = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select ID, CategoryName From Category Where Status = 1";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int id;
            String name = "";
            while (rs.next()) {
                id = rs.getInt("ID");
                name = rs.getString("CategoryName");
                CategoryDTO dto = new CategoryDTO();
                dto.setId(id);
                dto.setName(name);
                result.add(dto);
            }
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    //showSubmittedPostByModer
    public List<PostDTO> showSubmittedPostByModer(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.Collaborator,b.Moderator,u.Fullname as 'ModeratorName',"
                    + "b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',t.Fullname as 'CollaboratorName',b.PostedDay "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users t on t.UserId = b.Collaborator "
                    + "inner join Users u on u.UserId = b.Moderator "
                    + "where b.status = 1 and b.TitleOfPost LIKE ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            int postId, categoryId;
            String collaborator = "", title = "", collaboratorName = "", categoryName = "", moderator = "", moderatorName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                collaborator = rs.getString("Collaborator");
                collaboratorName = rs.getString("CollaboratorName");
                moderator = rs.getString("Moderator");
                moderatorName = rs.getString("ModeratorName");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setCollaborator(collaborator);
                dto.setCollaboratorName(collaboratorName);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setCategoryName(categoryName);
                dto.setModerator(moderator);
                dto.setModeratorName(moderatorName);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showRejectedPostByModer(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.Collaborator,b.Moderator,u.Fullname as 'ModeratorName',"
                    + "b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',t.Fullname as 'CollaboratorName',b.PostedDay "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users t on t.UserId = b.Collaborator "
                    + "inner join Users u on u.UserId = b.Moderator "
                    + "where b.status = 3 and b.TitleOfPost LIKE ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            int postId, categoryId;
            String collaborator = "", title = "", collaboratorName = "", categoryName = "", moderator = "", moderatorName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                collaborator = rs.getString("Collaborator");
                collaboratorName = rs.getString("CollaboratorName");
                moderator = rs.getString("Moderator");
                moderatorName = rs.getString("ModeratorName");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setCollaborator(collaborator);
                dto.setCollaboratorName(collaboratorName);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setCategoryName(categoryName);
                dto.setModerator(moderator);
                dto.setModeratorName(moderatorName);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    //showPostDetail
    public PostDTO showPostDetail(String pid) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        PostDTO dto = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.ContentOfPost,b.MainContent,b.Collaborator,b.SymolPic,"
                    + "b.PublishedDay,b.PostedDay,b.status,b.NumberOfView,"
                    + "b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',u.Fullname as'CollaboratorName' "
                    + "from "
                    + "Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users u on u.UserId = b.Collaborator "
                    + "where b.PostId = ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, pid);
            rs = preStm.executeQuery();
            int postId, status = 0, categoryId, view;
            String content = "", collaboratorId = "", title = "", mainContent = "", symPic = "",
                    categoryName = "", collaboratorName = "";
            Timestamp postedDate, publishedDate;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                content = rs.getString("ContentOfPost");
                collaboratorId = rs.getString("Collaborator");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                collaboratorName = rs.getString("CollaboratorName");
                status = rs.getInt("status");
                postedDate = rs.getTimestamp("PostedDay");
                publishedDate = rs.getTimestamp("PublishedDay");
                mainContent = rs.getString("MainContent");
                symPic = rs.getString("SymolPic");
                view = rs.getInt("NumberOfView");
                dto = new PostDTO(content, collaboratorId, title, mainContent, symPic,
                        categoryName, collaboratorName, categoryId, status, postId, postedDate, publishedDate, view);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return dto;
    }

    public List<PostDTO> showPostByModer(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.Collaborator,b.SymolPic,"
                    + "b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',t.Fullname as 'CollaboratorName',b.PostedDay "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users t on t.UserId = b.Collaborator "
                    + "where b.status = 2 and b.TitleOfPost LIKE ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            int postId, categoryId;
            String collaborator = "", title = "", collaboratorName = "", categoryName = "",symbolPic="";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                collaborator = rs.getString("Collaborator");
                collaboratorName = rs.getString("CollaboratorName");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                date = rs.getTimestamp("PostedDay");
                symbolPic = rs.getString("SymolPic");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setCollaborator(collaborator);
                dto.setCollaboratorName(collaboratorName);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setCategoryName(categoryName);
                dto.setPostedDate(date);
                dto.setSymbolPic(symbolPic);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showSubmittedPostColla(String name, String id) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.Collaborator,b.status, "
                    + " b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',b.PostedDay "
                    + " from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users t on t.UserId = b.Collaborator "
                    + "group by b.status,b.PostId,b.Collaborator,b.TitleOfPost,b.CategoryId,a.CategoryName,b.PostedDay "
                    + "having b.status <=2 and b.TitleOfPost LIKE ? and b.Collaborator = ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            preStm.setString(2, id);
            rs = preStm.executeQuery();
            int postId, categoryId, status;
            String collaborator = "", title = "", categoryName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                collaborator = rs.getString("Collaborator");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                status = rs.getInt("status");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setCollaborator(collaborator);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setCategoryName(categoryName);
                dto.setStatus(status);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showSaveDraftPostColla(String name, String id) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.Collaborator,"
                    + "b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',b.PostedDay "
                    + " from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users t on t.UserId = b.Collaborator "
                    + "where b.status = 4  and b.TitleOfPost LIKE ? and b.Collaborator = ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            preStm.setString(2, id);
            rs = preStm.executeQuery();
            int postId, categoryId;
            String collaborator = "", title = "", categoryName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                collaborator = rs.getString("Collaborator");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setCollaborator(collaborator);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setCategoryName(categoryName);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showUpdatePostColla(String name, String id) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select b.PostId,b.Collaborator,b.Moderator,u.Fullname as 'ModeratorName',"
                    + " b.TitleOfPost,b.CategoryId,a.CategoryName as 'CategoryName',b.PostedDay "
                    + " from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users t on t.UserId = b.Collaborator "
                    + "inner join Users u on u.UserId = b.Moderator "
                    + "where b.status = 3  and b.TitleOfPost LIKE ? and b.Collaborator = ? ";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            preStm.setString(2, id);
            rs = preStm.executeQuery();
            int postId, categoryId;
            String collaborator = "", title = "", categoryName = "", moderatorName = "", moderator = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                collaborator = rs.getString("Collaborator");
                moderator = rs.getString("Moderator");
                moderatorName = rs.getString("ModeratorName");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                categoryName = rs.getString("CategoryName");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setCollaborator(collaborator);
                dto.setModerator(moderator);
                dto.setModeratorName(moderatorName);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setCategoryName(categoryName);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean submitPostByModerator(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Post set ContentOfPost=?,Collaborator=?,TitleOfPost=?,PostedDay=?,"
                    + "status=?,CategoryId=?,"
                    + "SymolPic=?,MainContent=?,Moderator=? where PostId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, post.getContent());
            preStm.setString(2, post.getCollaborator());
            preStm.setString(3, post.getTitle());
            preStm.setTimestamp(4, post.getPostedDate());
            preStm.setInt(5, post.getStatus());
            preStm.setInt(6, post.getCateId());
            preStm.setString(7, post.getSymbolPic());
            preStm.setString(8, post.getMainContent());
            preStm.setString(9, post.getModerator());
            preStm.setInt(10, post.getPostId());
            result = preStm.executeUpdate() > 0;
            System.out.println("Change status successfully status = 1");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean addPostByCollaborator(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "insert into Post (ContentOfPost, Collaborator,TitleOfPost,PostedDay,PublishedDay"
                    + ",status,CategoryId,SymolPic,MainContent,NumberOfView) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            System.out.println("abcbabcbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
            preStm.setString(1, post.getContent());
            preStm.setString(2, post.getCollaborator());
            preStm.setString(3, post.getTitle());
            preStm.setTimestamp(4, post.getPostedDate());
            preStm.setTimestamp(5, post.getPublishedDate());
            preStm.setInt(6, post.getStatus());
            preStm.setInt(7, post.getCateId());
            preStm.setString(8, post.getSymbolPic());
            preStm.setString(9, post.getMainContent());
            preStm.setInt(10, post.getNumberOfView());
            result = preStm.executeUpdate() > 0;
            System.out.println(" insert thanh cong");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean saveDraftPostByCollaborator(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "insert into Post (ContentOfPost, Collaborator,TitleOfPost,PostedDay,"
                    + "PublishedDay,status,CategoryId,SymolPic,MainContent,NumberOfView) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            System.out.println("abcbabcbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
            preStm.setString(1, post.getContent());
            preStm.setString(2, post.getCollaborator());
            preStm.setString(3, post.getTitle());
            preStm.setTimestamp(4, post.getPostedDate());
            preStm.setTimestamp(5, post.getPublishedDate());
            preStm.setInt(6, post.getStatus());
            preStm.setInt(7, post.getCateId());
            preStm.setString(8, post.getSymbolPic());
            preStm.setString(9, post.getMainContent());
            preStm.setInt(10, post.getNumberOfView());
            result = preStm.executeUpdate() > 0;
            System.out.println(" save draft thanh cong");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean saveDraftPostDetailColla(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Post set ContentOfPost=?,Collaborator=?,TitleOfPost=?,PostedDay=?,"
                    + "status=?,CategoryId=?,"
                    + "SymolPic=?,MainContent=? where PostId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, post.getContent());
            preStm.setString(2, post.getCollaborator());
            preStm.setString(3, post.getTitle());
            preStm.setTimestamp(4, post.getPostedDate());
            preStm.setInt(5, post.getStatus());
            preStm.setInt(6, post.getCateId());
            preStm.setString(7, post.getSymbolPic());
            preStm.setString(8, post.getMainContent());
            preStm.setInt(9, post.getPostId());
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean updatePostByColla(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Post set ContentOfPost=?,Collaborator=?,TitleOfPost=?,PostedDay=?,"
                    + "status=?,CategoryId=?,"
                    + "SymolPic=?,MainContent=? where PostId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, post.getContent());
            preStm.setString(2, post.getCollaborator());
            preStm.setString(3, post.getTitle());
            preStm.setTimestamp(4, post.getPostedDate());
            preStm.setInt(5, post.getStatus());
            preStm.setInt(6, post.getCateId());
            preStm.setString(7, post.getSymbolPic());
            preStm.setString(8, post.getMainContent());
            preStm.setInt(9, post.getPostId());
            result = preStm.executeUpdate() > 0;
            System.out.println("Change status successfully status = 2");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean rejectPostByModerator(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Post set status = ?, PostedDay = ?, Moderator = ? where PostId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, post.getStatus());
            preStm.setTimestamp(2, post.getPostedDate());
            preStm.setString(3, post.getModerator());
            preStm.setInt(4, post.getPostId());
            result = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showPostHeader() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 4 PostId,PostedDay,TitleOfPost,SymolPic,MainContent "
                    + "from Post "
                    + "where status = 1 "
                    + "order by PostedDay DESC";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId;
            String title = "", content = "", mainContent = "", symbolPic = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                symbolPic = rs.getString("SymolPic");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setTitle(title);
                dto.setContent(content);
                dto.setMainContent(mainContent);
                dto.setSymbolPic(symbolPic);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showPostCamera() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 5 b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "where b.status = 1 and b.CategoryId = 2 "
                    + "order by b.PostedDay desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId, cateId;
            String title = "", mainContent = "", symbolPic = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                symbolPic = rs.getString("SymolPic");
                date = rs.getTimestamp("PostedDay");
                cateId = rs.getInt("CategoryId");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setTitle(title);
                dto.setMainContent(mainContent);
                dto.setSymbolPic(symbolPic);
                dto.setPostedDate(date);
                dto.setCateId(cateId);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showPostLatop1() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 2 b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "where b.status = 1 and b.CategoryId = 1 "
                    + "order by b.PostedDay desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId, categoryId;
            String title = "", mainContent = "", symbolPic = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                mainContent = rs.getString("MainContent");
                symbolPic = rs.getString("SymolPic");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setMainContent(mainContent);
                dto.setSymbolPic(symbolPic);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showPostLatop2() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 4 b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "where b.status = 1 and b.CategoryId = 1 "
                    + "order by b.PostedDay asc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId, categoryId;
            String title = "", mainContent = "", symbolPic = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                title = rs.getString("TitleOfPost");
                categoryId = rs.getInt("CategoryId");
                mainContent = rs.getString("MainContent");
                symbolPic = rs.getString("SymolPic");
                date = rs.getTimestamp("PostedDay");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setTitle(title);
                dto.setCateId(categoryId);
                dto.setMainContent(mainContent);
                dto.setSymbolPic(symbolPic);
                dto.setPostedDate(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showPostMobile() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 5 b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "where b.status = 1 and b.CategoryId = 3 "
                    + "order by b.PostedDay desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId, cateId;
            String title = "", mainContent = "", symbolPic = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                symbolPic = rs.getString("SymolPic");
                date = rs.getTimestamp("PostedDay");
                cateId = rs.getInt("CategoryId");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setTitle(title);
                dto.setMainContent(mainContent);
                dto.setSymbolPic(symbolPic);
                dto.setPostedDate(date);
                dto.setCateId(cateId);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showCamera() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT  u.Fullname as 'CollaboratorName', b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users u on u.UserId=b.Collaborator "
                    + " where b.status = 1 and b.CategoryId = 2 "
                    + "   order by b.NumberOfView desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId;
            String symbolPic = "", title = "", mainContent = "", collaboratorName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                symbolPic = rs.getString("SymolPic");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                date = rs.getTimestamp("PostedDay");
                collaboratorName = rs.getString("CollaboratorName");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setSymbolPic(symbolPic);
                dto.setTitle(title);
                dto.setMainContent(mainContent);
                dto.setPostedDate(date);
                dto.setCollaboratorName(collaboratorName);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showLaptop() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT  u.Fullname as 'CollaboratorName', b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users u on u.UserId=b.Collaborator "
                    + " where b.status = 1 and b.CategoryId = 1 "
                    + "   order by b.NumberOfView desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId;
            String symbolPic = "", title = "", mainContent = "", collaboratorName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                symbolPic = rs.getString("SymolPic");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                date = rs.getTimestamp("PostedDay");
                collaboratorName = rs.getString("CollaboratorName");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setSymbolPic(symbolPic);
                dto.setTitle(title);
                dto.setMainContent(mainContent);
                dto.setPostedDate(date);
                dto.setCollaboratorName(collaboratorName);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showMobile() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT  u.Fullname as 'CollaboratorName', b.* "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "inner join Users u on u.UserId=b.Collaborator "
                    + " where b.status = 1 and b.CategoryId = 3 "
                    + "   order by b.NumberOfView desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId;
            String symbolPic = "", title = "", mainContent = "", collaboratorName = "";
            Timestamp date;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                symbolPic = rs.getString("SymolPic");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                date = rs.getTimestamp("PostedDay");
                collaboratorName = rs.getString("CollaboratorName");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setSymbolPic(symbolPic);
                dto.setTitle(title);
                dto.setMainContent(mainContent);
                dto.setPostedDate(date);
                dto.setCollaboratorName(collaboratorName);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public List<PostDTO> showPostTinNoiBat() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<PostDTO> result = new ArrayList<PostDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 4 b.PostId,b.TitleOfPost,b.MainContent,b.SymolPic,b.NumberOfView "
                    + "from Category a inner join Post b on a.ID = b.CategoryId "
                    + "where b.status = 1 "
                    + "order by b.NumberOfView desc ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            int postId, view;
            String title = "", mainContent = "", symbolPic = "";
            while (rs.next()) {
                postId = rs.getInt("PostId");
                title = rs.getString("TitleOfPost");
                mainContent = rs.getString("MainContent");
                symbolPic = rs.getString("SymolPic");
                view = rs.getInt("NumberOfView");
                PostDTO dto = new PostDTO();
                dto.setPostId(postId);
                dto.setTitle(title);
                dto.setMainContent(mainContent);
                dto.setSymbolPic(symbolPic);
                dto.setNumberOfView(view);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean updateNumberOfView(PostDTO post) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean checked = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Post set NumberOfView = ? where PostId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, post.getNumberOfView());
            preStm.setInt(2, post.getPostId());
            checked = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return checked;
    }

    public int getNumberOfView(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int view = 0;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select NumberOfView from Post where PostId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                view = rs.getInt("NumberOfView");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return view;
    }

    public boolean insertComment(CommentDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean checked = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into Comment values(?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, dto.getPostId());
            preStm.setString(2, dto.getContentOfCmt());
            preStm.setTimestamp(3, dto.getTimeOfCmt());
            preStm.setBoolean(4, dto.isStatus());
            preStm.setString(5, dto.getUserId());
            checked = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return checked;
    }

    public List<CommentDTO> getComment(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<CommentDTO> result = new ArrayList<CommentDTO>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select u.Fullname as 'Fullname',c.* "
                    + "from Comment c inner join Users u on u.UserId = c.UserId "
                    + "where c.PostID = ? and c.status = 'true' ";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            int postId, commentId;
            String userId, fullname, content;
            Timestamp date;
            boolean status;
            while (rs.next()) {
                postId = rs.getInt("PostId");
                commentId = rs.getInt("ID");
                userId = rs.getString("UserId");
                fullname = rs.getString("Fullname");
                content = rs.getString("ContentOfComment");
                status = rs.getBoolean("status");
                date = rs.getTimestamp("TimeOfComment");

                CommentDTO dto = new CommentDTO();
                dto.setPostId(postId);
                dto.setIdComment(commentId);
                dto.setUserId(userId);
                dto.setFullname(fullname);
                dto.setContentOfCmt(content);
                dto.setStatus(status);
                dto.setTimeOfCmt(date);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }
}

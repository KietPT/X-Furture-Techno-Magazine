/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.dao;

import kietpt.dto.CategoryDTO;
import kietpt.dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import kietpt.db.MyConnection;
import kietpt.dto.PostDTO;
import kietpt.dto.User_RolePermissionDTO;
import kietpt.dto.UsersDTO;

/**
 *
 * @author KietPT
 */
public class UserDAO {

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

    public int coutUser() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int count = 0 ;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select count(UserId) as 'sum'\n"
                    + "from Users ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("sum");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return count;
    }

    public UsersDTO findByUserID(String UserID) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        UsersDTO dto = new UsersDTO();
        String UserId, password, fullname, phone, address, mail;
        int role, statusId;
        boolean sex;
        Timestamp birthday;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select UserId, Password, Fullname, Birthday, Phone, Address, Mail, Sex, Role, StatusId From Users Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, UserID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                UserId = rs.getString("UserId");
                password = rs.getString("Password");
                fullname = rs.getString("Fullname");
                birthday = rs.getTimestamp("Birthday");
                phone = rs.getString("Phone");
                address = rs.getString("Address");
                mail = rs.getString("Mail");
                sex = rs.getBoolean("Sex");
                role = rs.getInt("Role");
                statusId = rs.getInt("StatusId");
                dto = new UsersDTO(UserId, password, fullname, phone, address, mail, role, statusId, sex, birthday);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return dto;
    }

    public int checkLogin(String userId, String pass) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int role = 0, statusId = -1;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Role, StatusId From Users Where UserId = ? and Password = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userId);
            preStm.setString(2, pass);
            rs = preStm.executeQuery();
            if (rs.next()) {
                role = rs.getInt("Role");
                statusId = rs.getInt("StatusId");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        if (statusId == -1) {
            role = -1;
        } // Invalid username or password
        if (statusId == 0) {
            role = 0;
        } // account has been banned
        return role;
    }

    public List<CategoryDTO> showCategory() throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<CategoryDTO> result = new ArrayList<>();
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select * From Category ";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            String name = "";
            int id;
            while (rs.next()) {
                id = rs.getInt("ID");
                name = rs.getString("CategoryName");
                CategoryDTO dto = new CategoryDTO();
                dto.setId(id);
                dto.setName(name);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean registerAccount(UsersDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into Users values(?,?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUserId());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getFullname());
            preStm.setTimestamp(4, dto.getBirthday());
            preStm.setString(5, dto.getPhone());
            preStm.setString(6, dto.getAddress());
            preStm.setString(7, dto.getMail());
            preStm.setBoolean(8, dto.isSex());
            preStm.setInt(9, dto.getRole());
            preStm.setInt(10, dto.getStatusId());
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

    public boolean checkOldPass(String UserId, String oldPass) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        String presentPass = "";
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Password from Users Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, UserId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                presentPass = rs.getString("Password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        if (oldPass.equals(presentPass)) {
            check = true;
        }
        return check;
    }

    public boolean changePass(String UserId, String newPass) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Users Set Password = ? Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, newPass);
            preStm.setString(2, UserId);
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

    public ArrayList<User_RolePermissionDTO> findLikeByName(String nameSearch) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        ArrayList<User_RolePermissionDTO> result = new ArrayList<User_RolePermissionDTO>();
        User_RolePermissionDTO dto = new User_RolePermissionDTO();
        String userId, fullname, rolename;
        int statusId;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Users.UserId, Users.Fullname, RolePermission.RoleName, Users.StatusId\n"
                    + "From Users, RolePermission \n"
                    + "Where Users.Role = RolePermission.RoleId AND Users.Fullname LIKE ? AND Role != '4'";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + nameSearch + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                userId = rs.getString("UserId");
                fullname = rs.getString("Fullname");
                rolename = rs.getString("RoleName");
                statusId = rs.getInt("StatusId");
                dto = new User_RolePermissionDTO(userId, fullname, rolename, statusId);
                result.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return result;
    }

    public boolean adminCreateAccount(UsersDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert into Users values(?,?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUserId());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getFullname());
            preStm.setTimestamp(4, dto.getBirthday());
            preStm.setString(5, dto.getPhone());
            preStm.setString(6, dto.getAddress());
            preStm.setString(7, dto.getMail());
            preStm.setBoolean(8, dto.isSex());
            preStm.setInt(9, dto.getRole());
            preStm.setInt(10, dto.getStatusId());
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

    public boolean adminUpdateAccount(UsersDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Users set Password = ?, Fullname = ?, Birthday = ?, Phone = ?,"
                    + "Address = ?, Mail = ?, Sex = ?, Role = ?, StatusId = ? Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getPassword());
            preStm.setString(2, dto.getFullname());
            preStm.setDate(3, new java.sql.Date(dto.getBirthday().getTime()));
            preStm.setString(4, dto.getPhone());
            preStm.setString(5, dto.getAddress());
            preStm.setString(6, dto.getMail());
            preStm.setBoolean(7, dto.isSex());
            preStm.setInt(8, dto.getRole());
            preStm.setInt(9, dto.getStatusId());
            preStm.setString(10, dto.getUserId());
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

    public boolean UpdateAccount(UsersDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Users set Fullname = ?, Birthday = ?, Phone = ?,"
                    + "Address = ?, Mail = ?, Sex = ? Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getFullname());
            preStm.setTimestamp(2, dto.getBirthday());
            preStm.setString(3, dto.getPhone());
            preStm.setString(4, dto.getAddress());
            preStm.setString(5, dto.getMail());
            preStm.setBoolean(6, dto.isSex());
            preStm.setString(7, dto.getUserId());
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

    public boolean SetRoleAndBanAccount(String userId, int role, int statusId) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Users set Role = ?, StatusId = ? Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, role);
            preStm.setInt(2, statusId);
            preStm.setString(3, userId);
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

    public boolean checkPK(String UserId) throws SQLException {
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select UserId From Users Where UserId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, UserId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, preStm, rs);
        }
        return check;
    }

//    public UsersDTO findUser(String userId) throws SQLException {
//        Connection conn = null;
//        PreparedStatement preStm = null;
//        ResultSet rs = null;
//        UsersDTO dto = null;
//        try {
//            conn = MyConnection.getMyConnection();
//            String sql = "Select UserId, Fullname From Users Where UserId = ? ";
//            preStm = conn.prepareStatement(sql);
//            preStm.setString(1, userId);
//            rs = preStm.executeQuery();
//            String id = "", name = "";
//            if (rs.next()) {
//                id = rs.getString("UserId");
//                name = rs.getString("Fullname");
//                dto = new UsersDTO();
//                dto.setUserId(userId);
//                dto.setFullname(name);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeConnection(conn, preStm, rs);
//        }
//        return dto;
//    }
    public ArrayList<PostDTO> topPost(Timestamp from, Timestamp to) throws SQLException {
        ArrayList<PostDTO> result = new ArrayList<>();
        PostDTO dto = new PostDTO();
        Connection conn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "SELECT TOP 5 Collaborator, COUNT(Collaborator) AS TotalPost,  SUM(NumberOfView) AS TotalView\n"
                    + "FROM Post\n"
                    + "WHERE ? <= PostedDay AND PostedDay <= ?  AND status = '1'\n"
                    + "GROUP BY Collaborator\n"
                    + "ORDER BY TotalPost DESC, TotalView DESC";
            preStm = conn.prepareStatement(sql);
            preStm.setTimestamp(1, from);
            preStm.setTimestamp(2, to);
            rs = preStm.executeQuery();

            String collaboratorName;
            int totalPost, totalView;

            while (rs.next()) {
                collaboratorName = rs.getString("Collaborator");
                totalPost = rs.getInt("TotalPost");
                totalView = rs.getInt("TotalView");
                dto = new PostDTO(collaboratorName, totalPost, totalView);
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

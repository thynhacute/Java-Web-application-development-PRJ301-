package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;


public class UserDAO {

    private static final String LOGIN = "SELECT userID, fullName, roleID, address, birthday, phone, email FROM tblUsers WHERE userID = ? AND password = ? AND status = 1";
    private static final String SEARCH = "SELECT userID, fullName, roleID FROM tblUsers WHERE fullName like ?";

    public List<UserDTO> getListUser(String search) throws SQLException {
       List<UserDTO> listUser = new ArrayList<>(); 
       Connection conn = null;
       PreparedStatement ptm = null;
       ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String password = "***";
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    listUser.add(new UserDTO(userID, fullName, roleID, password, address, birthday, phone, email));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
       return listUser;
    }
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID,fullName,roleID,address,birthday,phone,email FROM tblUsers WHERE userID=? AND password=?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    user = new UserDTO(userID, fullName, roleID, "", address, birthday, phone, email);
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != conn) {
                rs.close();
            }
            if (ptm != conn) {
                ptm.close();
            }
            if (conn != conn) {
                conn.close();
            }

        }
        return user;
    }

    

    
}

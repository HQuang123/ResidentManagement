/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.*;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author huyng
 */
public class UserDAO extends DBContext {

    private static final Logger logger = Logger.getLogger(UserDAO.class.getName());

    public User getAccount(String user, String pass) {
        String sql = "select * from Users where "
                + "Email =? and Password = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, user);
            stmt.setString(2, pass);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("UserId"), rs.getString("FullName"),
                        rs.getString("Email"), rs.getString("Password"), rs.getString("Role"), rs.getString("Address"), rs.getString("PhoneNumber")
                );
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occured during getting the user account", ex);
        }
        return null;

    }

    public void updateAccount(int userId, String FullName, String Email, String phone) {
        String sql = "update Users set FullName = ?, Email = ?, PhoneNumber = ? where UserID = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, FullName);
            stmt.setString(2, Email);
            stmt.setString(3, phone);
            stmt.setInt(4, userId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occured during getting the user account", ex);
        }
    }

    public User getUserById(int userId) {
        String sql = "select * from Users where userId = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs;
            rs = stmt.executeQuery();
            while(rs.next()){
                return new User(rs.getInt("UserId"),rs.getString("FullName"), rs.getString("Email"),
                        rs.getString("Password"), rs.getString("Role"), rs.getString("Address"), rs.getString("PhoneNumber"));
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "An error occured during getting the user account", ex);
        }
        return null;
    }

}

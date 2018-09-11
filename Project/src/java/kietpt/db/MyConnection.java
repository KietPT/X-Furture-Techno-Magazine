/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kietpt.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author KietPT
 */
public class MyConnection {

    public static Connection getMyConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=X-Future", "sa", "sa12345678");
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

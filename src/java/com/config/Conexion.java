package com.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection con;
    String JDBC_URL = "jdbc:mysql://localhost:3306/carritocompras_db?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    String JDBC_USER = "root";
    String JDBC_PASSWORD = "admin";

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (Exception e) {
        }
        return con;
    }
}

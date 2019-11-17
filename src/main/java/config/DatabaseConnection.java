package config;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

import Utils.MessageUtils;
import oracle.jdbc.*;
import oracle.sql.*;

public class DatabaseConnection
{
    private static DatabaseConnection instance = null;
    private static java.sql.Connection connection = null;

    public static DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    public java.sql.Connection getConnection(){
        return connection;
    }

    public void destroyConnection(){
        if (connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                System.out.println("Error while closing connection:"+ e.getMessage());
            }
        }
    }

    public void finallyHandler(PreparedStatement statement, ResultSet rs){
        try {
            if (statement != null) {
                statement.close();
            }
            if (rs != null){
                rs.close();
            }
        }catch (Exception e){
            System.out.println(MessageUtils.ERR_UNABLE_CONN_CLOSE + e.getMessage());
        }
        destroyConnection();
    }

    public void finallyHandler(Statement statement, ResultSet rs){
        try {
            if (statement != null) {
                statement.close();
            }
            if (rs != null){
                rs.close();
            }
        }catch (Exception e){
            System.out.println(MessageUtils.ERR_UNABLE_CONN_CLOSE + e.getMessage());
        }
        destroyConnection();
    }

    public void finallyHandler(Statement statement){
        try {
            if (statement != null) {
                statement.close();
            }
        }catch (Exception e){
            System.out.println(MessageUtils.ERR_UNABLE_CONN_CLOSE + e.getMessage());
        }
        destroyConnection();

    }

    public void finallyHandler(PreparedStatement statement){
        try {
            if (statement != null) {
                statement.close();
            }
        }catch (Exception e){
            System.out.println(MessageUtils.ERR_UNABLE_CONN_CLOSE + e.getMessage());
        }
        destroyConnection();

    }

    private DatabaseConnection(){
        try {
            InputStream input = new FileInputStream("src/resources/db.properties");
            Properties props = new Properties();
            props.load(input);
            Class.forName(props.getProperty("db.driverClassName"));
            connection = DriverManager.getConnection(
                            props.getProperty("db.url"),
                            props.getProperty("db.username"),
                            props.getProperty("db.password"));
            //System.out.println("Connection established.");
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            }catch(IOException e) {
                System.out.println("Problems while connecting to database:"+e.getMessage());
            }
            catch(Exception e){
                System.out.println("Cannot read properties"+e.getMessage());
        }
    }
}

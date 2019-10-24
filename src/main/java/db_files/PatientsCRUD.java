package main.java.db_files;

import main.java.config.DatabaseConnection;

import java.sql.*;

public class PatientsCRUD
{
    public static void executeUpdates(String query) throws SQLException {
        Connection connection = new DatabaseConnection().getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate(query);
            try {
                    statement.close();
            }
            catch (SQLException e) {
                throw e;
            }
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void checkIfPatientTableExistsElseCreate(int facility_id){
        Connection connection = new DatabaseConnection().getConnection();
        Statement statement;
        String patient_table_name = "patient_"+ facility_id;
        String query = "SELECT table_name from user_tables where table_name = '"+patient_table_name+"'";
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                System.out.println("Table present");
            }
            else {
                System.out.println("Patient table not present, creating a new one...");
//                try {
//                    executeUpdates(new_patient_table);
//                    System.out.println("Created a new patient table.");
//                }
//                catch (SQLException e){
//                    System.out.println("Unable to execute the update:"+ e.getMessage());
//                }
            }
            try {
                statement.close();
            }
            catch (SQLException e) {
                System.out.println("Unable to close the sql statement:" + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Unable to check if patient table exists:"+ e.getMessage());
        }
    }
}
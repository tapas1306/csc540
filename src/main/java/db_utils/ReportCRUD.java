package db_utils;

import Utils.ViewerContext;
import config.DatabaseConnection;
import entities.ReportRefererral;

import javax.swing.text.View;
import java.sql.*;
import java.util.ArrayList;

public class ReportCRUD {

    public static boolean reportReferral() {
        ReportRefererral rep = ViewerContext.getInstance().getPatientReport();

        Integer fid = rep.getFacility_id();
        fid = 1;
        if (fid == null){
            return false;
        }

        Connection connection = DatabaseConnection.getInstance().getConnection();
        String report_table = "REPORT_REFERRAL_" + fid.toString();
        String query = "INSERT into " + report_table + " (REPORT_ID, STAFF_ID)" +
                "values( ? , ? )";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,  rep.getReport_id());
            ps.setInt(2, rep.getStaff_id());

            boolean row_affected  = ps.execute();
            //ResultSet rs = ps.getGeneratedKeys();
            //if(rs.next())
              //  reason_id = rs.getInt(1);
            //rep.setReport_id(reason_id);
            ViewerContext.getInstance().setPatientReport(rep);
        } catch (SQLException e) {
            System.out.println("Error occurred while inserting for report referral " +e.getMessage());
        }

        return true;
    }

    public static boolean addReferralReason() {
        int reason_id = -1;
        ReportRefererral rep = ViewerContext.getInstance().getPatientReport();

        Integer fid = rep.getFacility_id();
        fid = 1;
        if (fid == null){
            return false;
        }

        Connection connection = DatabaseConnection.getInstance().getConnection();
        String report_table = "REPORT_REFERRAL_REASON_" + fid.toString();
        String query = "INSERT into " + report_table + " (REPORT_ID, REASON_CODE, " +
                "REASON_DESCRIPTION, SERVICE_CODE)" + "values( ? , ? , ? , ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(query, new String[]{"REASON_ID"});
            //ps.setInt(1, 1);
            ps.setInt(1,  rep.getReport_id());
            ps.setInt(2, rep.getReason_code());
            ps.setString(3, rep.getReason());
            ps.setInt(4, rep.getService_code());

            boolean row_affected  = ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next())
                reason_id = rs.getInt(1);
            rep.setReason_id(reason_id);
            ViewerContext.getInstance().setPatientReport(rep);
        } catch (SQLException e) {
            System.out.println("Error occurred while inserting for referral reason " +e.getMessage());
        }

        return true;
    }

    public static boolean addPatientReport() {
        int report_id = -1;
        ReportRefererral rep = ViewerContext.getInstance().getPatientReport();

        Integer fid = rep.getFacility_id();
        fid = 1;
        if (fid == null){
            return false;
        }

        Connection connection = DatabaseConnection.getInstance().getConnection();
        String report_table = "REPORT_" + fid.toString();
        String query = "INSERT into " + report_table + " (NEG_EXP_ID, NEGATIVE_EXPERIENCE_TEXT, " +
                "TREATMENT, VISIT_ID, DISCHARGE_STATUS) " + "values( ? , ? , ? , ? , ? )";

        try {
            PreparedStatement ps = connection.prepareStatement(query, new String[]{"REPORT_ID"});
            ps.setInt(1,  rep.getNegative_experience_value());
            ps.setString(2, rep.getNegative_experience_text());
            ps.setString(3, rep.getTreatment());
            ps.setInt(4, rep.getVisit_id());
            ps.setString(5, rep.getDischarge_status());

            boolean row_affected  = ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next())
                report_id = rs.getInt(1);
            rep.setReport_id(report_id);
            ViewerContext.getInstance().setPatientReport(rep);
        } catch (SQLException e) {
            System.out.println("Error occurred while inserting for add report for patient " +e.getMessage());
        }

        return true;
    }
}

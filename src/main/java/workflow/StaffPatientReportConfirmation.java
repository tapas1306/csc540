package workflow;

import Utils.CommandLineUtils;
import Utils.IScreen;
import Utils.MessageUtils;
import Utils.ViewerContext;
import entities.ReportRefererral;
import db_utils.ReportCRUD;

public class StaffPatientReportConfirmation extends IScreen {
    public void display(){
        System.out.println(MessageUtils.STAFF_PATIENT_REPORT_CONFIR.CONFIRM.ordinal() + MessageUtils.GLOBAL_DELIMITER +
                MessageUtils.STAFF_PATIENT_REPORT_CONFIRM);
        System.out.println(MessageUtils.STAFF_PATIENT_REPORT_CONFIR.GO_BACK.ordinal() + MessageUtils.GLOBAL_DELIMITER +
                MessageUtils.GLOBAL_GO_BACK);
        System.out.println(MessageUtils.GLOBAL_NEWLINE);
        System.out.println(MessageUtils.GLOBAL_ENTER_OPTION + MessageUtils.GLOBAL_DELIMITER);
    }
    public void run(){

        boolean invalidOption;
        do {
            invalidOption = false;
            int option;
            display();
            String opt = CommandLineUtils.ReadInput();
            try {
                option = Integer.parseInt(opt);
                MessageUtils.STAFF_PATIENT_REPORT_CONFIR options = MessageUtils.STAFF_PATIENT_REPORT_CONFIR.values()[option];
                switch (options) {
                    case CONFIRM:
                        ReportCRUD.addPatientReport();
                        ReportCRUD.reportReferral();
                        ReportCRUD.addReferralReason();
                        ViewerContext.getInstance().setGoToPage(ViewerContext.PAGES.StaffMenu);
                        invalidOption = false;
                        break;
                    case GO_BACK:
                        ViewerContext.getInstance().setGoToPage(ViewerContext.PAGES.StaffPatientReport);
                        break;
                    default:
                        invalidOption = true;
                }
            } catch (Exception e) {
                System.out.println(MessageUtils.GLOBAL_OPTION_ERROR);
                invalidOption = true;
            }
        } while (invalidOption);
    }
}

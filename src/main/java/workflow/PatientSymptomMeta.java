package workflow;

import Utils.CommandLineUtils;
import Utils.IScreen;
import Utils.MessageUtils;
import Utils.ViewerContext;
import entities.PatientSymptom;

public class PatientSymptomMeta extends IScreen {
    public void display(){
        boolean invalid;
        do {
            invalid = false;
            System.out.println(MessageUtils.PATIENT_SYM_META_BP);
            String bodyPart = CommandLineUtils.ReadInput();

            System.out.println(MessageUtils.PATIENT_SYM_META_DUR);
            String durationStr = CommandLineUtils.ReadInput();
            int duration = 0;
            try {
                duration = Integer.parseInt(durationStr);
            } catch (Exception e) {
                System.out.println(MessageUtils.GLOBAL_PROPER_VALUE);
                invalid = true;
                continue;
            }
            System.out.println(MessageUtils.PATIENT_SYM_META_REOCCUR);
            String reoccuring = CommandLineUtils.ReadInput();

            System.out.println(MessageUtils.PATIENT_SYM_META_SEV);
            String severity = CommandLineUtils.ReadInput();

            System.out.println(MessageUtils.PATIENT_SYM_META_CAUSE);
            String incident = CommandLineUtils.ReadInput();

            PatientSymptom pSym = new PatientSymptom();
            pSym.setDuration(duration);
            pSym.setPostEvent(incident);
            pSym.setIsRecurring(reoccuring);
            pSym.setSeverityValue(severity);
            pSym.setBodyPart(bodyPart);
            ViewerContext.getInstance().addSymptom(pSym);
            return;
        }while(invalid);
    }

    public void run(){
        this.display();
        return;
    }
}

package workflow;
import Utils.CommandLineUtils;
import Utils.MessageUtils;
import Utils.IScreen;
import db_files.FacilityCRUD;
import db_files.SymptomCRUD;
import entities.MedicalFacility;
import entities.Symptom;

import java.net.StandardSocketOptions;
import java.util.ArrayList;

public class PatientCheckIn implements  IScreen {

    public void run(){
        display();
    }

    public void display(){
        ArrayList<Symptom> arr = SymptomCRUD.read();
        for(int i=0; i < arr.size(); i++){
            System.out.println(Integer.toString(i) + " "  + ((Symptom)arr.get(i)).getSymptom_name());
        }
    }
}
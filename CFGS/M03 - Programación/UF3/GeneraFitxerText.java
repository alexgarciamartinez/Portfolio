/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

import java.io.*;
import java.util.*;

/**
 *
 * @author alexg
 */
public class GeneraFitxerText {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        String nom, cognoms, telefon, adreca;
        try{
            FileWriter flux = new FileWriter("Agenda.txt");
            BufferedWriter fitxer = new BufferedWriter(flux);
            do{
                System.out.println("Insereix un nom (INTRO per finalitzar)");
                nom = sc.nextLine();
                if(nom.length() > 0){
                    System.out.println("Cognoms: ");
                    cognoms = sc.nextLine();
                    System.out.println("Telèfon: ");
                    telefon = sc.nextLine();
                    System.out.println("Adreça: ");
                    adreca = sc.nextLine();
                    fitxer.write("\"" + nom + "\",\"" + cognoms + "\",\"" 
                                    + telefon + "\",\"" + adreca + "\"");
                    fitxer.newLine();
                }
            }while(nom.length() != 0);
            fitxer.close();
        }catch(IOException e){System.out.println("Error al fitxer");}
    }
}

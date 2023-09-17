/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03a1;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex04_CreacioAgenda {
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
                    System.out.println("Telèfon: ");
                    telefon = sc.nextLine();
                    fitxer.write(nom + "-" 
                                    + telefon);
                    fitxer.newLine();
                }
            }while(nom.length() != 0);
            fitxer.close();
        }catch(IOException e){System.out.println("Error al fitxer");}
    }
}

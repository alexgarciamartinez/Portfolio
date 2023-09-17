package m03a1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alexg
 */
public class Ex05_LecturaAgenda {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        //String nom, telefon;
        try {
            FileReader flux = new FileReader("Agenda.txt");
            BufferedReader fitxer = new BufferedReader(flux);

            String line;
            while ((line = fitxer.readLine()) != null) {
                String[] parts = line.split("-");

                if (parts.length == 2) {
                    String nom = parts[0].trim();
                    String telefon = parts[1].trim();

                    System.out.println("Nom: " + nom + " - Telèfon: " + telefon);
                }
            }

            fitxer.close();
        } catch (IOException e) {
            System.out.println("S'ha produït un error en llegir el fitxer.");
            e.printStackTrace();
        }
    }
}

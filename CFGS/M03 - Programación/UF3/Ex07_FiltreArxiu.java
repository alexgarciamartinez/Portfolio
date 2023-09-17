/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03a1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex07_FiltreArxiu {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introdueixi el nom del fitxer: ");
        String ficheroABuscar = sc.nextLine();
        int lineas = 0;
        int lineasEscritas = 0;
        try {
            FileReader flux = new FileReader(ficheroABuscar);
            BufferedReader fitxer = new BufferedReader(flux);
            FileWriter fluxWrite = new FileWriter("Resultats.txt");
            BufferedWriter fitxerWrite = new BufferedWriter(fluxWrite);
            PrintWriter printWriter = new PrintWriter(fitxerWrite);

            String line;
            while ((line = fitxer.readLine()) != null) {
                if (line.startsWith("*")) {
                    
                    printWriter.println(line);
                    lineasEscritas++;
                }
                lineas++;
            }
            fitxer.close();
            printWriter.close();
            System.out.println("Total líneas: " + lineas);
            System.out.println("Líneas escritas: " + lineasEscritas);
        } catch (IOException e) {
            System.out.println("S'ha produït un error en llegir el fitxer.");
            e.printStackTrace();
        }
         /*Scanner scanner = new Scanner(System.in);
        System.out.print("Introdueix el nom de l'arxiu: ");
        String nomFitxer = scanner.nextLine();

        int líniesLlegides = 0;
        int líniesEscrites = 0;

        try {
            FileReader fileReader = new FileReader(nomFitxer);
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            FileWriter fileWriter = new FileWriter("Resultats.txt");
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            PrintWriter printWriter = new PrintWriter(bufferedWriter);

            String línia;
            while ((línia = bufferedReader.readLine()) != null) {
                líniesLlegides++;

                if (línia.startsWith("*")) {
                    printWriter.println(línia);
                    líniesEscrites++;
                }
            }

            bufferedReader.close();
            printWriter.close();
        } catch (IOException e) {
            System.out.println("S'ha produït un error en llegir o escriure l'arxiu.");
            e.printStackTrace();
        }

        System.out.println("Nombre de línies llegides: " + líniesLlegides);
        System.out.println("Nombre de línies escrites: " + líniesEscrites);*/
    }
}

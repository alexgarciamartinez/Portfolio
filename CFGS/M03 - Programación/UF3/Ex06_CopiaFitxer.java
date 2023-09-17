/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03a1;

import java.io.*;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex06_CopiaFitxer {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        String comando = sc.nextLine();
        String[] comandoArray = comando.split(" ");
        String origen = comandoArray[2];
        String desti = comandoArray[3];

        try {
            FileReader flux = new FileReader(origen);
            BufferedReader fitxer = new BufferedReader(flux);
            FileWriter fluxWrite = new FileWriter(desti);
            BufferedWriter fitxerWrite = new BufferedWriter(fluxWrite);
            PrintWriter printWriter = new PrintWriter(fitxerWrite);
            String line;
            while ((line = fitxer.readLine()) != null) {
                printWriter.println(line);
                
            }
            fitxer.close();
            printWriter.close();
        } catch (IOException e) {
            System.out.println("S'ha produït un error en llegir el fitxer.");
            e.printStackTrace();
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.copernic.m03.uf1a5;

import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex04_FrequenciesNotes {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int []notesPosibles = new int [11];
        System.out.println("Introdueix una nota (de 0 a 10, o un valor diferent per sortir): ");
        int n = sc.nextInt();
        while (n >= 0 && n <= 10){
            System.out.println("Introdueix una nota (de 0 a 10, o un valor diferent per sortir): ");
            notesPosibles[n]++;            
            n = sc.nextInt();
        }
        for (int i = 0; i < notesPosibles.length; i++){
            System.out.println("La nota " + i + " ha sortit " + notesPosibles[i] + " vegades");
        }
    }
}

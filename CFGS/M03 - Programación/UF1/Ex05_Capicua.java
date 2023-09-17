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
public class Ex05_Capicua {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introdueix un nombre natural: ");
        int numeroInt = sc.nextInt();
        String numeroStr = String.valueOf(numeroInt);
        String numeroInvertit = "";
        System.out.println("El nombre " + numeroStr + " té " + numeroStr.length() + " xifres.");
        
        int [] xifra = new int [numeroInt];
        for (int i = 0; i < numeroStr.length(); i++){
            xifra[i] = Integer.parseInt(numeroStr.substring(i, i+1));
        }
        for (int i = 0; i < numeroStr.length(); i++){
            System.out.println("Xifra " + (i + 1) + ": " + xifra[i]);
        }
        for (int i = 1; i <= numeroStr.length(); i++){
            numeroInvertit += numeroStr.charAt(numeroStr.length() - i);
        }
        int inversio = 0;
        int nverdader;
        nverdader = numeroInt;
        //System.out.println(n);
        while (numeroInt > 0) {
            int resto = numeroInt % 10;
            inversio = inversio * 10 + resto;
            numeroInt /= 10;
        }
        if (nverdader == inversio) {
            System.out.println("El teu nombre és capicua.");
        }
        else {
            System.out.println("El teu nombre NO és capicua.");
        }
    }
}

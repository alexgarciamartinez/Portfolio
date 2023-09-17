/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.copernic.m03.uf1a5;

import java.util.Locale;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex09_BitlletsIMonedes {
    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introdueixi quantitat de diners: ");
        double d = sc.nextDouble();
        int[] b = {500, 200, 100, 100, 50, 20, 10, 5, 2, 1, 0,50, 0,20, 0,10, 0,05, 0,02, 0,01};
        int[] quantitat = new int [14];
        
        for (int i = 0; d != 0; i++){
            if (d > b[i]){
                quantitat[0] = (int)d - b[i];
                d = d-b[i];
            }
        }
        for (int i = 0; i < quantitat.length; i++){
            System.out.println(quantitat[i]);
        }
    }
}

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
public class Ex02_CalculsVector {
    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        Scanner sc = new Scanner(System.in);
        final int total = 10;
        int [] valors = new int [total];
        for (int i = 0; i < valors.length;++i){
            System.out.print("Introdueix el valor de la posicio " + i + ": ");
            valors[i] = sc.nextInt();
        }
        for (int i = 0; i < valors.length;++i){
            System.out.println("El valor de la posicio " + i + " és: " + valors[i]);
        }
        
        int suma = 0;
        int max = valors[0];
        int min = valors[0];
        for (int i = 0; i < valors.length; i++){
            suma += valors[i];
            if (valors[i] < min){
                min = valors[i];
            }
            else if (valors[i] > max){
                max = valors[i];
            }
        }        
        float mitjana = (float)suma / (float)total;        
        System.out.printf("La mitjana aritmètica dels valors del vector és: %.5f\n" , mitjana);
        System.out.println("El valor màxim del vector és: " + max);
        System.out.println("El valor mínim del vector és: " + min);
        System.out.println("La suma dels valors del vector és: " + suma);
    }
}

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
public class Ex17_CalculDeLaMediana {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introdueix una sèrie de nombres enters ordenats: ");
        String entrada = sc.nextLine();
        String[] valores = entrada.split(" ");
        
        int N = valores.length;
        if (N % 2 != 0){
            System.out.println("El valor de la mediana és: " + valores[N/2]);
        }
        else {
            double resultat = (Integer.parseInt(valores[N/2-1]) + Integer.parseInt(valores[N/2]))/2.0;
            System.out.printf("El valor de la mediana és: %.1f\n" , resultat);
        }
    }
}

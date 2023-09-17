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
public class Ex01_LlegirIMostrarVector {
    public static void main(String[] args) {
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
    }
}

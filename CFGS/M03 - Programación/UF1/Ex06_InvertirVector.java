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
public class Ex06_InvertirVector {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int n = sc.nextInt();
        int []vector = new int [n];
        int numeroIntroduit;
        for (int i = 0; i < n; i++){
            numeroIntroduit = sc.nextInt();
            vector[i] = numeroIntroduit;
        }
        for (int i = 1; i <= vector.length; i++){
            System.out.print(vector[vector.length - i] + ( i == vector.length ? "" : ", "));
        }
        System.out.print(".");
    }
}

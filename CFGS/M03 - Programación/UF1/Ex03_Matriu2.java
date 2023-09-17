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
public class Ex03_Matriu2 {
    public static void main(String[] args) {
        int matriu[][] = new int[4][4];
        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                matriu[i][j] = sc.nextInt();
            }
        }

        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(matriu[i][j]);
                if (j != 3) {
                    System.out.print("\t");
                }
            }
            System.out.println();
        }
        System.out.println("");

        int n = 0;
        for (int i = 0; i < 4; i++) {
            n += matriu[i][i];
        }
        System.out.println("Traça: " + n);
        System.out.println("");
        System.out.println("Matriu transposada:");
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(matriu[j][i]);
                if (j != 3) {
                    System.out.print("\t");
                }
            }
            System.out.println("");
        }
    }
}


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
public class Ex10_Matriu4x4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int[][] matriu = new int[4][4];
        for (int i = 0; i < 4; i++) {
          for (int j = 0; j < 4; j++) {
            matriu[i][j] = sc.nextInt();
          }
        }
        for (int i = 0; i < 4; i++) {
          for (int j = 0; j < 4; j++) {
            if (matriu[i][j] != matriu[i][3]){
                System.out.print(matriu[i][j] + "\t");
            }
            else {
                System.out.print(matriu[i][j]);
            }
          }
          System.out.println();
        }

        int suma = 0;
        for (int i = 0; i < 4; i++) {
          suma += matriu[i][i];
        }
        System.out.println("");
        System.out.println("Traça: " + suma);
        System.out.println("");

        for (int i = 0; i < 4; i++) {
          for (int j = 0; j < 4; j++) {
            if (matriu[j][i] == matriu[3][i]) {
              System.out.print(matriu[j][i]);
            }
            else {
                System.out.print(matriu[j][i] + "\t");
            }
          }
          System.out.println();
        }
    }
}

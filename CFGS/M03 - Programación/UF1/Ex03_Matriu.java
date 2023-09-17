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
public class Ex03_Matriu {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int n = sc.nextInt();
        int [][] matriu = new int [4][n];
        matriu [0] [0] = 2;

        for (int i = 1; i < n; i++){
            matriu [0][i] = matriu[0][i - 1] + 2;
        }

        for (int i = 0; i < n; i++){
            matriu [1][i] = (1 + i) * (1 + i);
        }

        for (int i = 0; i < n; i++){
            matriu[2][i] = matriu[0][i] - matriu[1][i];
        }

        for (int i = 0; i < n; i++){
            matriu[3][i] = matriu [0][i] + matriu [1][i] + matriu [2][i];
        }
        for (int i = 0; i < 4; i++){
            for (int j = 0; j < n; j++){
                System.out.print(matriu[i][j] + "\t");
            }
            System.out.println();
        }
    }
}

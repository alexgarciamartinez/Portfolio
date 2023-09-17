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
public class Ex18_DiagonalInversa {
    public static void main(String[] args) {
        Locale.setDefault(Locale.US);
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introdueix la mida de la matriu: [2-10] ");
        int N = sc.nextInt();
        int[][]matriu = new int [N][N];
        int traca = 0;
        int tracaInversa = 0;
        
        for (int i = 0; i < N; i++){
            for (int j = 0; j < N; j++){
                matriu[i][j] = sc.nextInt();
                if (i == j){
                    traca += matriu[i][j];
                }
            }
        }
        for (int i = 0; i < N; i++){
            for (int j = 0; j < N; j++){
                if (j == N - 1 - i){
                    tracaInversa += matriu[i][j];
                }
            }
        }        
        /*for (int i = 0; i < N; i++){
            tracaInversa += matriu[i][N - 1 - i];
        }
        int traca = 0;
        for (int i = 0; i < N; i++) {
          if (i == i){
            traca += matriu[i][i];
          }
        }*/
        System.out.println("Traça: " + traca);
        System.out.println("Traça inversa: " + tracaInversa);
    }
}

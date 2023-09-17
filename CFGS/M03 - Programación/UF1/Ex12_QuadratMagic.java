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
public class Ex12_QuadratMagic {
    public static void main(String[] args) {
                    Scanner scanner = new Scanner(System.in);
            int n;

            // Demanem un nombre senar del 3 al 21
            do {
                
              System.out.print("Introdueix un nombre senar del 3 al 21: ");
              n = scanner.nextInt();
              if(scanner.hasNextInt()){
                  break;
              }
            } while (n < 3 || n > 21 || n % 2 == 0 || !scanner.hasNextInt());
            // Creem la matriu del quadrat màgic
            int[][] quadrat = new int[n][n];

            // Inicialitzem les variables
            int i = 0;
            int j = n / 2;
            int valor = 1;

            // Omplim la matriu del quadrat màgic
            while (valor <= n * n) {
              quadrat[i][j] = valor;

              valor++;
              i--;
              j++;

              // Si hem arribat a una casella fora de la matriu, tornem a la primera fila/columna
              if (i < 0) {
                i = n - 1;
              }
              if (j >= n) {
                j = 0;
              }

              // Si la casella està ocupada, anem a la següent fila
              if (quadrat[i][j] != 0) {
                i++;
              }
            }

            // Trobem el número més gran per poder alinear tots els valors per la dreta
            int max = 0;
            for (int[] fila : quadrat) {
              for (int num : fila) {
                max = Math.max(max, num);
              }
            }
            int amplada = String.valueOf(max).length();

            // Mostrem la matriu per pantalla
            for (int[] fila : quadrat) {
              for (int num : fila) {
                System.out.printf("%" + amplada + "d ", num);
              }
              System.out.println();
            }
          
    }
}

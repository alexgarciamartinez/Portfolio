package m03uf2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex06_Matrius {
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        
        // Creació matriu
        int[][] matriuTest = { {1,7,2,9,12},{9,24,45,12,7},{98,1,65,7,34} };
        modificaMatriu(matriuTest);
        mostraMatriu(matriuTest);
        
        // Demanar la matriu (files i columnes)
        System.out.print("Files: ");
        int totalFiles = sc.nextInt();
        System.out.print("Columnes: ");
        int totalColumnes = sc.nextInt();
        System.out.print("Valor minim: ");
        int totalMinim = sc.nextInt();
        System.out.print("Valor màxim: ");
        int totalMaxim = sc.nextInt();
        // Invocació
        /*int[][] matriuIntroduida = demanaMatriu(totalFiles, totalColumnes);
        System.out.println("Matriu amb dades introduides per teclat: ");
        mostraMatriu(matriuIntroduida);*/
        
        int[][] matriuIntroduida = generaMatriu(totalFiles, totalColumnes, totalMinim, totalMaxim);
        System.out.println("Matriu amb dades introduides per teclat: ");
        mostraMatriu(matriuIntroduida);
    }
    public static void mostraMatriu(int[][] matriu){
            for (int fila = 0; fila < matriu.length; fila++){
                for (int columna = 0; columna < matriu[0].length; columna++){
                    System.out.print(matriu[fila][columna] + "\t");
                }
                System.out.println("");
            }
    }
    public static int[][] demanaMatriu(int files, int columnes){
        int [][] resultat = new int[files][columnes];
        for (int fila = 0; fila < files; fila++){
            System.out.println("Dades de la fila " + fila + ":");
            for (int columna = 0; columna < columnes; columna++){
                System.out.print("Valor " + columna + ":" );
                int valor = sc.nextInt();
                resultat[fila][columna] = valor;
            }
            System.out.println("");
        }
        return resultat;
    }
    public static int[][] generaMatriu(int files, int columnes, int min, int max){
        int[][] resultat = new int[files][columnes];
        Random rnd = new Random();
        for (int fila = 0; fila < files; fila++){
            for (int columna = 0; columna < columnes; columna++){
                //int valorRandom = (int)(Math.random()*(max-min+1)+min);
                resultat[fila][columna] = rnd.nextInt(max-min)+min;
            }
            System.out.println("");
        }
        return resultat;
    }
    public static void modificaMatriu(int[][] matriu){
        matriu[0][1] = 120;
    }
    public int sumaValors(int[][] matriu){
        return 0;
    }
}

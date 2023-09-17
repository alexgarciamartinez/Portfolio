package m03uf2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex05_GeneraPrimers {
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        
        int[] primers = new int [100];
        
        int N = 2;
        int index = 0;
        while (index < 100) {
            boolean resultat = esNombrePrimer(N);
            if (resultat){
                primers[index] = N;
                index++;
            }
            N++;
        }
        for (int valor : primers)
            System.out.print(valor + " ");
        System.out.println("");
    }
    static boolean esNombrePrimer (int nombre){
        int valor = sc.nextInt();
        boolean primer = true;
        for (int i = 2; i <= Math.sqrt(valor) && primer; ++i){
            if (valor % i == 0){
                primer = false;
            }
        }
        return primer;
    }
    /*public static boolean retornaPrimers(int primers){
        //Scanner sc = new Scanner(System.in);
        //int numero = sc.nextInt();
        int m = 2;
        boolean primer;
        int aumentar = 1;

        while (aumentar < numero) 
        {
            primer = true;
            for (int i = 2; i < m && primer; i++) 
            {
                if (m % i == 0) 
                {
                    primer = false;
                }
            }
            
            if (primer == true) 
            {
                System.out.print(m + " ");
                aumentar++;
            }
            m++;
        }
        return m;
    }*/
}

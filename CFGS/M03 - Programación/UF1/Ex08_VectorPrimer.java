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
public class Ex08_VectorPrimer {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        /*int n = sc.nextInt();
        int vector[] = new int [n];
        //vector[0] = 2;
        int m = 2;
        boolean primer;
        int aumentar = 0;

        while (aumentar < n) 
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
                vector[aumentar] = m;
                aumentar++;
            }       
            m++;
        }
        for (int i = 0; i < vector.length; i++){
            System.out.print(vector[i]);
            if (i < n - 1){
                System.out.print(", ");
            }
            if ((i + 1) % 10 == 0) {
                System.out.println();
            }
            else{
                System.out.println(".");
            }
        }*/
        int n = sc.nextInt();
        int[] primers = new int [n];
        int totalPrimers = 0;
        int i = 2;
        
        while (totalPrimers < n){
            boolean esPrimer = true;
            for (int j = 2; j <= Math.sqrt(i) && esPrimer; j++) 
            {
                if (i % j == 0) 
                {
                    esPrimer = false;
                }
            }            
            if (esPrimer){
                primers[totalPrimers] = i;
                totalPrimers++;
            }
            i++;
        }
        for (int j = 0; j < n; j++){
            if (j == n - 1){
                System.out.print(primers[j] + ".");
            }
            else {
                System.out.print(primers[j] + ", ");
                    if ((j+1) % 10 == 0){
                    System.out.println();
                }
            }
        }   
        System.out.println("");
    }
}

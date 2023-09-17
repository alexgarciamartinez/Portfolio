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
public class Ex13_XifratRotatori {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introdueix la clau de xifrat [1-9]");
        int N = sc.nextInt();
        sc.nextLine();
        
        System.out.println("Introdueixi una frase: ");
        String frase = sc.nextLine();
        
        String[] paraules = frase.split(" ");
        
        System.out.println("");
        
        int desplacament = 0;
        do{
            int posFinal = Math.min(N, paraules.length - desplacament);
            String paraulaInicial = paraules[desplacament];
            for (int i = 0; i < posFinal - 1; i++){
                paraules[i + desplacament] = paraules[i+1+desplacament];
            }
            paraules[posFinal-1+desplacament] = paraulaInicial;
            desplacament += N;
        }
        while (desplacament < paraules.length);
        // Segon pas
        for (int i = 0; i < paraules.length; ++i) {
            char[] caracters = paraules[i].toCharArray();
            
            desplacament = 0;
            do 
            {
                int posFinal = Math.min(N, caracters.length - desplacament);
                char lletraInicial = caracters[desplacament];
                for (int j = 0; j < posFinal - 1; j++)
                {
                    caracters[j+desplacament] = caracters[j+1+desplacament];
                }
                caracters[posFinal-1+desplacament] = lletraInicial;

                desplacament += N;

            } while(desplacament < caracters.length);
            paraules[i] = new String(caracters);
        }
        //Mostra frase xifrada
        for (String paraula : paraules){
            System.out.print(paraula + " ");
        }
        System.out.println("");
        
    
    }
}

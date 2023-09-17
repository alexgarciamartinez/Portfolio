package cat.copernic.m03.uf1a5;


import java.util.Scanner;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alexg
 */
public class FraseDesordenada {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Introdueix una frase: ");
        String frase = sc.nextLine();
        String[] fraseString = frase.split(" ");
        String[] fraseArrayDesordenada = fraseString;
        String desordenada = "";
        /*for (int i = 0; i < fraseString.length; i++){
            System.out.println(fraseString[i]);
        }*/
        /*int x = (int)(Math.random()*fraseString.length);
        System.out.println(fraseString[x]);*/
        for (int i = 0; i < fraseArrayDesordenada.length; i++){
            int y = (int)(Math.random()*(fraseArrayDesordenada.length));
            desordenada += fraseArrayDesordenada[y] + " ";
        }
        System.out.println("Frase desordenada: " + desordenada);
        System.out.println("Frase ordenada: " + frase);
        
    }
}

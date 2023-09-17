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
public class ReplaceAll {
    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
        System.out.println("Cadena: ");
        String cadena = sc.nextLine();
        String[] cadenaArray = cadena.split(" ");
        System.out.println("Caracters a substituir: ");
        String sustituto = sc.nextLine();
        System.out.println("Caracter nou: ");
        String nou = sc.nextLine();
        String vacio = "";
        System.out.println(cadenaArray[0]);
        for (int i = 0; i < cadenaArray.length; i++){
            if (cadenaArray[i].equals(sustituto)){
                cadenaArray[i] = nou + " ";
            }
            else {
                cadenaArray[i] = cadenaArray[i] + " ";
            }
        }
        for (int i = 0; i < cadenaArray.length; i++){
            System.out.print(cadenaArray[i]);
        }
        
    }
}

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
public class Ex16_SerpICamell {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        String frase = sc.nextLine();
        frase = frase.toLowerCase();
        String fraseCamel = "";
        
        //CamelCase
        for (int i = 0; i < frase.length(); i++){
            if (frase.charAt(i) == '_'){
                fraseCamel += Character.toUpperCase(frase.charAt(i + 1));
                i++;
            }
            else {
                fraseCamel += frase.charAt(i);
            }
        }
        
        //Kebab
        String fraseKebab = "";
        for (int i = 0; i < frase.length(); i++){
            if (frase.charAt(i) == '_'){
                fraseKebab += '-';
            }
            else{
                fraseKebab += frase.charAt(i);
            }
            fraseKebab = fraseKebab.toLowerCase();
        }
        System.out.println(fraseCamel);
        System.out.println(fraseKebab);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03a1;

import java.io.File;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex03_AtributsFitxer {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introdueixi el nom del fitxer: ");
        String nomFitxer = sc.nextLine();
        
        File fitxer = new File(nomFitxer);
        System.out.println("Nom: " + fitxer.getName());
        System.out.println("Ruta: " + fitxer.getPath());
        
        if (fitxer.exists()){
            System.out.println("El fitxer existeix");
        } else {
            System.out.println("El fitxer no existeix");
        }
        
        if (fitxer.canRead()){
            System.out.println("Es pot llegir");
        } else {
            System.out.println("No es pot llegir");
        }
        
        if (fitxer.canWrite()){
            System.out.println("El fitxer es pot modificar");
        } else {
            System.out.println("El fitxer no es pot modificar");
        }
        
        System.out.println("La longitud és: " + fitxer.length());
    }
}

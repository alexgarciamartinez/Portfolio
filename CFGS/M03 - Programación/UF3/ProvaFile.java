/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package m03uf3;

import java.io.File;

/**
 *
 * @author alexg
 */
public class ProvaFile {
    public static void main(String[] args) {
        
        File carpeta = new File("micarpeta/subcarpeta");
        if (carpeta.isDirectory()){
            File[] fitxers = carpeta.listFiles();
            System.out.println("");
            for (File f : fitxers){
                System.out.println(f.getName() + ": " + f.length() + " bytes");
            }    
        }
        else {
            System.out.println("No es una carpeta");
        }
        
        File[] roots = File.listRoots();
        System.out.println("");
    }
    
}

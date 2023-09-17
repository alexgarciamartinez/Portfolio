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
public class Ex08_LlistatRecursiu {
    
    public static void main(String[] args) {
        String path = demanarDirectori();

        File directori = new File(path);
        if (directori.exists() && directori.isDirectory()) {
            mostrarArbre(directori, "");
        } else {
            System.out.println("El directori no existeix o no és vàlid.");
        }
    }

    private static String demanarDirectori() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Introdueix el nom del directori: ");
        return scanner.nextLine();
    }

    private static void mostrarArbre(File arxiu, String prefix) {
        System.out.println(prefix + arxiu.getName());

        if (arxiu.isDirectory()) {
            File[] arxius = arxiu.listFiles();
            if (arxius != null) {
                for (File file : arxius) {
                    mostrarArbre(file, prefix + "    ");
                }
            }
        }
    }
}

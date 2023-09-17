/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.copernic.m03.uf1a5;

import java.io.IOException;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Esquirol_Bombarder {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        final int FILES = 11;
        final int COLUMNES = 22;
        final int BOMBES = 3;
        char[][]tauler = new char[FILES-2][COLUMNES-2];
        
        //===== Tablero =====
        for (int i = 0; i < tauler.length; i++){
            for (int j = 0; j < tauler[0].length; j++){
                tauler[i][j] = ' ';
            }
        }
        
        //===== Posició inicial esquirol =====
        int posXEsquirol = 0;
        int posYEsquirol = 0;
        tauler[posXEsquirol][posYEsquirol] = 'E';
        
        //Posició inicial Lupin
        int posXLupin = tauler.length - 1;
        int posYLupin = tauler[0].length-1;
        tauler[posXLupin][posYLupin] = 'L';
        
        //===== Posició bombes =====
        int[][] posicioBombes = new int[BOMBES][2];
        for (int i = 0; i < BOMBES; i++) {
            boolean posBombaCorrecte = false;
            while (!posBombaCorrecte) {
                int x = (int)(Math.random()*(tauler.length-1));
                int y = (int)(Math.random()*(tauler[0].length-1));                
                if (x > 0 && y > 0 && tauler[x][y] != '*') {
                    tauler[x][y] = '*';
                    posicioBombes[i][0] = x;
                    posicioBombes[i][1] = y;
                    posBombaCorrecte = true;
                }
            }
        }
        int[] estatBombes = new int[BOMBES];
        for (int i = 0; i < BOMBES; i++){
            estatBombes[i] = -1;
        }
        int contaBombes = 0;
        int indexBombaTriada = (int)(Math.random()*BOMBES);        
        boolean finalPrograma = false;
        do {
            //===== Mostrar el tauler =====
            for(int i = 0; i < COLUMNES; i++)
                    System.out.print("X");
                System.out.println("");

                for(int i = 0; i < FILES - 2; i++){
                    System.out.print("X");
                    for(int j = 0; j < COLUMNES - 2;j++)
                        System.out.print(tauler[i][j]);
                    System.out.println("X");
                }

                for(int i = 0; i < COLUMNES; i++){
                    System.out.print("X");
                } 
                System.out.println("");

            //Moviment de l'esquirol
            System.out.println("Cap a on vols moure? [w, a, s, d] ");
            char moviment = sc.nextLine().charAt(0);
            switch(moviment){
                case 'w': //Up
                    if (posXEsquirol > 0 && 
                        tauler[posXEsquirol - 1][posYEsquirol] != 'L'){
                        tauler[posXEsquirol][posYEsquirol] = ' ';
                        posXEsquirol--;
                    }
                    break;
                case 'a': //Left
                    if (posYEsquirol > 0 && 
                        tauler[posXEsquirol][posYEsquirol-1] != 'L'){
                        tauler[posXEsquirol][posYEsquirol] = ' ';
                        posYEsquirol--;
                    }
                    break;
                case 's': //Down
                    if (posXEsquirol < tauler.length-1 && 
                        tauler[posXEsquirol + 1][posYEsquirol] != 'L'){
                        tauler[posXEsquirol][posYEsquirol] = ' ';
                        posXEsquirol++;
                    }
                    break;
                case 'd': //Right
                    if (posYEsquirol < tauler[0].length-1 && 
                        tauler[posXEsquirol][posYEsquirol+1] != 'L'){
                        tauler[posXEsquirol][posYEsquirol] = ' ';
                        posYEsquirol++;
                    }
                    break;
                case 'e': //Esquirol fa explotar una bomba
                    break;
                case 't': //Fer trampes
                    break;
                case 'q': //Sortir
                    finalPrograma = true;
                    break;
            }
            //===== Comprova si hi ha bomba en aquesta posició =====
            if (tauler[posXEsquirol][posYEsquirol] == '*'){
                System.out.println("¡Has agafat una bomba!");
                contaBombes++;
            }
            
           
            tauler[posXEsquirol][posYEsquirol] = 'E';
            
            // Moviment Lupin
            tauler[posXLupin][posYLupin] = ' ';
            if (Math.abs(posXLupin-posicioBombes[indexBombaTriada][0]) >
                Math.abs(posYLupin-posicioBombes[indexBombaTriada][1])) {
                // Diferència en files més gran
                if (posXLupin > posicioBombes[indexBombaTriada][0])
                    posXLupin--;
                else
                    posXLupin++;                
            } else {
                // Diferència en columnes més gran
                if (posYLupin > posicioBombes[indexBombaTriada][1])
                    posYLupin--;
                else
                    posYLupin++;                
            }
            if (tauler[posXLupin][posYLupin] == '*') {
                // Activem bomba
                int i;
                for (i = 0; i < BOMBES; i++) {
                    if (posicioBombes[i][0] == posXLupin && 
                        posicioBombes[i][1] == posYLupin) {
                        break;
                    }
                }
                estatBombes[i] = (int)(Math.random()*5) + 5;
                tauler[posXLupin][posYLupin] = (char)('0' + estatBombes[i]);
                posYLupin--;                
            } 
            tauler[posXLupin][posYLupin] = 'L';
            
            
            
            //Esborrar pantalla
            try{
                if (System.getProperty("os.name").contains("Windows")){
                    new ProcessBuilder("cmd", "/c", "cls").
                            inheritIO().start().waitFor();
                } else{
                    System.out.print("\033[H\033[2J");
                    System.out.flush();
                }
            }catch(IOException | InterruptedException ex){}
        }
        while (!finalPrograma);
    }
}


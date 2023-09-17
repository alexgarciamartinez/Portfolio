package m03uf2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Scanner;
import m03uf2.Ex06_Matrius.*;
/**
 *
 * @author alexg
 */
public class Ex07_ComptadorMines {
    public static void main(String[] args) {
        // int[][] valors = {{0,0,-1,0},{0,-1,-1,0}};
        //int[][] camp = demanarCampMines();
        int[][] camp = generarCampMines(true);
        Ex06_Matrius.mostraMatriu(camp);
        System.out.println("");
        int[][] resultat = comptaMines(camp);
        Ex06_Matrius.mostraMatriu(resultat);
    }
    /*public static int[][] demanarCampMines(){
        Scanner sc = new Scanner(System.in);
        int files = sc.nextInt();
        int columnes = sc.nextInt();
        int[][] campMines = new int [files][columnes];
        for (int i = 0; i < files; i++){
            for (int j = 0; j < columnes; j++){
                campMines[i][j] = sc.nextInt();
            }
        }
        return campMines;
    }*/
    public static int[][] generarCampMines(boolean automatic){
        Scanner sc = new Scanner(System.in);
        int files = sc.nextInt();
        int columnes = sc.nextInt();
        int[][] campMines = new int [files][columnes];
        for (int i = 0; i < files; i++){
            for (int j = 0; j < columnes; j++){
                if (automatic){
                    if (Math.random() < 0.25){
                        campMines[i][j] = -1;    
                    }
                    else{
                        campMines[i][j] = 0;
                    }
                }
                else{
                    campMines[i][j] = sc.nextInt();
                }
            }
        }
        return campMines;  
    }
    public static int[][] comptaMines (int[][] camp){
        int[][] taulerResultat = new int[camp.length][camp[0].length];
        for (int i = 0; i < camp.length; i++){
            for (int j = 0; j < camp[0].length; j++){
                if (camp[i][j] == -1){
                    taulerResultat[i][j] = -1;
                }
                else{
                    int contador = 0;
                    for (int inci = -1; inci <= 1; inci++){
                        for (int incj = -1; incj <= 1; incj++){
                            if ((i+inci) >= 0 && (i+inci) < camp.length && 
                                (j+incj) >= 0 && (j+incj) < camp[0].length && 
                                camp[i+inci][j+incj] == -1){
                                contador++;
                            }
                        }
                    }
                    taulerResultat[i][j] = contador;
                    /*if ((i-1) >= 0 && camp[i-1][j] == -1){
                        contador++;
                    }
                    if ((i-1) >= 0 && (j-1) >= 0 && camp[i-1][j-1] == -1){
                        contador++;
                    }*/
                }
            }
        }
        return taulerResultat;
    }    
}

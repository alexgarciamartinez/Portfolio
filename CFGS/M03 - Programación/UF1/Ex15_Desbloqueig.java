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
public class Ex15_Desbloqueig {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int files = sc.nextInt();
        int columnes = sc.nextInt();
        
        char[][] patroDesbloqueig = new char [files*2-1][columnes*2-1];
        for (int i = 0; i < files*2-1; i++){
            for (int j = 0; j < columnes*2-1; j++){
                if (i % 2 == 0 && j % 2 == 0){
                    patroDesbloqueig[i][j] = '.';
                }
                else {
                    patroDesbloqueig[i][j] = ' ';
                }
            }
        }
        
        int x0 = sc.nextInt();
        int y0 = sc.nextInt();
        sc.nextLine();
        String cadenaDesbloqueig = sc.nextLine();
        System.out.println("Cadena de desbloqueig: " + cadenaDesbloqueig);
        
        //Comencem el camí
        int x = 2*x0-2;
        int y = 2*y0-2;
        
        for (int i = 0; i < cadenaDesbloqueig.length(); i++){
            switch (cadenaDesbloqueig.charAt(i)){
                case '1':
                case '2':
                    patroDesbloqueig[x-1][y] = '|';
                    x -= 2;
                    break;
                case '3':
                    if(patroDesbloqueig[x][y] == '\\'){
                        patroDesbloqueig[x-1][y+1] = 'X';
                    }
                    else
                        patroDesbloqueig[x-1][y+1] = '/';
                    x -=2;
                    y +=2;
                    break;
                case '4':
                    patroDesbloqueig[x][y-1] = '-';
            }
        }
        patroDesbloqueig[x][y] = 'O';
        //Patro desbloqueig
        for (int i = 0; i < patroDesbloqueig.length; i++){
            for (int j = 0; j < patroDesbloqueig[0].length; j++){
                System.out.print(patroDesbloqueig[i][j]);
            }
            System.out.println("");
        }
    }
}

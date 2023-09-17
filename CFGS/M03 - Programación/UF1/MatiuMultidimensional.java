/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.copernic.m03.uf1a5;

/**
 *
 * @author alexg
 */
public class MatiuMultidimensional {
    public static void main(String[] args) {
        int [][] caselles = new int[4][5];
        int [][] m = {{1,7,9,4,8},{5,10,14,-3,1,0}};
        float [] temperatures = {3.6f,4.5f,12.6f,22.4f,27.8f};
       
        //temperaturas
        for (int i = 0; i < temperatures.length;i++){
            System.out.println(temperatures[i]);
        }
       
        //Matriu m
        for(int fila = 0; fila < m.length; fila++){
            for(int col = 0; col < m[0].length;col++){
                System.out.println("Element[" + fila + "][" + col + "]" + m[fila][col]);
            }
        }
    }
}

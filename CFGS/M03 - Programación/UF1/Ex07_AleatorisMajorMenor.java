/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.copernic.m03.uf1a5;

/**
 *
 * @author alexg
 */
public class Ex07_AleatorisMajorMenor {
    public static void main(String[] args) {
        
        int []vector = new int [20];
        int random = (int)(Math.random() * 20) + 1;
        for (int i = 0; i < vector.length; i++){
            vector[i] = (int)(Math.random() * 20) + 1;
        }
        for (int i = 0; i < vector.length; i++){
            System.out.print(vector[i] + " ");
        }
        int min = vector[0];
        int max = vector[0];
        int minVegada = 0;
        int maxVegada = 0;
        for (int i = 0; i < vector.length; i++){
            if (vector[i] < min){
                min = vector[i];
            }
            else if (vector[i] > max){
                max = vector[i];
            }
        }
        for (int i = 0; i < vector.length; i++){
            if (vector[i] == min){
                minVegada++;
            }
            else if (vector[i] == max){
                maxVegada++;
            }
        }
        System.out.println();
        System.out.println("El menor dels valors és " + min + " i surt " + minVegada + " vegades.");
        System.out.println("El major dels valors és " + max + " i surt " + maxVegada + " vegades.");
    }
}

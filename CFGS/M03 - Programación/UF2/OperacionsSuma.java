/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf2;

/**
 *
 * @author alexg
 */
public class OperacionsSuma {
    public static void main(String[] args) {
        int a = 5;
        int b = 7;
        int c = suma(a, b);
        System.out.printf("La suma de %d i %d és %d\n",a,b,c);
        double a2 = 3.5;
        double b2= 2.1;
        double c2 = multiplicacio(a2,b2);
        System.out.printf("La multiplicacio de %.1f i %.1f és %.1f\n",a2,b2,c2);
        
        a = 3; 
        b = 8;
        c = 2;
        
        int max = maxim(a,b,c);
        System.out.printf("El màxim de %d, %,d i %d és %d\n",a,b,c,max);
        
    }
    public static int suma(int x, int y){
        int z = x + y;
        return z;
    }
    public static double multiplicacio(double x2, double y2){
        return x2 * y2;
    }
    public static int maxim(int am, int bm, int cm){
        int max = 0;
        if (am > bm && am > cm){
            max = am;
        }
        else if (bm > am && bm > cm){
            max = bm;
        }
        else if (cm > am && cm > bm){
            max = cm;
        }
        return max;
    }
}

package m03uf2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class Ex02_Figures2D {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("** Selecciona figura2D **");
        // 1. Quadrat (costat) P = c * 4 ||| S = c ^ 2
        // 2. Rectangle (costat llarg, costat curt) P = (c1+c2)*2 ||| S = c1*c2
        // 3. Triangle is. (base, alçada) P = ||| S = (b*a)/2
        // 4. Cercle (radi) P = 2*pi*r ||| S = pi*r^2
        System.out.println("1.- Quadrat");
        System.out.println("2.- Rectangle");
        System.out.println("3.- Triangle");
        System.out.println("4.- Cercle");
        int opcio = sc.nextInt();
        
        double perimetre = 0.0;
        double superficie = 0.0;
        switch (opcio) {
            case 1:
                System.out.println("Costat: ");
                double costat = sc.nextDouble();
                // perimetre = calculaPerimetreQuadrat(costat);
                // superficie = calculaSuperficieQuadrat(costat);
                double[] resultat = calculaQuadrat(costat);
                perimetre = resultat[0];
                superficie = resultat[1];
                break;
            case 2:
                System.out.println("Costat llarg: ");
                double costatLlarg = sc.nextDouble();
                System.out.println("Costat curt: ");
                double costatCurt = sc.nextDouble();
                break;
            case 3:
                System.out.println("Base: ");
                double base = sc.nextDouble();
                System.out.println("Alçada: ");
                double alcada = sc.nextDouble();
                
                perimetre = calculaPerimetreTriangle(base, alcada);
                superficie = calculaSuperficieTriangle(base, alcada);
                break;
            case 4:
                System.out.println("Radi: ");
                double radi = sc.nextDouble();
                
                perimetre = calculaPerimetreCercle(radi);
                superficie = calculaPerimetreCercle(radi);
                break;
                                                
        }
        
        System.out.printf("Perimetre: %.2f\n", perimetre);
        System.out.printf("Superficie: %.2f\n", superficie);
    }
    
    public static double calculaPerimetreQuadrat(double costat) {
        double resultat = costat * 4; 
        return resultat; 
    }
    public static double calculaSuperficieQuadrat(double costat) {
        double resultat = costat*costat;
        return resultat; 
    }
    public static double[] calculaQuadrat (double costat){
        double perimetre = costat * 4;
        double superficie = costat*costat;
        double[] resultat = new double[2];
        resultat [0] = perimetre;
        resultat [1] = superficie;
        
        return resultat;
    }
    public static double calculaPerimetreRectangle(double c1, double c2) {
        return (c1 + c2) * 2;
    }
    public static double calculaSuperficieRectangle(double c1, double c2) {
        return c1*c2;
        //return
    }
    public static double calculaPerimetreTriangle(double base, double alcada) {
        return 2*Math.sqrt(base*base/4+alcada * alcada) + base;
    }
    public static double calculaSuperficieTriangle(double base, double alcada) {
        return base*alcada/2;
    }
    public static double calculaPerimetreCercle(double radi) {
        return 2*Math.PI*radi;
    }
    public static double calculaSuperficieCercle(double radi) {
        return Math.PI*radi*2;
    }
    
}

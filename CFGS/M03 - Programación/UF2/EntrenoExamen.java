/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf2;

import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class EntrenoExamen {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // String codi = "RGBK";
        int intents = 0;
        final int MAXINTENTS = 10;
        int pinsNegres = 0; 
        int pinsBlancs = 0;
        String codiGenerat = generaCodiColors();
        codiGenerat.toUpperCase();
        System.out.println("Benvingut a Master of Colours!");
        String codiUsuari = "";
        
        do{
            System.out.print("Introdueix la seqüencia de colors: ");
            codiUsuari = sc.nextLine().toUpperCase();
            comptaPinsNegres(codiUsuari, codiGenerat);
            System.out.println("Pins negres: " + comptaPinsNegres(codiUsuari, codiGenerat));
            comptaPinsBlancs(codiUsuari, codiGenerat);
            System.out.println("Pins blancs: " + comptaPinsBlancs(codiUsuari, codiGenerat));
            intents++;
        } while(intents < MAXINTENTS && comptaPinsNegres(codiUsuari, codiGenerat) < 4);
        
        if (intents == MAXINTENTS && comptaPinsNegres(codiUsuari, codiGenerat) != 4){
            System.out.println("Ho sento! Has esgotat el nombre màxim d'intents");
            System.out.println("El codi a endevinar era " + codiGenerat);
        }
        else if (comptaPinsNegres(codiUsuari, codiGenerat) == 4){
            System.out.println("Enhorabona! Has endevinat el codi en " + intents + " intents");
        }
    }
    
    static String generaCodiColors(){
        String[] paraules = new String[4];
        String codiGenerat = "";
        paraules[0] = "R";
        paraules[1] = "G";
        paraules[2] = "B";
        paraules[3] = "K";
        
        for (int i = 0; i < paraules.length; i++){
            int numeroRandom = (int)(Math.random()*4);
            codiGenerat += paraules[numeroRandom];
        }
        
        return codiGenerat;
    }
    
    static int comptaPinsNegres(String codiUsuari, String codiGenerat){
        int pinsNegres = 0;
        char[] arrayCodi = new char[4];
            arrayCodi[0] = codiGenerat.charAt(0);
            arrayCodi[1] = codiGenerat.charAt(1);
            arrayCodi[2] = codiGenerat.charAt(2);
            arrayCodi[3] = codiGenerat.charAt(3);

        for (int i = 0; i < arrayCodi.length; i++){
                if (arrayCodi[i] == codiUsuari.charAt(i)){
                    pinsNegres++;
                }
            }
        return pinsNegres;
    }
    
    static int comptaPinsBlancs(String codiUsuari, String codiGenerat){
        int pinsBlancs = 0;
        char[] arrayCodi = new char[4];
            arrayCodi[0] = codiGenerat.charAt(0);
            arrayCodi[1] = codiGenerat.charAt(1);
            arrayCodi[2] = codiGenerat.charAt(2);
            arrayCodi[3] = codiGenerat.charAt(3);
        
        for (int i = 0; i < arrayCodi.length; i++){
            for (int j = i + 1; j < arrayCodi.length; j++){
                if (arrayCodi[i] == codiGenerat.charAt(j)){
                    pinsBlancs++;
                }
            }
        }
        return pinsBlancs;
    }
}

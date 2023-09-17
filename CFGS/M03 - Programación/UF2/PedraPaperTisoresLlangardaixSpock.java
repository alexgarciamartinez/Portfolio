package m03uf2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author alexg
 */
public class PedraPaperTisoresLlangardaixSpock {
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        
        int[][] resultatJugada = {{0,-1,1,1,-1},
                                  {1,0,-1,-1,1},
                                  {-1,1,0,1,-1},
                                  {-1,1,-1,0,1},
                                  {1,-1,1,-1,0}};
        
        String[] jugades = {"pedra", "paper", "tisores", "llangardaix", "spock"};
        boolean finalPartida = false;
        do {
            // Mostrar la ronda i el marcador
            int ronda = 1;
            int marcadorHuma = 0;
            int marcadorOrdinador = 0;
            boolean finalRondes = false;
            while ((marcadorHuma < 3 && marcadorOrdinador < 3) && !finalRondes){
                System.out.println("Ronda: " + ronda + " [Jugador " + marcadorHuma + " - " + marcadorOrdinador + " Ordinador]");

                // ===== Demanar jugada a l'humà =====
                System.out.println("pedra(0), paper(1), tisores(2), llangardaix(3), spock(4)");
                int jugadaHuma = jugadaHuma();
                int jugadaOrdinador = jugadaOrdinador();

                System.out.print("El jugador ha tret " + jugades[jugadaHuma] + ". ");
                System.out.print("L'ordinador ha tret " + jugades[jugadaOrdinador] + ". ");

                // ===== Comprovar qui guanya =====
                if (resultatJugada[jugadaHuma][jugadaOrdinador] == 1){
                    marcadorHuma++;
                    System.out.print("Guanya el jugador!!\n ");
                }
                else if (resultatJugada[jugadaHuma][jugadaOrdinador] == -1){
                    marcadorOrdinador++;
                    System.out.print("Guanya l'ordinador!!\n ");
                }
                else {
                    System.out.print("Empat. ");
                }
                System.out.println("");

                // ===== Comprovació de si algú ha arribat a guanyar 3 rondes =====
                if (marcadorHuma == 3 || marcadorOrdinador == 3){
                    System.out.println("La partida ha acabat en " + ronda + " rondes");
                    System.out.println("[Jugador " + marcadorHuma + " - " + marcadorOrdinador + " Ordinador]");
                    System.out.println("Vols fer una nova partida? [S/N]");
                    finalRondes = true;
                    char seleccio = sc.nextLine().toLowerCase().charAt(0);
                    if (seleccio == 'n'){
                        finalPartida = true;
                    }
                }
                ronda++;
            } 
        }while(!finalPartida);
    }
    public static int jugadaHuma(){
        Scanner sc = new Scanner(System.in);
        boolean entradaCorrecte = false;
        int jugada = 0;
        do{
            if (sc.hasNextInt()){
                jugada = sc.nextInt();
                if (jugada >= 0 && jugada <= 4){
                    entradaCorrecte = true;
                }
                else {
                    System.out.println("El numero ha de ser entre 0 i 4!");
                }
            }
            else {
                System.out.println("Només pots introduir nombres enters!");
                sc.nextLine();
            }
        } while (!entradaCorrecte);
        return jugada;
    }
    public static int jugadaOrdinador(){
        Random rnd = new Random();
        // int jugadaMaquina = (int)(Math.random()*5;)
        int jugadaMaquina = rnd.nextInt(0,5);
        return jugadaMaquina;
    }
}

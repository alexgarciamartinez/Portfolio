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
public class Ex04_Menu {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        boolean sortir = false;
        do {
            System.out.println("* * * * * * MENU * * * * * *");
            System.out.println("A - [Ex. 23] Taula divisió entera");
            System.out.println("B - [Ex. 26] Fibonacci");
            System.out.println("C - [Ex. 01] Compta vocals");
            System.out.println("X - SORTIR");
            System.out.println("Tria una opció");           
            
            String entrada = sc.nextLine();
            char opcio = ' ';
            if (entrada.length() == 1) {
            opcio = entrada.toUpperCase().charAt(0);    
                switch (opcio) {
                    case 'A':
                        int valor = sc.nextInt();
                        sc.nextLine();
                        int[] resultat = taulaDivisioEntera(valor);
                        break;
                    case 'B':
                        int valorFibonacci = sc.nextInt();
                        sc.nextLine();
                        int resultatFibonacci = fibonacci(valorFibonacci);
                        break;
                    case 'C':
                        String stringVocal = sc.nextLine();
                        int numeroVocals = comptaVocals(stringVocal);
                        break;
                    case 'X':
                        sortir = true;
                        break;
                    default:
                        System.out.println("Opció incorrecte");
                        break;
                }
            }
            else {
                System.out.println("Opció incorrecte");
            }
        } while (!sortir);
    }
    
    public static int[] taulaDivisioEntera (int valor) {
        int n = valor;
        int i = 0;
        int[] resultat = new int[2];
        try {
            for (i = 1; i <= 10; i++)
            {
                if (n > 0){
                System.out.println(n + " / " + i + ": quocient = " + n/i + " i residu = " + n%i);
                resultat[0] = n;
                resultat[1] = i;
                }
            }        
        }
        catch (java.util.InputMismatchException error){
            System.out.println("error");
        }
        return resultat;

    }
    public static int fibonacci (int valorFibonacci) {
        int n = valorFibonacci;
        int fibonacci = 0;
        int a = 1;
        int b = 0;
        for (int i = 1; i <= n; i++) {
            fibonacci = a + b;
            System.out.print(fibonacci + " ");
            System.out.println(" ");
            a = b;
            b = fibonacci;
        }
        return fibonacci;
    }
    public static int comptaVocals (String stringVocal) {
        System.out.println("Introdueix una frase: ");
        String frase = stringVocal;
        System.out.println(frase);
        
        int vocal = 0;
        for (int i = 0; i < frase.length(); i++) {
            switch (frase.toLowerCase().charAt(i)) {
                case 'a':
                vocal++;
                break;
                case 'e':
                vocal++;
                break;
                case 'i':
                vocal++;
                break;
                case 'o':
                vocal++;
                break;
                case 'u':
                vocal++;  
                break;
                case 'à':
                vocal++;
                break;
                case 'á':
                vocal++;
                break;
                case 'è':
                vocal++;
                break;
                case 'é':
                vocal++;
                break;
                case 'í':
                vocal++;
                break;
                case 'ò':
                vocal++;
                break;
                case 'ó':
                vocal++;
                break;
                case 'ú':
                vocal++;
                break;
                case 'ï':
                vocal++;
                break;
                case 'ü':
                vocal++;      
                break;
            }
        }
        System.out.println("La frase conté " + vocal + " vocals.");
        return vocal;
    }
}

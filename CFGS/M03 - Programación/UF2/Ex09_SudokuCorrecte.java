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
public class Ex09_SudokuCorrecte {
    public static Scanner sc = new Scanner(System.in);
    static final int TOTAL = 9;
    public static void main(String[] args) {
        
        int totalSudokus = sc.nextInt();
        for (int num = 0; num < totalSudokus; num++){
            System.out.println("Introdueix el sudoku");
            int[][] sudoku = llegirSudoku();
            //mostrarSudoku(sudoku);

            boolean valid = true;
            for (int i = 0; i < TOTAL; ++i) {
                if (!esFilaValida(sudoku,i) || !esColumnaValida(sudoku,i)) {
                    valid = false;
                    break;                
                }
            }

            //boolean resultat = esRegioValida(sudoku,0,0);
            for (int i = 0; i <= 6 && valid; i+=3){
                for (int j = 0; j <= 6; j+=3){
                    if (!esRegioValida(sudoku,i,j)){
                        valid = false;
                        break;
                    }
                }
            }
            if (valid){
                System.out.println("SI");
            }
            else{
                System.out.println("NO");
            }
        }
    }
    static int[][] llegirSudoku(){
        
        int[][] resultat = new int[TOTAL][TOTAL];
        for (int fila = 0; fila < TOTAL; fila++){
            for (int columna = 0; columna < TOTAL; columna++){
                resultat[fila][columna] = sc.nextInt();
            }
        }
        return resultat;
    }
    static void mostrarSudoku(int[][] sudoku){
        System.out.println("Valors del sudoku");
        for (int[] fila : sudoku){
            for (int valor : fila){
                System.out.print(valor + " ");
            }
            System.out.println("");
        }
    }
    static boolean esFilaValida(int[][] sudoku, int fila){
        boolean resultat = true;
        for (int valor = 1; valor <= TOTAL; valor++){
            int contador = 0;
            for (int col = 0; col < TOTAL; col++){
                if (sudoku[fila][col] == valor){
                    contador++;
                }
            }
            if (contador > 1){
                resultat = false;
                break;
            }
        }
        return resultat;
    }
    static boolean esColumnaValida(int[][] sudoku, int columna){
        boolean resultat = true;
        for (int valor = 1; valor <= TOTAL; valor++){
            int contador = 0;
            for (int fila = 0; fila < TOTAL; fila++){
                if (sudoku[fila][columna] == valor){
                    contador++;
                }
            }
            if (contador > 1){
                resultat = false;
                break;
            }
        }
        return resultat;
    }
    static boolean esRegioValida(int[][] sudoku, int filaInicial, int columnaInicial){
        
        boolean resultat = true;
        
        for (int valor = 1; valor <= TOTAL; valor++){
            int contador = 0;
            for (int i = 0; i < 3; i++){
                for (int j = 0; j < 3; j++){
                    if (sudoku[filaInicial+i][columnaInicial+j] == valor){
                        contador++;
                    }
                }
            }
            if (contador > 1){
                resultat = false;
                break;
            }
        }
        return resultat;
    }
}

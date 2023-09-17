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
public class Ex15_Desbloqueig2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int rows, cols, x, y;
        char[][] matrix;

        System.out.print("Enter number of rows: ");
        rows = scanner.nextInt();
        System.out.print("Enter number of columns: ");
        cols = scanner.nextInt();
        matrix = new char[rows][cols];

        System.out.print("Enter starting point x: ");
        x = scanner.nextInt() - 1;
        System.out.print("Enter starting point y: ");
        y = scanner.nextInt() - 1;

        // Initialize matrix with dots
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                matrix[i][j] = '.';
            }
        }

        int input;
        do {
            System.out.print("Enter next digit: ");
            input = scanner.nextInt();

            // Update matrix according to input
            switch (input) {
                case 1:
                    x--;
                    y--;
                    matrix[x][y] = 'O';
                    if (matrix[x + 1][y] == 'O') {
                        matrix[x + 1][y] = '|';
                    } else {
                        matrix[x + 1][y] = '/';
                    }
                    if (matrix[x][y + 1] == 'O') {
                        matrix[x][y + 1] = '-';
                    } else {
                        matrix[x][y + 1] = '\\';
                    }
                    break;
                case 2:
                    x--;
                    matrix[x][y] = 'O';
                    if (matrix[x + 1][y] == 'O') {
                        matrix[x + 1][y] = '|';
                    } else {
                        matrix[x + 1][y] = 'X';
                    }
                    break;
                case 3:
                    x--;
                    y++;
                    matrix[x][y] = 'O';
                    if (matrix[x + 1][y] == 'O') {
                        matrix[x + 1][y] = '|';
                    } else {
                        matrix[x + 1][y] = '\\';
                    }
                    if (matrix[x][y - 1] == 'O') {
                        matrix[x][y - 1] = '-';
                    } else {
                        matrix[x][y - 1] = '/';
                    }
                    break;
                case 4:
                    y--;
                    matrix[x][y] = 'O';
                    if (matrix[x][y + 1] == 'O') {
                        matrix[x][y + 1] = '-';
                    } else {
                        matrix[x][y + 1] = 'X';
                    }
                    break;
                case 6:
                    y++;
                    matrix[x][y] = 'O';
                    if (matrix[x][y - 1] == 'O') {
                        matrix[x][y -1] = '-';
                    } 
                    else {
                        matrix[x][y - 1] = 'X';
                    }
                    break;
                case 7:
                    x++;
                    y--;
                    matrix[x][y] = 'O';
                    if (matrix[x - 1][y] == 'O') {
                    matrix[x - 1][y] = '|';
                    } else {
                    matrix[x - 1][y] = '/';
                    }
                    if (matrix[x][y + 1] == 'O') {
                    matrix[x][y + 1] = '-';
                    } else {
                    matrix[x][y + 1] = '\\';
                    }
                    break;
                case 8:
                    x++;
                    matrix[x][y] = 'O';
                    if (matrix[x - 1][y] == 'O') {
                    matrix[x - 1][y] = '|';
                    } else {
                    matrix[x - 1][y] = 'X';
                    }
                    break;
                case 9:
                    x++;
                    y++;
                    matrix[x][y] = 'O';
                    if (matrix[x - 1][y] == 'O') {
                    matrix[x - 1][y] = '|';
                    } else {
                    matrix[x - 1][y] = '\\';
                    }
                    if (matrix[x][y - 1] == 'O') {
                    matrix[x][y - 1] = '-';
                    } else {
                    matrix[x][y - 1] = '/';
                    }
                    break;
                    default:
                    break;
            }
        }
        while (input != 5);
        for (int i = 0; i < cols + 2; i++) {
            System.out.print("-");
        }
    System.out.println("");

        for (int i = 0; i < rows; i++) {
            System.out.print("|");
            for (int j = 0; j < cols; j++) {
                System.out.print(matrix[i][j]);
            }
            System.out.println("|");
        }

    // Print bottom border
    for (int i = 0; i < cols + 2; i++) {
        System.out.print("-");
    }
    }
}

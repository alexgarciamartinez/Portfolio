/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.copernic.m03.uf1a5;

import java.util.Scanner;
import java.util.Arrays;


/**
 *
 * @author alexg
 */
public class Ex11_Brillantor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int[] brilliances = new int[10];
        double mean, stddev;

        // Get input and validate that it's between 0 and 9
        for (int i = 0; i < 10; i++) {
            int input;
            do {
                System.out.print("Enter brightness for star " + (i + 1) + ": ");
                input = scanner.nextInt();
            } while (input < 0 || input > 9);
            brilliances[i] = input;
        }

        // Calculate mean
        int sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += brilliances[i];
        }
        mean = (double) sum / 10;
        System.out.printf("Mean brightness: %.2f\n", mean);

        // Calculate mode
        Arrays.sort(brilliances);
        int mode = brilliances[0], modeCount = 1, currentCount = 1;
        for (int i = 1; i < 10; i++) {
            if (brilliances[i] == brilliances[i - 1]) {
                currentCount++;
            } else {
                if (currentCount > modeCount) {
                    mode = brilliances[i - 1];
                    modeCount = currentCount;
                }
                currentCount = 1;
            }
        }
        if (currentCount > modeCount) {
            mode = brilliances[9];
        }
        System.out.println("Mode brightness: " + mode);

        // Calculate standard deviation
        double variance = 0;
        for (int i = 0; i < 10; i++) {
            variance += Math.pow(brilliances[i] - mean, 2);
        }
        variance /= 10;
        stddev = Math.sqrt(variance);
        System.out.printf("Standard deviation: %.2f\n", stddev);
    }
}






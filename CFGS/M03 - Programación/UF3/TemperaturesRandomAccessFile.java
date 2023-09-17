/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

import java.io.IOException;
import java.io.RandomAccessFile;

/**
 *
 * @author alexg
 */
public class TemperaturesRandomAccessFile {
    public static void main(String[] args) {
        
        byte[] temperatures = {20,21,22};
        byte[] mestemperatures = {23,25,28,30};
        
        try {
            RandomAccessFile fitxer = 
                    new RandomAccessFile("temperatures_random","rw");
            
            //escriureTemperatures(mestemperatures,fitxer,3);
            
            byte[] temp = new byte[10];
            llegirTemperatures(temp,fitxer);
            for (byte t : temp) {
                System.out.println("Temperatura: " + t);
            }
            
            fitxer.close();
            
        } catch (IOException e) { System.out.println(e.getMessage()); }
        
    }
    
    public static void escriureTemperatures(byte[] temperatures, 
                                            RandomAccessFile f,
                                            int pos) throws IOException {
        f.seek(pos);
        f.write(temperatures);
        
    }

    public static void llegirTemperatures(byte[] temperatures,RandomAccessFile f) throws IOException {                
        f.read(temperatures);
        
    }

}

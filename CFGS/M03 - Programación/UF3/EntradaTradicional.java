/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

import java.io.*;

/**
 *
 * @author alexg
 */
public class EntradaTradicional {
    public static void main(String[] args) {
        InputStreamReader flux = new InputStreamReader(System.in);
        BufferedReader teclat = new BufferedReader(flux);
        OutputStreamWriter fluxSortida = new OutputStreamWriter(System.out);
        BufferedWriter pantalla = new BufferedWriter(fluxSortida);
        
        System.out.println("Soc l'ECO");
        String text;
        try{
            while(!(text = teclat.readLine()).equals("")){
                //System.out.println(text);
                pantalla.write(text + "\n");
            }
            pantalla.flush();
        }catch(IOException e){System.out.println("Error en llegir de l'entrada estàndar");}
    }
}

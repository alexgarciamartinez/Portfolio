/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

import java.io.*;
import java.net.URL;

/**
 *
 * @author alexg
 */
public class DescarregaImatge {
    public static void main(String[] args) {
        
        String url = "https://image-service.onefootball.com/transform?w=280&h=210&dpr=2&image=https%3A%2F%2Fimages.performgroup.com%2Fdi%2Flibrary%2FGOAL%2F87%2F1d%2Ffc-barcelona-champions-league_avrfscg6z04z1kzr8tg0trde9.jpg%3Ft%3D-1167223918";
        try {
            BufferedInputStream inputFile = new BufferedInputStream(new URL(url).openStream());   
            byte[] bufferDeDatos = new byte[1024];
            int bytesLlegits = 0;
            FileOutputStream fitxerSortida = new FileOutputStream("imatge.jpg");
            while ( (bytesLlegits = inputFile.read(bufferDeDatos, 0, 1024)) != -1){
                fitxerSortida.write(bufferDeDatos, 0, bytesLlegits);
            }
        } catch(IOException e){}
    }
}

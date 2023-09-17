/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

import java.io.*;
import java.io.IOException;

/**
 *
 * @author alexg
 */
public class Serialitzacio {
     public static void main(String[] args) {
        
        Contacte c1 = new Contacte("Pere","Puig Castellet","634543454","c/Pi, 23");
        Contacte c2 = new Contacte("Maria","Rosell Castany","653354345","c/La Rosa, 56 1er 2a");
        
        Contacte[] contactes = new Contacte[5];
        contactes[0] = c1;
        contactes[1] = c2;
        try {
            // Serialització
            /*FileOutputStream fitxer = new FileOutputStream("contactes");
            ObjectOutputStream desti = new ObjectOutputStream(fitxer);
            desti.writeObject(c1);*/
            
            // Deserialització 
            FileInputStream fitxer = new FileInputStream("contactes");
            ObjectInputStream origen = new ObjectInputStream(fitxer);
            
            Contacte c = (Contacte)origen.readObject();
            System.out.println("Nom    : " + c.getNom());
            System.out.println("Cognoms: " + c.getCognoms());
            System.out.println("Telèfon: " + c.getTelefon());
            System.out.println("Adreça : " + c.getAdreca());
            System.out.println("");
                    
        } catch (IOException e) { 
            System.out.println("Error d'entrada/sortida");
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Error: classe no trobada");
            System.out.println(e.getMessage());
        }
        
    }
}

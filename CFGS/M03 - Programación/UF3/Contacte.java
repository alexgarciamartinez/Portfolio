/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

/**
 *
 * @author alexg
 */
public class Contacte {
    
    private String nom;
    private String cognoms;
    private String telefon;
    private String adreca;
    
    public Contacte(String nom,String cognoms,String telefon,String adreca) {
        this.nom     = nom;
        this.cognoms = cognoms;
        this.telefon = telefon;
        this.adreca  = adreca;
    }

    public String getNom() {
        return nom;
    }

    public String getCognoms() {
        return cognoms;
    }

    public String getTelefon() {
        return telefon;
    }

    public String getAdreca() {
        return adreca;
    }
    
    public int compareTo(Contacte c) {
        /*if (cognoms.compareTo(c.cognoms) > 0)
            return 1;
        else if (cognoms.compareTo(c.cognoms) < 0)
            return -1;
        else
            return 0;*/
                
        return cognoms.compareTo(c.cognoms);
    }    
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf3;

import java.io.Serializable;

/**
 *
 * @author rferrero
 */
public class Contacte implements Comparable<Contacte>,Serializable {
        
    private String nom;
    private String cognoms;
    private String telefon;
    private String adreca;
    
    public Contacte(String nom,String cognoms,String telefon,String adreca) {
        this.nom     = nom;
        this.cognoms = cognoms;
        this.telefon = telefon;
        this.adreca  = adreca;
    }

    public String getNom() {
        return nom;
    }

    public String getCognoms() {
        return cognoms;
    }

    public String getTelefon() {
        return telefon;
    }

    public String getAdreca() {
        return adreca;
    }
    
    public int compareTo(Contacte c) {
        /*if (cognoms.compareTo(c.cognoms) > 0)
            return 1;
        else if (cognoms.compareTo(c.cognoms) < 0)
            return -1;
        else
            return 0;*/
                
        return cognoms.compareTo(c.cognoms);
    }    
}

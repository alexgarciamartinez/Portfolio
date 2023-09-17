/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lordsofsteel;

/**
 *
 * @author alexg
 */
public class Personatges {
    
    protected double forca; 
    protected double constitucio;
    protected double velocitat;
    protected double inteligencia;
    protected double sort;
    
    // Estadístiques secundaries 
    protected double ps;
    protected double pd;
    protected double pa;
    protected double pe;
    
    protected Arma arma;
    
    protected String nom;
    public Personatges(String nom, double forca, double constitucio, double velocitat, double
                       inteligencia, double sort, Arma arma){
        this.nom          = nom;
        this.forca        = forca;
        this.constitucio  = constitucio;
        this.velocitat    = velocitat;
        this.inteligencia = inteligencia;
        this.sort         = sort;
        this.arma         = arma;
    }
    
    protected void calculaEstadistiquesDerivades(){
        ps = constitucio + forca;
        pd = forca / 4;
        pa = inteligencia + sort;
        pe = velocitat + sort + inteligencia;
    }

    public double getForca() {
        return forca;
    }

    public void setForca(double forca) {
        this.forca = forca;
    }

    public double getConstitucio() {
        return constitucio;
    }

    public void setConstitucio(double constitucio) {
        this.constitucio = constitucio;
    }

    public double getVelocitat() {
        return velocitat;
    }

    public void setVelocitat(double velocitat) {
        this.velocitat = velocitat;
    }

    public double getInteligencia() {
        return inteligencia;
    }

    public void setInteligencia(double inteligencia) {
        this.inteligencia = inteligencia;
    }

    public double getSort() {
        return sort;
    }

    public void setSort(double sort) {
        this.sort = sort;
    }

    public double getPs() {
        return ps;
    }

    public void setPs(double ps) {
        this.ps = ps;
    }

    public double getPd() {
        return pd;
    }

    public void setPd(double pd) {
        this.pd = pd;
    }

    public double getPa() {
        return pa;
    }

    public void setPa(double pa) {
        this.pa = pa;
    }

    public double getPe() {
        return pe;
    }

    public void setPe(double pe) {
        this.pe = pe;
    }

    public Arma getArma() {
        return arma;
    }

    public void setArma(Arma arma) {
        this.arma = arma;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public void restauraPS(){
        this.ps = (int)(this.ps * 1.10);
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lordsofsteel;

/**
 *
 * @author alexg
 */
public class NanCaos extends Nan implements Caos{
    
    public NanCaos(String nom, double forca, double constitucio, double velocitat, 
               double inteligencia, double sort, Arma arma){
        super(nom, forca, constitucio, velocitat, inteligencia, sort, new Arma("Daga"));
        
    }
    public boolean atacPAReduida(Dau ... d){
        this.ps = (int)(this.ps * 1.10);
    }
}

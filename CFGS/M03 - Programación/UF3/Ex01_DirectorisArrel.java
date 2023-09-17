/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03a1;

import java.io.File;

/**
 *
 * @author alexg
 */
public class Ex01_DirectorisArrel {
    public static void main(String[] args) {
        File[] roots = File.listRoots();
        for (int i=0; i<roots.length; i++) {
           System.out.println(roots[i]);
        }
    }
}

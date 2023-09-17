/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package m03uf2;

/**
 *
 * @author alexg
 */
public class CercaBinaria {
    public static void main(String[] args) {        
        int[] nombres = {8, 9, 19, 24, 25, 27, 31, 34, 37, 47, 49, 50, 51, 54, 58, 65, 68, 72, 75, 76, 83, 89, 94, 101, 106, 107, 110, 111, 118, 119, 120, 123, 126, 131, 133, 137, 139, 142, 150, 154, 155, 157, 162, 172, 174, 177, 178, 179, 183, 193, 196, 197, 203, 204, 211, 212, 215, 218, 219, 220, 221, 222, 226, 233, 241, 245, 246, 249, 251, 255, 261, 268, 271, 279, 280, 288, 292, 296, 297, 299, 303, 310, 313, 314, 319, 327, 333, 334, 335, 346, 355, 357, 367, 369, 370, 377, 381, 384, 389, 392, 396, 399, 401, 402, 404, 405, 406, 410, 411, 415, 416, 418, 427, 428, 429, 431, 439, 446, 447, 449, 453, 459, 460, 461, 464, 467, 468, 472, 475, 482, 486, 488, 490, 496, 498, 499, 500, 506, 511, 515, 516, 519, 526, 533, 534, 537, 540, 541, 547, 552, 557, 563, 567, 570, 571, 575, 578, 579, 580, 584, 585, 591, 593, 594, 595, 599, 604, 608, 611, 617, 619, 620, 626, 627, 634, 636, 637, 643, 648, 649, 650, 652, 654, 655, 658, 667, 674, 677, 678, 681, 684, 686, 693, 696, 698, 700, 702, 707, 708, 712, 713, 716, 718, 719, 722, 724, 725, 728, 730, 732, 734, 739, 743, 744, 746, 750, 753, 754, 757, 758, 759, 760, 761, 764, 766, 769, 772, 773, 777, 785, 786, 787, 788, 789, 790, 791, 798, 800, 802, 805, 806, 808, 810, 811, 813,
        826, 857, 861, 872, 898};
        
        int valor = 808;
        int resultat = cercaBinaria(nombres,valor);
        //int resultat = cerca(nombres,valor);
        if (resultat != -1)
            System.out.println("El " + valor + " es troba a la posicio " + resultat);
        else
            System.out.println("El " + valor+ " no s'ha trobat");
    }
    static int cerca(int[]nombres, int valor){
        int resultat = -1;
        for (int i = 0; i < nombres.length; i++){
            if (nombres[i] == valor){
                //System.out.println("El " + valor + " es troba a la posició " + i);
                resultat = i;
            }
        }
        return resultat;
    }
    static int cercaBinaria(int[] nombres, int valor) {        
        int resultat = -1;
        int izq = 0;
        int der = nombres.length-1;
        int pas = 1;
        while (izq <= der && resultat == -1) {
            int med = (izq + der)/2;
            System.out.println("Pas " + pas + ": esq = " + izq + 
                               ", dre = " + der + ", med = " + med);
            if (nombres[med] == valor)            
                resultat = med;
            else if (nombres[med] < valor) {
                izq = med + 1;
            }
            else
                der = med - 1;           
            pas++;
        }
        return resultat;
    }
}



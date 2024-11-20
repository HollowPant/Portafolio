package Practica36;
import java.util.concurrent.Phaser;
public class Fases extends Phaser{
    @Override
    protected boolean onAdvance(int fase, int estudiantes){
        switch (fase) {
            case 0:
                return iniciarExamen();    
            case 1:
                return terminarEjercicio1();
            case 2:
                return terminarejercicio2();
            case 3:
                return terminarExamen();
            default:
            return true;
        }
    }
    private boolean iniciarExamen(){
        System.out.printf("Va a iniciar el examen\n");
        return false;
    }
    private boolean terminarEjercicio1(){
        System.out.printf("Se termino el ejercicio 1\n");
        System.out.printf("Va a iniciar el ejercicio 2\n");
        return false;
    }
    private boolean terminarejercicio2(){
        System.out.printf("Se termino el ejercicio 2\n");
        System.out.printf("Va a iniciar el ejercicio 3\n");
        return false;
    }
    private boolean terminarExamen(){
        System.out.printf("Se termino el examen\n");
        System.out.printf("Gracias por su tiempo\n");
        return true;
    }
}
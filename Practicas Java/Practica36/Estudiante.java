package Practica36;
import java.util.concurrent.Phaser;
import java.util.Date;
import java.util.concurrent.TimeUnit;
public class Estudiante implements Runnable{
    Phaser fases;
    public Estudiante(Phaser fases){
        this.fases = fases;
    }
    @Override
    public void run(){
        System.out.printf("%s: llego al examen\n", Thread.currentThread().getName(), new Date());
        fases.arriveAndAwaitAdvance();
        System.out.printf("%s va a inicar el ejercicio 1 %s\n", Thread.currentThread().getName(), new Date());
        hacerEjercicio1();
        System.out.printf("%s terminó el ejercicio 1 %s\n", Thread.currentThread().getName(), new Date());
        fases.arriveAndAwaitAdvance();
        System.out.printf("%s va a inicar el ejercicio 2 %s\n", Thread.currentThread().getName(), new Date());
        hacerEjercicio2();
        System.out.printf("%s terminó el ejercicio 2 %s\n", Thread.currentThread().getName(), new Date());
        fases.arriveAndAwaitAdvance();
        System.out.printf("%s va a inicar el ejercicio 3 %s\n", Thread.currentThread().getName(), new Date());
        hacerEjercicio3();
        System.out.printf("%s terminó el examen %s\n", Thread.currentThread().getName(), new Date());
        fases.arriveAndAwaitAdvance();
    }
    private void hacerEjercicio1(){
        try{
            long duracion=(long)(Math.random() * 10);
            TimeUnit.SECONDS.sleep(duracion);
        }catch(InterruptedException ex){
            ex.printStackTrace();
        }
    }
    private void hacerEjercicio2(){
        try{
            long duracion = (long)(Math.random() * 10);
            TimeUnit.SECONDS.sleep(duracion);
        }catch(InterruptedException ex){
            ex.printStackTrace();
        }
    }
    private void hacerEjercicio3(){
        try{
            long duracion = (long)(Math.random() * 10);
            TimeUnit.SECONDS.sleep(duracion);
        }catch(InterruptedException ex){
            ex.printStackTrace();
        }
    }
}
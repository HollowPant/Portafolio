package Practica36;
public class Main {
    public static void main(String[] args) {
        Fases fases = new Fases();
        Estudiante estudiantes[] = new Estudiante[3];
        for(int i=0;i<estudiantes.length;i++){
            estudiantes[i] = new Estudiante(fases);
            fases.register();
        }
        Thread hilos[] = new Thread[3];
        for(int i=0;i<estudiantes.length;i++){
            hilos[i] = new Thread(estudiantes[i],"Estudiante " + i);
            hilos[i].start();
        }
        for(int i=0;i<hilos.length;i++){
            try{
                hilos[i].join();
            }catch(InterruptedException ex){
                ex.printStackTrace();
            }
        }
        System.out.printf("Main: Las fases han terminado %s\n",fases.isTerminated());
    }
}
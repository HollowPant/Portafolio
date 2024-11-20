package parcial2Tarea1;
import java.util.ArrayList;
import java.util.Scanner;
public class Main {
    public static void main(String[] args){
        try{
            Scanner teclado = new Scanner(System.in);
            int diaNacimiento,mesNacimiento;
            ArrayList<Zodiaco> lista = new ArrayList<>();
            lista.add(new Aries());
            lista.add(new Acuario());
            lista.add(new Capricornio());
            lista.add(new Cancer());
            lista.add(new Escorpio());
            lista.add(new Geminis());
            lista.add(new Leo());
            lista.add(new Libra());
            lista.add(new Picis());
            lista.add(new Sagitario());
            lista.add(new Tauro());
            lista.add(new Virgo());
            System.out.println("------------------------------------------");
            System.out.println("Signo de Zodiaco");
            System.out.print("\nDia de nacimiento: ");
            diaNacimiento=teclado.nextInt();
            System.out.print("Mes de nacimiento: ");
            mesNacimiento=teclado.nextInt();
            for(Zodiaco zodiaco:lista){
                if(zodiaco.esSigno(diaNacimiento, mesNacimiento)){
                    System.out.println("\n" + zodiaco.datosSigno());
                    System.out.println("------------------------------------------");
                }
            }
        }catch(IllegalArgumentException ex1){
            System.out.println(ex1.getMessage());
        }
    }
}

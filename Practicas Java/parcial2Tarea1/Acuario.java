package parcial2Tarea1;
public class Acuario extends Zodiaco {
    // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Acuario(){
        super(21,1,19,2);
        significado="El aguador";
        elementos="Aire (fijo)";
        planeta="Urano y Saturno";
        piedra="Amalista";
    }

    // --- metodos set y get
    public String getSignificado(){
        return significado;
    }
    public String getElemento(){
        return elementos;
    }
    public String getPlaneta(){
        return planeta;
    }
    public String getPiedra(){
        return piedra;
    }

    // --- Metodos estandar
    public boolean esSigno(int diaNacimiento,int mesNacimiento){
        if(((diaNacimiento>=getDiaInicial()) && (mesNacimiento==getMesInicial())) || ((diaNacimiento<=getDiaFinal()) && (mesNacimiento==getMesFinal()))){
            return true;
        }
        return false;
    }
    @Override
    public String periodoSigno(){
        String periodo="";
        return (periodo="Del " + getDiaInicial() + " de Enerp al " + getDiaFinal() + " de Febrero");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Acuario" +
                        "\nPeriodo:        " + periodoSigno() + 
                        "\nSignificado:    " + getSignificado() +
                        "\nElemento:       " + getElemento() +
                        "\nPlaneta:        " + getPlaneta() +
                        "\nPiedra:         " + getPiedra());
    }
}

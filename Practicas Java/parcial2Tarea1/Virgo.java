package parcial2Tarea1;
public class Virgo extends Zodiaco{
    // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Virgo(){
        super(24,8,23,9);
        significado="La virgen";
        elementos="Tierra (mutable)";
        planeta="Mercurio";
        piedra="Zafiro";
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
        return (periodo="Del " + getDiaInicial() + " de Agosto al " + getDiaFinal() + " de Septiembre");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Virgo" +
        "\nPeriodo:        " + periodoSigno() + 
        "\nSignificado:    " + getSignificado() +
        "\nElemento:       " + getElemento() +
        "\nPlaneta:        " + getPlaneta() +
        "\nPiedra:         " + getPiedra());
    }
}

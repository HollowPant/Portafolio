package parcial2Tarea1;
public class Geminis extends Zodiaco{
    // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Geminis(){
        super(21,5,21,6);
        significado="Los gemelos";
        elementos="Aire (mutable)";
        planeta="Mercurio";
        piedra="Perla";
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
        return (periodo="Del " + getDiaInicial() + " de Mayo al " + getDiaFinal() + " de Junio");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Geminis" +
        "\nPeriodo:        " + periodoSigno() + 
        "\nSignificado:    " + getSignificado() +
        "\nElemento:       " + getElemento() +
        "\nPlaneta:        " + getPlaneta() +
        "\nPiedra:         " + getPiedra());
    }
}

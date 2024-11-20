package parcial2Tarea1;
public class Libra extends Zodiaco{
    // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Libra(){
        super(24,9,23,10);
        significado="La balanza";
        elementos="Aire (cardinal)";
        planeta="Venus";
        piedra="Opalo";
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
        return (periodo="Del " + getDiaInicial() + " de Septiembre al " + getDiaFinal() + " de Octubre");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Libra" +
        "\nPeriodo:        " + periodoSigno() + 
        "\nSignificado:    " + getSignificado() +
        "\nElemento:       " + getElemento() +
        "\nPlaneta:        " + getPlaneta() +
        "\nPiedra:         " + getPiedra());
    }
}

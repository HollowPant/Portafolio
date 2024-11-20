package parcial2Tarea1;
public class Escorpio extends Zodiaco{
    // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Escorpio(){
        super(24,10,20,11);
        significado="El escorpion";
        elementos="Agua (fijo)";
        planeta="Pluton y Marte";
        piedra="Topacio";
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
        return (periodo="Del " + getDiaInicial() + " de Octubre al " + getDiaFinal() + " de Noviembre");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Escorpio" +
        "\nPeriodo:        " + periodoSigno() + 
        "\nSignificado:    " + getSignificado() +
        "\nElemento:       " + getElemento() +
        "\nPlaneta:        " + getPlaneta() +
        "\nPiedra:         " + getPiedra());
    }
}

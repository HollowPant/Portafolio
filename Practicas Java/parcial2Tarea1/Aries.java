package parcial2Tarea1;
public class Aries extends Zodiaco {
    // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Aries(){
        super(21,3,20,4);
        significado="El carnero";
        elementos="Fuego (cardinal)";
        planeta="Marte y Pluto";
        piedra="Rubi";
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
        return (periodo="Del 21 de Marzo al 20 de Abril");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Aries" +
                        "\nPeriodo:        " + periodoSigno() + 
                        "\nSignificado:    " + getSignificado() +
                        "\nElemento:       " + getElemento() +
                        "\nPlaneta:        " + getPlaneta() +
                        "\nPiedra:         " + getPiedra());
    }
}

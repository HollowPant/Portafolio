package parcial2Tarea1;
public class Cancer extends Zodiaco{
        // --- atributos
    private String significado;
    private String elementos;
    private String planeta;
    private String piedra;

    // --- Metodo constructor
    public Cancer(){
        super(22,6,21,7);
        significado="El cangrejo";
        elementos="Agua (cardinal)";
        planeta="Luna";
        piedra="Diamante";
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
        return (periodo="Del 22 de Junio al 21 de Julio");
    }
    @Override
    public String datosSigno(){
        String respuesta="";
        return (respuesta="Signo:          Cancer" +
        "\nPeriodo:        " + periodoSigno() + 
        "\nSignificado:    " + getSignificado() +
        "\nElemento:       " + getElemento() +
        "\nPlaneta:        " + getPlaneta() +
        "\nPiedra:         " + getPiedra());
    }
}

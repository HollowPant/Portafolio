package parcial2Tarea1;
public class Zodiaco {
    // --- Atributos
    private int diaInicial;
    private int mesInicial;
    private int diaFinal;
    private int mesFinal;
    private String nombreMeses;

    // --- Metodo constructor
    public Zodiaco(){
        diaInicial=0;
        mesInicial=0;
        diaFinal=0;
        mesFinal=0;
    }
    // Metodo constructor sobrecargado
    public Zodiaco(int diaInicial, int mesInicial, int diaFinal, int mesFinal){
        this.diaInicial=diaInicial;
        this.mesInicial=mesInicial;
        this.diaFinal=diaFinal;
        this.mesFinal=mesFinal;
    }

    // --- Metodos set y get
    public void setDiaInicial(int valor){
        if((valor>=1) && (valor<=31)){
            diaInicial=valor;
        }else{
            throw new IllegalArgumentException("El dia inicial debe estar entre el dia 1 y 31");
        }
    }
    public int getDiaInicial(){
        return diaInicial;
    }
    public void setMesInicial(int valor){
        if((valor>=1) && (valor<=12)){
            mesInicial=valor;
        }else{
            throw new IllegalArgumentException("El mes inicial debe estar entre el mes 1 y 12");
        }
    }
    public int getMesInicial(){
        return mesInicial;
    }
    public void setDiaFinal(int valor){
        if((valor>=1) && (valor<=31)){
            diaFinal=valor;
        }else{
            throw new IllegalArgumentException("El dia final debe estar entre el dia 1 y 31");
        }
    }
    public int getDiaFinal(){
        return diaFinal;
    }
    public void setMesFinal(int valor){
        if((valor>=1) && (valor<=12)){
            mesFinal=valor;
        }else{
            throw new IllegalArgumentException("El mes final debe estar entre el mes 1 y 12");
        }
    }
    public int getMesFinal(){
        return mesFinal;
    }

    // --- Metodos estandar
    public String datosSigno(){
        String respuesta="";
        return respuesta;
    }
    public boolean esSigno(int diaNacimiento,int mesNacimiento){
        if(((diaNacimiento>=getDiaInicial()) && (mesNacimiento==getMesInicial())) || ((diaNacimiento<=getDiaFinal()) && (mesNacimiento==getMesFinal()))){
            return true;
        }
        return false;
    }
    public String periodoSigno(){
        String periodo="";

        return periodo;
    }
}

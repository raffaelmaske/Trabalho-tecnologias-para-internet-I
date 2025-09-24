import java.time.LocalDate;

public class Desenvolvedora {
    private String nome;
    private String idFiscal;
    private String pais;
    private String email;

    public Desenvolvedora(String nome, String email, String pais, String idFiscal) {
        this.nome = nome;
        this.idFiscal = idFiscal;
        this.pais = pais;
        this.email = email;
    }

    public String toString() {
        return  "\n  Estúdio: " + this.nome +
                "\n  CNPJ: " + this.idFiscal +
                "\n  País: " + this.pais +
                "\n  Email: " + this.email;

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPais(){
        return pais;
    }

    public void setPais(String pais){
        this.pais = pais;
    }

    public String getIdFiscal() {
        return idFiscal;
    }

    public void setIdFiscal(String idFiscal) {
        this.idFiscal = idFiscal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

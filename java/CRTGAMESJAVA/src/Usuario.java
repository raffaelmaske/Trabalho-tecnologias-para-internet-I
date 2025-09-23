public class Usuario {
    private String nomeUsuario;
    private String nickname;
    private String email;
    private String pais;

    public Usuario(String nomeUsuario, String nickname, String email, String pais) {
        this.nomeUsuario = nomeUsuario;
        this.nickname = nickname;
        this.email = email;
        this.pais = pais;
    }
    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
}
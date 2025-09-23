import java.time.LocalDate;

public class CadJogo {
    private String titulo;
    private String dev;
    private String genero;
    private LocalDate data;
    private double preco;

    public CadJogo(String titulo, String dev, String genero, LocalDate data, double preco) {
        this.titulo = titulo;
        this.dev = dev;
        this.genero = genero;
        this.data = data;
        this.preco = preco;

    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDev() {
        return dev;
    }

    public void setDev(String dev) {
        this.dev = dev;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero() {
        this.genero = genero;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
            this.preco = preco;
    }
}


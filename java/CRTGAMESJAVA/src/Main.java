import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.text.NumberFormat;
import static java.lang.Runtime.*;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<CadJogo> jogos = new ArrayList<>();
        List<Desenvolvedora> desenvolvedoras = new ArrayList<>();
        List<Usuario> usuarios = new ArrayList<>();
        int opcao = -1;


        while (opcao != 0) {
            exibirMenu();
            try {
                System.out.println("Insira uma opção: ");
                opcao = scanner.nextInt();
            } catch (NumberFormatException e) {
                System.out.println("Erro: Por favor, digite um número válido.");
                opcao = -1;
                continue;

            }
            scanner.nextLine();
            switch (opcao) {
                case 1:
                    cadastrarJogo(scanner, jogos);
                    break;
                case 2:
                    cadastrarDesenvolvedora(scanner, desenvolvedoras);
                    break;
                case 3:
                    cadastrarUsuario(scanner, usuarios);
                    break;
                case 4:
                    listarJogos(jogos);
                    break;
                case 5:
                    listarDesenvolvedoras(desenvolvedoras);
                    break;
                case 6:
                    listarUsuarios(usuarios);
                    break;
                case 0:
                    System.out.println("Saindo do sistema...");
                    break;
                default:
                    System.out.println("Opção inválida. Tente novamente.");
            }
            System.out.println();
        }

        scanner.close();
    }

    private static void exibirMenu() {
        System.out.println("--- CRT Games - Console de Gerenciamento ---");
        System.out.println("1. Cadastrar Novo Jogo");
        System.out.println("2. Cadastrar Nova Desenvolvedora");
        System.out.println("3. Cadastrar Novo Usuário");
        System.out.println("4. Listar Jogos");
        System.out.println("5. Listar Desenvolvedoras");
        System.out.println("6. Listar Usuários");
        System.out.println("0. Sair");

    }

    private static void cadastrarUsuario(Scanner scanner, List<Usuario> usuarios) {
        System.out.println("\n--- Cadastro de Novo Usúario ---");
        System.out.print("Nome do Usúario: ");
        String nomeUsuario = scanner.nextLine();
        System.out.print("Apelido do Usuario: ");
        String nickname = scanner.nextLine();
        System.out.print("email: ");
        String email = scanner.nextLine();
        boolean isErrorEmail = true;
        while (isErrorEmail){
            String lowerEmail = email.toLowerCase();
            if (lowerEmail != null && lowerEmail.contains("@") && lowerEmail.contains(".")) {
                isErrorEmail = false;
            } else {
                System.out.println("Erro: O formato do e-mail é inválido.");
                System.out.print("Digite novamente um email válido(contém @ e .): ");
                email = scanner.nextLine();
            }
        }
        System.out.print("Pais: ");
        String pais = scanner.nextLine();

        usuarios.add(new Usuario(nomeUsuario, nickname, email, pais));
        System.out.println("Usuario cadastrado com sucesso!");


    }

    private static void listarUsuarios(List<Usuario> usuarios) {

        if (usuarios.isEmpty()) {
            System.out.println("Nenhum usúario cadastrado.");
        } else {
            for (Usuario nomes : usuarios) {
                System.out.println(nomes);
            }
        }

    }


    private static void cadastrarDesenvolvedora(Scanner scanner, List<Desenvolvedora> desenvolvedoras) {
        System.out.println("\n--- Cadastro de Desenvolvedora ---");
        System.out.print("Nome do Estúdio: ");
        String nome = scanner.nextLine();
        System.out.print("ID Fiscal (CNPJ): ");
        String idFiscal = scanner.nextLine();
        System.out.print("País de Origem: ");
        String pais = scanner.nextLine();
        System.out.print("E-mail de Contato: ");
        String email = scanner.nextLine();
        boolean isErrorEmail = true;
        while (isErrorEmail){
            String lowerEmail = email.toLowerCase();
            if (lowerEmail != null && lowerEmail.contains("@") && lowerEmail.contains(".")) {
                isErrorEmail = false;
            } else {
                System.out.println("Erro: O formato do e-mail é inválido.");
                System.out.print("Digite novamente um email válido(contém @ e .): ");
                email = scanner.nextLine();
            }
        }

        desenvolvedoras.add(new Desenvolvedora(nome, email, pais, idFiscal));
        System.out.println("Desenvolvedora cadastrada com sucesso!");
    }

    private static void listarDesenvolvedoras(List<Desenvolvedora> desenvolvedoras) {
        System.out.println("\n--- Lista de Desenvolvedoras Cadastradas ---");
        if (desenvolvedoras.isEmpty()) {
            System.out.println("Nenhuma desenvolvedora cadastrada.");
        } else {
            for (Desenvolvedora dev : desenvolvedoras) {
                System.out.println(dev);
            }
        }
    }


    private static void cadastrarJogo(Scanner scanner, List<CadJogo> jogos) {

        System.out.println("\n--- Cadastro de Novo Jogo ---");
        System.out.print("Título do Jogo: ");
        String titulo = scanner.nextLine();
        System.out.print("Desenvolvedora: ");
        String dev = scanner.nextLine();
        System.out.print("Gênero: ");
        String genero = scanner.nextLine();
        System.out.print("Preço (ex: 49,99): ");
        Double preco = scanner.nextDouble();
//        NumberFormat.getCurrencyInstance().format(preco);
        System.out.print("Data de Lançamento (dd/MM/yyyy): ");
        scanner.nextLine();
        boolean isError = true;
        do {
            DateTimeFormatter dataFormatada = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String data = scanner.nextLine();
            try {
                LocalDate date = LocalDate.parse(data, dataFormatada);
                isError = false;
                jogos.add(new CadJogo(titulo, dev, genero, data, preco));
                System.out.println("Jogo cadastrado com sucesso!");
            } catch (DateTimeParseException errorData) {
                System.out.println("Data informada inválida: " + data +
                        "\n Favor inserir data no formato: dd/MM/yyyy.");
            }
        }while (isError);

    }

    private static void listarJogos(List<CadJogo> jogos) {
        System.out.println("\n--- Lista de Jogos Cadastrados ---");
        if (jogos.isEmpty()) {
            System.out.println("Nenhum jogo cadastrado.");
        } else {
            for (CadJogo jogo : jogos) {
                System.out.println(jogo);
            }
        }
    }
}











--========CRIAÇÃO DAS TABELAS========--
CREATE TABLE Desenvolvedoras (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome_estudio VARCHAR(100) NOT NULL,
    pais_origem VARCHAR(50),
);

CREATE TABLE Generos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    pais VARCHAR(50),
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Jogos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    data_lancamento DATE,
    desenvolvedora_id INT,
    genero_id INT,
    FOREIGN KEY (desenvolvedora_id) REFERENCES Desenvolvedoras(id),
    FOREIGN KEY (genero_id) REFERENCES Generos(id)
);


CREATE TABLE Compras (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT,
    jogo_id INT,
    preco_pago DECIMAL(10, 2) NOT NULL,
    data_compra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (jogo_id) REFERENCES Jogos(id)
);


CREATE TABLE TicketsSuporte (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT,
	jogo_id int,
    assunto VARCHAR(100) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    data_abertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'Aberto',
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Avaliacoes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT,
    jogo_id INT,
    nota INT NOT NULL,
    comentario VARCHAR(500),
    data_avaliacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (jogo_id) REFERENCES Jogos(id),
    CONSTRAINT Avaliacao_Un_Usuario UNIQUE (usuario_id, jogo_id)
);

select * from Desenvolvedoras
select * from Jogos
select * from Usuarios
select * from TicketsSuporte
select * from Avaliacoes
select * from Generos
select * from Compras

select * from sys.tables


DROP TABLE Usuarios,Jogos,Desenvolvedoras,TicketsSuporte,Generos,Compras,Avaliacoes
DROP TABLE Usuarios,Jogos,Desenvolvedoras,Generos


--========INSERÇÃO DE DADOS========--

INSERT INTO Desenvolvedoras (nome_estudio, pais_origem) VALUES
('SehLoiro Gamess', 'Brasil'),
('Rockstar Games', 'EUA'),
('Valve Corporation', 'EUA'),
('Electronic Arts', 'EUA'),
('Ubisoft', 'França'),
('Capcom', 'Japão')

INSERT INTO Generos (nome) VALUES
('FPS'),
('Esportes'),
('Ação / Survival Horror'),
('Mundo Aberto/Ação/Aventura'),
('Indie');



INSERT INTO Usuarios (nickname, email, senha, pais) VALUES
('cjota', 'carlos@email.com', 'senhadocarlos', 'Brasil'),
('th', 'thiago@email.com', 'senhadothiago', 'Brasil'),
('msk', 'raffael@email.com', 'senhadoraffael', 'Brasil');


INSERT INTO Jogos (titulo, preco, data_lancamento, desenvolvedora_id, genero_id) VALUES
('Raining Blood Hellfire', 50.00, '2025-07-11',1 , 5),
('GTA VI', 800.00, '2026-05-26', 2, 4),
('Counter Strike 2', 0.00, '2023-09-20', 3, 1),
('Assassins Creed Shadows', 234.99, '2025-03-20', 5, 4),
('Resident Evil 4', 59.99, '2005-01-11', 6, 3),
('EA SPORTC FC 26', 499.99, '2025-09-26', 4, 2)


-- 1 cj
-- 2 th
-- 3 msk
INSERT INTO Compras (usuario_id, jogo_id, preco_pago) VALUES
(1, 1, 50.00), 
(1, 2, 800.00), 
(2, 6, 499.99),
(2, 2, 800.00),
(2, 3, 0.00),
(3, 3, 0.00), 
(3, 2, 800.00)



INSERT INTO TicketsSuporte (usuario_id, assunto, descricao, status) VALUES
(1, 'Problema com a instalação', 'Não consigo instalar o jogo Raining Blood Hellfire, aparece o erro X.','Aberto'),
(2, 'Dúvida sobre reembolso', 'Como faço para pedir o reembolso de um jogo?', 'Fechado'),
(3, 'Reclamação','CS cheio de hack', 'Em Andamento')



INSERT INTO Avaliacoes (usuario_id, jogo_id, nota, comentario) VALUES
(1, 1, 5, 'Jogo incrível! Muitas horas de diversão garantida.'),
(2, 2, 4, 'Ótimo jogo de ação, mas a campanha é um pouco curta.'),
(3, 3, 1, 'Jogo cheio de hacker')



--========MANIPULAÇÃO DOS DADOS========--
-- FUNÇÃO IIF--
SELECT titulo,preco,
  IIF(preco > 0, 'Pago', 'Gratuito') AS StatusPreco
FROM Jogos
order by preco desc


-------------------------FUNÇÃO WHILE-------------------------

DECLARE @CONTADOR VARCHAR(1000)
SELECT @CONTADOR = '100002';

WHILE @CONTADOR < 1000000
BEGIN 

IF @CONTADOR = 103000
BEGIN
		print 'pulando o 245'
			SET @CONTADOR = @CONTADOR + 1
	CONTINUE
END
	PRINT 'INSERINDO'
	INSERT INTO Usuarios (nickname, email, senha, pais) VALUES ('cjota' + @CONTADOR, 'carlos'+ @CONTADOR + '@email.com', 'senhadocarlos', 'Brasil')
	IF @CONTADOR = 105000
BEGIN
		print 'finalizado'
	BREAK
END
	SET @CONTADOR = @CONTADOR + 1;
END


SELECT * FROM Usuarios

-------------------------FUNÇÃO WHEN-------------------------
SELECT
    J.titulo,
    A.nota,
    CASE
        WHEN A.nota = 5 THEN 'Excelente'
        WHEN A.nota = 4 THEN 'Bom'
        WHEN A.nota = 3 THEN 'Regular'
		WHEN A.nota = 2 THEN 'Ruim'
        ELSE 'Péssimo'
    END AS Classificacao
FROM
    Avaliacoes AS A
JOIN Jogos AS J ON A.jogo_id = J.id;


-------------------------FUNÇÃO IF-------------------------
SELECT
    titulo,
    preco,
    CASE
        WHEN preco > 0 THEN 'O jogo é pago.'
        ELSE 'O jogo é gratuito.'
    END AS StatusPreco
FROM
    Jogos


-------------------------TRIGGER-------------------------
CREATE TRIGGER TRG_ValidaDataCompra
ON Compras                       
AFTER INSERT, UPDATE              
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE data_compra > CURRENT_TIMESTAMP)
    BEGIN
        ROLLBACK TRANSACTION;
        print ('Erro: A data da compra não pode ser uma data futura.');
    END
END

INSERT INTO Compras (usuario_id, jogo_id, preco_pago, data_compra)
VALUES (1, 4, 0.00, GETDATE());


INSERT INTO Compras (usuario_id, jogo_id, preco_pago, data_compra)
VALUES(2, 4, 0.00, DATEADD(year, 1, GETDATE()));


drop trigger TRG_ValidaDataCompra


-------------------------FUNCTION-------------------------
CREATE FUNCTION dbo.fn_FormatarMoeda (@valor DECIMAL(10,2))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN FORMAT(@valor, 'C', 'pt-br');
END

-- Na tabela de Jogos
SELECT
    titulo,
    preco,
    dbo.fn_FormatarMoeda(preco) AS PrecoFormatado
FROM
    Jogos
ORDER BY PrecoFormatado desc

-- Na tabela de Compras
SELECT
    usuario_id,
    jogo_id,
    dbo.fn_FormatarMoeda(preco_pago) AS PrecoPagoFormatado
FROM
    Compras
ORDER BY PrecoPagoFormatado desc


-------------------------INDEX-------------------------

CREATE NONCLUSTERED INDEX Usuarios_Nickname ON Usuarios(pais);



SELECT id, email, pais, data_cadastro
FROM Usuarios
WHERE nickname = 'cjota103001'



drop index Usuarios_Nickname on Usuarios

----------------------------------------------------





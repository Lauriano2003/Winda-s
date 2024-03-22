drop database windas;

create database windas;

use windas;

create table hotel
(
	idHotel int primary key auto_increment,
    nomeFantasia varchar(60) not null,
    cnpj varchar(20) not null,
    cidade varchar(60) not null,
    bairro varchar(60) not null,
    logradouro varchar(80) not null,
    numLogradouro varchar(20) not null,
    cep char(9) not null
);

create table quarto
(
	idQuarto int primary key auto_increment,
    descricao varchar(30),
    andar varchar(20),
    ocupacao varchar(8) check (ocupacao in('ocupado','livre')),
    idHotel int,
    foreign key (idHotel) references hotel(idHotel)
);

create table janela
(
	idJanela int primary key auto_increment,
    descricao varchar(45),
    idQuarto int,
    foreign key (idQuarto) references quarto (idQuarto)
);

create table sistema 
(
	fkJanela   int primary key,
    codVerificacao char(6) not null,
    foreign key (fkJanela) references janela (idJanela)
);

create table sensor 
(
	idSensor int primary key auto_increment,
    tipo varchar (40) check( tipo in ('Bloqueio', 'Temperatura', 'Umidade')),
    posicao varchar (40),
    idSistema int,
    foreign key (idSistema) references sistema (fkJanela)
);

create table registro
(
	idRegistro int primary key auto_increment,
    leitura varchar (30),
    dataHora datetime,
    clima varchar (45),
    idSensor int,
	foreign key (idSensor) references sensor (idSensor)
);

-- Inserções para a tabela 'hotel'
INSERT INTO hotel (nomeFantasia, cnpj, cidade, bairro, logradouro, numLogradouro, cep)
VALUES ('Hotel Meliã', '12345678901234', 'São Paulo', 'Centro', 'Av. Paulista', '123', '01234-567'),
       ('Hotel Accor', '98765432109876', 'Rio de Janeiro', 'Copacabana', 'Av. Atlântica', '456', '21098-765');

-- Inserções para a tabela 'quarto'
INSERT INTO quarto (descricao, andar, ocupacao, idHotel)
VALUES ('Quarto Luxo', '10º Andar', 'livre', 1),
       ('Quarto Simples', '3º Andar', 'ocupado', 1),
       ('Quarto Duplo', '5º Andar', 'livre', 2);

-- Inserções para a tabela 'janela'
INSERT INTO janela (descricao, idQuarto)
VALUES ('Janela Suite Principal', 1),
       ('Janela Quarto 301', 2),
       ('Janela Quarto 503', 3);

-- Inserções para a tabela 'sistema'
INSERT INTO sistema (fkJanela, codVerificacao)
VALUES (1, 'ABC123'),
       (2, 'DEF456'),
       (3, 'GHI789');

-- Inserções para a tabela 'sensor'
INSERT INTO sensor (tipo, posicao, idSistema)
VALUES ('Temperatura', 'Interno', 1),
       ('Umidade', 'Externo', 2),
       ('Bloqueio', 'Interno', 3);

-- Inserções para a tabela 'registro'
INSERT INTO registro (leitura, dataHora, clima, idSensor)
VALUES ('25°C', '2024-03-20 10:00:00', 'Ensolarado', 1),
       ('60%', '2024-03-20 11:00:00', 'Ensolarado', 2),
       ('Aberta', '2024-03-20 12:00:00', 'Ensolarado', 3);

-- Selecione todos os hotéis
SELECT * FROM hotel;

-- Selecione todos os quartos ocupados
SELECT * FROM quarto WHERE ocupacao = 'ocupado';

-- Selecione todas as janelas
SELECT * FROM janela;

-- Selecione todos os sistemas
SELECT * FROM sistema;

-- Selecione todos os sensores
SELECT * FROM sensor;

-- Selecione todos os registros
SELECT * FROM registro;






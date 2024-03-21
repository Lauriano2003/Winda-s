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
    tipo varchar (10) check( tipo in ('Bloqueio', 'Temperatura', 'Umidade')),
    posicao varchar (10),
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







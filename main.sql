-- criação de tabelas
CREATE TABLE AGENCIA (
    nome_agencia char(15) not null, 
    cidade char(30),
    orcamento decimal(10,2),
    primary key (nome_agencia),
    check (orcamento >= 0)
);

CREATE TABLE CONTA (
    id_conta char(10) not null,
    nome_agencia char(15),
    saldo decimal(10,2),
    primary key (id_conta),
    foreign key (nome_agencia) references AGENCIA
);

CREATE TABLE CLIENTE (
    id_cliente interger not null,
    cpf char(11) not null unique,
    nome varchar(40) not null,
    rua char(30),
    classificacao varchar(20),
    cidade char(30),
    primary key (id_cliente),
    check (classificacao in ('Ativo', 'Inativo'))
);
 CREATE TABLE DEPOSITANTE (
    id_cliente char(10) not null,
    id_conta char(10) not null,
    primary key(id_cliente, id_conta),
    foreign key(id_cliente) references CLIENTE,
    foreign key(id_conta) references CONTA
 );

-- inserção dos dados
INSERT INTO AGENCIA VALUES ('Fapa', 'Porto Alegre', 300.50);
INSERT INTO CONTA VALUES ('777', 'Fapa', 0.0);
INSERT INTO CLIENTE VALUES ('12345', '000.000.000-00', 'Gabriela Von Borowski Ben', 'Nome Rua', 'Ativo', 'Viamão');
-- consulta
SELECT * FROM AGENCIA;
SELECT * FROM CONTA;
SELECT * FROM CLIENTE;
SELECT * FROM DEPOSITANTE;
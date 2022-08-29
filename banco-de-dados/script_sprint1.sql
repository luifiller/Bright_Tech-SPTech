-- OBSERVAÇÕES | Legenda: '!' = afirmações; '?' = dúvidas; '#" = afazeres
-- ! Retiramos o ramo/segmento, pois nosso cliente principal são os fabricantes(segmento industrial)
-- ! Trataremos de clientes nacionais, por isso o 'telefone' = varchar(20)
-- ! Utilizamos 'double' para as variáveis do arduino, pois foi recomendado pela Prof. Vivian
-- ? Tem como fazer commparações com parâmetros de quanto de luz na presença e na ausência
-- ? Tem que colocar uma classificação de ambiente

-- SCRIPT DE CRIAÇÃO DE TABELAS
-- Criar database para a Sprint1
create database sprint1;

-- Selecionar database para ser usada
use sprint1;

-- Criar tabela de usuário
create table usuarios (
	id_usuario int primary key auto_increment,
    nome_empresa varchar(255) not null,
    CNPJ varchar(20),
	responsavel varchar(100) default ('Alguém'),
    email varchar(100), constraint chkEmail check
		(email like ('%@%')),
	senha varchar(255),
	telefone_empresa varchar(20) not null,
    cep char(9), constraint chkCep check
		(cep like ('%-%')),
	cidade varchar(50),
    estado varchar(50),
    logradouro varchar(100),
    bairro varchar(100),
    dtCadastro date not null,
	status_contrato varchar(7), constraint chkStatus check
		(status_contrato in ('Ativo', 'Inativo')),
	qtdArduino int not null
);

-- Descrever tabela dos usuários
desc usuarios;

-- Mostrar tabela usuarios
select * from usuarios;

-- Criar tabela para arduino
create table arduino (
	id_arduino int primary key auto_increment,
    numero_serie int,
    presenca varchar(9) not null,
    luminosidade double not null,
    parametro_presente double not null,
    parametro_ausente double not null,
    tensao double not null,
    dataH datetime not null
);

-- Descrever tabela do arduino
desc arduino;

-- Mostrar tabela arduino
select * from arduino;

-- SCRIPT DE INSERÇÃO DE REGISTROS
-- [AINDA INSERIR]



-- SCRIPT DE CONSULTA DE DADOS
-- 1. Usuários
-- Selecionar todos os dados de todos os usuários
select * from usuarios;

-- Selecionar os usuários da cidade de São Paulo
select * from usuarios
	where cidade = ('São Paulo');

-- Selecionar os usuários que se cadastraram a partir de 2022-08-18
select * from usuarios
	where dtCadastro >= ('2022-08-18');
    
-- Selecionar apenas os IDs, nomes, CNPJs e segmentos
select id_usuario, nome, CNPJ, segmento from usuarios;

-- Ordenar de forma crescente os dados dos usuários pelo segmento
select * from usuarios order by segmento asc;

-- Ordenar de forma decrescente os dados dos usuários pela data de cadastro
select * from usuarios order by dtCadastro desc;

-- 2. Arduino
-- Selecionar todos os dados da tabela
select * from arduino;

-- Selecionar apenas o id_arduino, temperaturaC, umidade e data/hora
select id_arduino, temperaturaC, umidade, dataH from arduino;

-- Selecionar temperaturas em celcius maior que 28
select * from arduino
	where temperaturaC > 28;
    
-- Selecionar umidade diferente de 80
select * from arduino
	where umidade <> 80;
    
-- Ordenar os dados do arduino de forma crescente pela temperatura em celcius
select * from arduino order by temperaturaC asc;



-- SCRIPT DE CRIAÇÃO DE TABELAS
-- Criar database para a Sprint1
create database sprint1;

-- Selecionar database para ser usada
use sprint1;

-- Criar tabela de usuário
create table usuarios (
	id_usuario int primary key auto_increment,
    nome_empresa varchar(255) not null,
    CNPJ char(20) not null,
	responsavel varchar(100) default ('preencher depois'),
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
    dtCadastro date,
	status_contrato varchar(7), constraint chkStatus check
		(status_contrato in ('Ativo', 'Inativo')),
	qtdArduino int
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
    dataH datetime not null
);

-- Descrever tabela do arduino
desc arduino;

-- Mostrar tabela arduino
select * from arduino;


-- SCRIPT DE INSERÇÃO DE REGISTROS
-- 1. Usuários
-- Inserir dados de empresas como se viesse do cadastro que o cliente fez
insert into usuarios (nome_empresa, cnpj, responsavel, email, senha, telefone_empresa, cep, cidade, estado, logradouro, bairro) values
	('Fluid New', '82.975.356/0001-05', 'José', 'financeiro@fluidnew.com', 'YYePHxGQL3[P', '(011)3233-4553', '04473-150', 'São Paulo', 'SP', 'Rua das Traíras', 'Balneário São Francisco'),
	('Black Shark', '24.133.667/0001-20', 'Pedro', 'comercial@black.shark', 'usaWc|8HG[Cc', '(011)2875-3455', '13052-151', 'Campinas', 'SP', 'Rua Antônio Fernando Von Ah', 'Jardim Santa Terezinha'),
	('SPTrans', '32.562.773/0001-58', 'Jubiscreudo', 'jubiscreudo@sptrans.com', 'tCpkgr#nbcqR', '(011)2884-2173', '12926-564', 'Bragança Paulista', 'SP', 'Rua Luiz Carmignotto', 'Jardim da Fraternidade'),
	('Wise Up', '39.093.718/0001-05', 'Marina', 'marinacodaira@wiseup.com', '7JOHJwkeGtuk', '(011)2875-3455', '17012-013', 'Bauru', 'SP', 'Praça Valter Bonilha', 'Vila Santa Tereza');

-- Dados que serão inseridos manualmente por nós
update usuarios set dtCadastro = '2022-08-15', qtdArduino = 10, status_contrato = 'Ativo' where id_usuario = 1;
update usuarios set dtCadastro = '2022-08-18', qtdArduino = 26, status_contrato = 'Ativo' where id_usuario = 2;
update usuarios set dtCadastro = '2022-08-15', qtdArduino = 32, status_contrato = 'Ativo' where id_usuario = 3;
update usuarios set dtCadastro = '2022-08-28', qtdArduino = 8, status_contrato = 'Inativo' where id_usuario = 4;

-- 2. Arduino
-- Inserir dados de empresas
insert into arduino (presenca, dataH) values
	('Ausente', '2022-08-15 10:00:05'),
	('Ausente', '2022-08-15 10:01:20'),
	('Ausente', '2022-08-15 10:02:35'),
	('Detectado', '2022-08-15 10:03:40'),
	('Detectado', '2022-08-15 10:04:05'),
	('Detectado', '2022-08-15 10:05:15'),
	('Detectado', '2022-08-15 10:06:45'),
	('Detectado', '2022-08-15 10:07:00');
    
-- Inserir dados manualmente de número de série 
update arduino set numero_serie = '131512' where id_arduino = 1;    
update arduino set numero_serie = '161719' where id_arduino = 2;    
update arduino set numero_serie = '181417' where id_arduino = 3;    
update arduino set numero_serie = '101219' where id_arduino = 4;    


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
    
-- Selecionar apenas os IDs, nomes e CNPJs 
select id_usuario, nome_empresa, CNPJ from usuarios;

-- Ordenar de forma crescente os dados dos usuários pelo email
select * from usuarios order by email asc;

-- Ordenar de forma decrescente os dados dos usuários pela data de cadastro
select * from usuarios order by dtCadastro desc;

-- 2. Arduino
-- Selecionar todos os dados da tabela
select * from arduino;

-- Selecionar apenas o id_arduino, presença e data/hora
select id_arduino, presenca, dataH from arduino;

-- Selecionar apenas o numero_serie e presença
select numero_serie, presenca from arduino;

-- Selecionar id_arduino e data/hora por ordem crescente 
select id_arduino, dataH from arduino order by dataH asc;
--Loja de Construção
--Autores: Felipe Cherubin
--		   Luiz Felipe Simão

Create DataBase Casa_de_Construcao; 
go

use Casa_de_Construcao;
go

--Criação de Tabelas

--Tabela de Estados
CREATE TABLE Estado (
Estado char(20),
Id_Estado int PRIMARY KEY
)

--Tabela de Cidades
CREATE TABLE Cidades (
Nome_Cidade char(30),
Id_Cidades bigint PRIMARY KEY,
Id_Estado int
)

--Tabelas de Cargos
CREATE TABLE CargosESalarios (
IdCargo tinyint PRIMARY KEY,
Cargo varchar(15),
Salario money
)

--Tabela Clientes
CREATE TABLE Cliente (
Numero char(5),
Bairro char(20),
RG char(12),
CPF char(14),
Id_Cliente bigint PRIMARY KEY,
Nome varchar(40),
Logradouro varchar(10),
Id_Cidades bigint
)

--Tabela de Fornecedores
CREATE TABLE Fornecedor (
RazaoSocial varchar(10),
Logradouro varchar(50),
IdFornecedor bigint PRIMARY KEY,
Numero char(5),
CNPJ char(18),
Bairro varchar(20),
NomeFantasia varchar(10),
Id_Cidades bigint
)

--Tabela de funcionarios
CREATE TABLE Funcionario (
Registro int PRIMARY KEY,
DataNascimento date,
CPF char(15),
Nome varchar(35),
Logradouro varchar(10),
Numero char(4),
Bairro varchar(20),
CarteiraDeTrabalho varchar(10),
CEP varchar(10),
RG char(12),
IdCargo tinyint,
Id_Cidades bigint,
FOREIGN KEY(Id_Cidades) REFERENCES Cidades (Id_Cidades)
)

--Tabela Produtos
CREATE TABLE Produto (
Descrição varchar(40),
IdProduto bigint PRIMARY KEY
)

--Tabela de itens Fornecidos
CREATE TABLE Fornecidos (
IdProduto bigint,
IdFornecedor bigint,
FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto),
FOREIGN KEY(IdFornecedor) REFERENCES Fornecedor (IdFornecedor)
)

--Tabela de Nota de pedidos
CREATE TABLE NotaFiscal_Pedidos (
NumeroNota bigint,
DataEmissao date,
Numero_Pedido bigint,
Quantidade int,
Data_Compra date,
Id_Cliente bigint,
Registro int,
PRIMARY KEY(Numero_Pedido)
)

--Tabela de Serviços
CREATE TABLE Serviço_NotaServiço (
NumeroServico bigint,
NumeroNota bigint,
DateEmissao date,
NumeroNotaPedido bigint,
Numero_Pedido bigint,
PRIMARY KEY(NumeroNota)
)

--Tabela de serviço realizado
CREATE TABLE Realizado (
Registro int,
NumeroServico bigint,
FOREIGN KEY(Registro) REFERENCES Funcionario (Registro),
FOREIGN KEY(NumeroServico) REFERENCES Serviço_NotaServiço (NumeroNota)
)

CREATE TABLE item_de_pedido (
IdProduto bigint,
Numero_Pedido bigint,
Quantidade int,
FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto),
FOREIGN KEY(Numero_Pedido) REFERENCES NotaFiscal_Pedidos (Numero_Pedido)
)


ALTER TABLE Serviço_NotaServiço ADD FOREIGN KEY(Numero_Pedido) REFERENCES NotaFiscal_Pedidos (Numero_Pedido)
ALTER TABLE NotaFiscal_Pedidos ADD FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
ALTER TABLE NotaFiscal_Pedidos ADD FOREIGN KEY(Registro) REFERENCES Funcionario (Registro)
ALTER TABLE Cliente ADD FOREIGN KEY(Id_Cidades) REFERENCES Cidades (Id_Cidades)
ALTER TABLE Fornecedor ADD FOREIGN KEY(Id_Cidades) REFERENCES Cidades (Id_Cidades)
ALTER TABLE Cidades ADD FOREIGN KEY(Id_Estado) REFERENCES Estado (Id_Estado)
ALTER TABLE Funcionario ADD FOREIGN KEY(IdCargo) REFERENCES CargosESalarios (IdCargo)

CREATE SCHEMA Funcionarios AUTHORIZATION dbo



-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Lista_Favoritos (
Item_favorito VARCHAR(10),
Id_lista_fav VARCHAR(10) PRIMARY KEY,
Data_Criacao DATETIME,
CPF VARCHAR(11)
)

CREATE TABLE Categoria (
Nome_categoria VARCHAR(50),
Id_categoria VARCHAR(10) PRIMARY KEY
)

CREATE TABLE Produto (
Id_produto VARCHAR(10) PRIMARY KEY,
Nome_produto VARCHAR(10),
Qtd_estoque INTEGER,
preco DECIMAL( 10,2),
Id_categoria VARCHAR(10),
FOREIGN KEY(Id_categoria) REFERENCES Categoria (Id_categoria)
)

CREATE TABLE Fornecedor (
Nome_fornecedor VARCHAR(10),
CNPJ VARCHAR(14) PRIMARY KEY
)

CREATE TABLE Pagamento (
Id_pagamento VARCHAR(10) PRIMARY KEY,
Forma_pagamento VARCHAR(10)
)

CREATE TABLE Pedido (
Id_pedido VARCHAR(10) PRIMARY KEY,
Valor_total DECIMAL(10,2 ),
Data_pedido DATETIME,
Id_vendedor VARCHAR(10),
Id_pagamento VARCHAR(10),
Id_Endereco INTEGER,
Id_carrinho VARCHAR(10),
FOREIGN KEY(Id_pagamento) REFERENCES Pagamento (Id_pagamento)
)

CREATE TABLE Vendedor (
Id_vendedor VARCHAR(10) PRIMARY KEY,
Nome_vendedor VARCHAR(10)
)

CREATE TABLE Carrinho (
Qtd_produto INTEGER,
Id_carrinho VARCHAR(10) PRIMARY KEY,
Data_carrinho DATETIME,
CPF VARCHAR(11)
)

CREATE TABLE Cliente (
Nome VARCHAR(10),
Email VARCHAR(100),
Data_Nascimento DATETIME,
Senha VARCHAR(255),
Sexo VARCHAR(10),
Telefone VARCHAR(10),
CPF VARCHAR(11) PRIMARY KEY
)

CREATE TABLE Endereco (
Rua VARCHAR(55),
Bairro VARCHAR(55),
Cidade VARCHAR(100),
Estado VARCHAR(2),
Id_Endereco INTEGER PRIMARY KEY,
Cep VARCHAR(9),
CPF VARCHAR(11),
FOREIGN KEY(CPF) REFERENCES Cliente (CPF)
)

CREATE TABLE Contém (
Id_pedido VARCHAR(10),
Id_produto VARCHAR(10),
Qtd_produto INTEGER,
PRIMARY KEY(Id_pedido,Id_produto),
FOREIGN KEY(Id_pedido) REFERENCES Pedido (Id_pedido),
FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
)

CREATE TABLE Fornece (
CNPJ VARCHAR(14),
Id_produto VARCHAR(10),
PRIMARY KEY(CNPJ,Id_produto),
FOREIGN KEY(CNPJ) REFERENCES Fornecedor (CNPJ),
FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
)

ALTER TABLE Lista_Favoritos ADD FOREIGN KEY(CPF) REFERENCES Cliente (CPF)
ALTER TABLE Pedido ADD FOREIGN KEY(Id_vendedor) REFERENCES Vendedor (Id_vendedor)
ALTER TABLE Pedido ADD FOREIGN KEY(Id_Endereco) REFERENCES Endereco (Id_Endereco)
ALTER TABLE Pedido ADD FOREIGN KEY(Id_carrinho) REFERENCES Carrinho (Id_carrinho)
ALTER TABLE Carrinho ADD FOREIGN KEY(CPF) REFERENCES Cliente (CPF)

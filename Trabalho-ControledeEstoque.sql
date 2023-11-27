create database ControleEstoque;

use ControleEstoque;

-- Criação dos usúarios 

create user 'admin'@3306 identified by "888" ;
grant all privileges on ControleEstoque.* to 'admin'@3306;

create user 'comprador'@3306 identified by "999" ;
create user 'comprador'@3306 identified by "878" ;

-- Criação das tabelas

-- Tabela Produtos
create table Produtos(
id_produto tinyint auto_increment primary key ,
Nome_produto varchar(266),
Descricao text ,
Preco_unitario decimal(10,2)
);

-- Seleção de todas as colunas da tabela Produtos 
select * from Produtos;


create table EntradaProdutos(
id_entrada tinyint auto_increment primary key,
id_produto tinyint ,
quantidade mediumint,
data_entrada date,
foreign key (id_produto) references Produtos(id_produto) 
);

-- Seleção de todas as colunas da tabela EntradaProdutos
select * from EntradaProdutos;


create table SaidaProdutos(
id_saida tinyint auto_increment primary key,
id_produto tinyint ,
quantidade mediumint,
data_saida date,
foreign key (id_produto) references Produtos(id_produto) 
);

-- Seleção de todas as colunas da tabela SaidaProdutos
select * from SaidaProdutos;



-- Inserção de valores dentro da tabela Produtos , Usando o Create da sigla C.R.U.D

insert into Produtos(nome_produto,descricao,preco_unitario) values ("A riquesa das nações","livro feito pelo iluminista Adam Smith",800.90);
insert into Produtos(nome_produto,descricao,preco_unitario) values ("Dom Quixote","livro escrito por Miguel de Cervantes",120.90);
insert into Produtos(nome_produto,descricao,preco_unitario) values ("O apanhador no campo de centeio","livro escrito por J.K Salinger",43.80);
insert into Produtos(nome_produto,descricao,preco_unitario) values ("A Biblioteca da Meia-Noite","livro escrito por Matt Haig , versão capa mole ",29.90),
("Os miseráveis","livro escrito por  Victor Hugo , versão em capa dura ",66.98),
("Admirável mundo novo","livro escrito por  Aldous Leonard Huxley , versão em capa dura ",76.00),
("Box O castelo animado","livros escritos por Diana Wynne Jones , box com livros com capa mole ",79.92),
 ("Box Clássicos de William Shakespeare","livros escritos por William Shakespeare  , box com livros com capa mole ", 64.90),
("Kit Cidade dos Fantasmas","livros escritos por  V. E. Schwab  , box com livros com capa mole ", 68.77),
("A revolta de Atlas - Edição Luxo ","livros escritos por   Ayn Rand  , box com livros com capa mole ", 80.66);

 
 -- Inserção de valores dentro da tabela EntradaProdutos , Usando o Create da sigla C.R.U.D
 
 insert into EntradaProdutos(id_produto,quantidade,data_entrada) values (1,100,"2023-11-21");
 insert into EntradaProdutos(id_produto,quantidade,data_entrada) values (2,300,"2023-10-23");
 insert into EntradaProdutos(id_produto,quantidade,data_entrada) values (3,480,"2023-11-11");
 insert into EntradaProdutos(id_produto,quantidade,data_entrada) values (4,690,"2023-11-09"),
(5,330,"2023-11-01"),
(6,260,"2023-11-08"),
(7,430,"2023-11-02"),
(8,230,"2023-11-18"),
(9,410,"2023-11-16"),
(10,710,"2023-11-17");

 -- Inserção de valores dentro da tabela SaidaProdutos , Usando o Create da sigla C.R.U.D
 
 insert into SaidaProdutos(id_produto,quantidade,data_saida) values (1,20,"2023-11-21");
 insert into SaidaProdutos(id_produto,quantidade,data_saida) values (2,30,"2023-10-23");
 insert into SaidaProdutos(id_produto,quantidade,data_saida) values (3,48,"2023-11-11");
 insert into SaidaProdutos(id_produto,quantidade,data_saida) values (4,69,"2023-11-09"),
(5,33,"2023-11-01"),
(6,20,"2023-11-08"),
(7,40,"2023-11-02"),
(8,23,"2023-11-18"),
(9,41,"2023-11-16"),
(10,71,"2023-11-17");


SELECT distinct
       p.id_produto                             "Produto",
       p.Nome_produto                           "Descricao",
       p.Preco_unitario                         "Preço Unit.",
       (select sum(e.quantidade) 
       from Entradaprodutos e
       where e.id_produto = p.id_produto)       "Entradas",
       (select sum(s.quantidade) 
       from Saidaprodutos s
       where s.id_produto = p.id_produto)       "Saidas",
       ( (select sum(e.quantidade) 
          from Entradaprodutos e
          where e.id_produto = p.id_produto) - 
         (select sum(s.quantidade) 
          from Saidaprodutos s
          where s.id_produto = p.id_produto))   "Saldo em Estoque"       
FROM Produtos p;
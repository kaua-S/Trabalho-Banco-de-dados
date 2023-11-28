
/*Criação do Banco de Dados ControleEstoque*/
create database ControleEstoque;

/*Usando o comando use para identificar o banco que vai ser utilizado*/
use ControleEstoque;

-- Criação dos usúarios 

create user 'admin'@localhost identified by "888" ;
grant all privileges on ControleEstoque.* to 'admin'@3306;

create user 'comprador'@localhost  identified by "999" ;
create user 'comprador2'@localhost  identified by "878" ;

-- Criação das tabelas

-- Tabela Produtos que possui a chave primaria id_produto
create table Produtos(
id_produto tinyint auto_increment primary key ,
Nome_produto varchar(266),
Descricao text ,
Preco_unitario decimal(10,2)
);

-- Seleção de todas as colunas da tabela Produtos 
select * from Produtos;

-- Tabela  EntradaProdutos que possui a chave primaria id_entrada , e tem o relacionamento com a tabela Produtos através da chave estrangeira  id_produto

create table EntradaProdutos(
id_entrada tinyint auto_increment primary key,
id_produto tinyint ,
quantidade mediumint,
data_entrada date,
foreign key (id_produto) references Produtos(id_produto) 
);

-- Seleção de todas as colunas da tabela EntradaProdutos
select * from EntradaProdutos;

-- Tabela SaidaProdutos que possui a chave primaria id_saida , e tem o relacionamento com a tabela Produtos através da chave estrangeira id_produto

create table SaidaProdutos(
id_saida tinyint auto_increment primary key,
id_produto tinyint ,
quantidade mediumint,
data_saida date,
foreign key (id_produto) references Produtos(id_produto) 
);



-- Seleção de todas as colunas da tabela SaidaProdutos
select * from SaidaProdutos;

 /*Executando comandos INSERT para adicionar novos produtos, operações de
entrada e saída*/


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

-- Seleção de todas as colunas da tabela EntradaProdutos
select * from EntradaProdutos;

-- Seleção de todas as colunas da tabela SaidaProdutos
select * from SaidaProdutos;

/*Utilizando comandos UPDATE para modificar a quantidade em estoque de
um produto.*/

-- modificando a quantidade de produtos na tabela EntradaProdutos 
update  EntradaProdutos set quantidade = "323" where id_produto = 2 limit 1;
update  EntradaProdutos set quantidade = "683" where id_produto = 3 limit 1;

-- modificando a quantidade de produtos na tabela SaidaProdutos

update  SaidaProdutos set quantidade = "33" where id_produto = 2 limit 1;
update  SaidaProdutos set quantidade = "68" where id_produto = 3 limit 1;

-- alterando a chave estrangeira para deletar o produto com id_produto = 1 

alter table entradaprodutos drop foreign key entradaprodutos_ibfk_1;
ALTER TABLE entradaprodutos
ADD CONSTRAINT fk_entradaprodutos
FOREIGN KEY foreign_key_name(id_produto)
REFERENCES produtos(id_produto)
ON DELETE CASCADE;

-- alterando a chave estrangeira para deletar o produto com id_produto = 1 

alter table saidaprodutos drop foreign key saidaprodutos_ibfk_1;
ALTER TABLE saidaprodutos
ADD CONSTRAINT fk_saidaprodutos
FOREIGN KEY foreign_key_name(id_produto)
REFERENCES produtos(id_produto)
ON DELETE CASCADE;


-- Executando o comando DELETE para remover registros
delete from Produtos where Preco_unitario >= 800 limit 1;

-- Seleção de todas as colunas da tabela SaidaProdutos

select * from saidaprodutos;

-- Seleção de todas as colunas da tabela EntradaProdutos

select * from entradaprodutos;

-- Seleção de todas as colunas da tabela Produtos

select * from Produtos;

/* Selecione todos os produtos em estoque  

Listando as operações de entrada em um determinado período

Mostrando as operações de saída de um produto específico

Calculando o saldo atual de cada produto  */ 

SELECT DISTINCT
    p.id_produto 'Produto',
    p.Nome_produto 'Descricao',
    p.Preco_unitario 'Preço Unit.',
    (SELECT 
            SUM(E.Quantidade)
        FROM
            Entradaprodutos e
        WHERE
            e.Id_produto = p.Id_produto) 'Entradas',
    (SELECT 
            SUM(S.Quantidade)
        FROM
            Saidaprodutos s
        WHERE
            s.Id_produto = p.Id_produto) 'Saidas',
    ((SELECT 
            SUM(E.Quantidade)
        FROM
            Entradaprodutos e
        WHERE
            e.Id_produto = p.Id_produto) - (SELECT 
            SUM(s.Quantidade)
        FROM
            Saidaprodutos s
        WHERE
            s.Id_produto = p.Id_produto)) 'Saldo em Estoque'
FROM
    Produtos p 
    
    

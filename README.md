# Trabalho-Banco-de-dados

*** Documentação ***


-- Problemas na fabricação do código :

- Realização do delet para eliminar o produto com Preco_produto = 1 , 
devido ao efeito cascada que as tabelas compartilhavam entre si ,
sendo resolvido ao se comunicar com o professor que demontrou 
a resolução do problema 


** Conclusões **

-- Como conclusão de tal trabalho gerado , tem se que ao aprofundar tais conhecimentos sobre o o MySql
foi possível criar novas possibilidades dentro do codigo , que elevou e refiniou o mesmo , entretanto ,
com tal ação se teve como consequência os erros dentro da aplicação , erros como a não realização do 
delet dentro da tabela produtos , devido a mesma ser considerada como uma tabela pai devido a sua re
lação com as tabelas Entrada_produto e Saida_produto que possuem como "conector parental "  a chave 
estrangeira id_produto . Tal erro foi resolvido atraves da auxílio do professor Marcio que demonstrou
o codigo que deveria ser aplicado para levar a conclusão e finalização do problema discrimante que 
havia dentro da query em que se estava codando.

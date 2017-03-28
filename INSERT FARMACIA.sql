DECLARE @id_usuario				INT,
		@nome					VARCHAR(250),
		@sexo					CHAR(1),
		@dt_nascimento			DATE,
		@telefone				VARCHAR(16),
		@email					VARCHAR(250),
		@senha					VARCHAR(250),
		@id_carrinho			INT,
		@sessao					VARCHAR(200),
		@id_categoria			INT,
		@nome_categoria			VARCHAR(250),
		@idendereco				INT,
		@endereco				VARCHAR(250),
		@numero					INT,
		@complemento			VARCHAR(250),
		@bairro					VARCHAR(250),
		@cidade					VARCHAR(250),
		@estado					VARCHAR(250),
		@ednprincipal			CHAR(1),
		@id_fabricante			INT,
		@nome_fabricante		VARCHAR(250),
		@idvenda				INT,
		@dtvenda				DATE,
		@statusvenda			VARCHAR(1),
		@valortotal				FLOAT,
		@id_pagamento			INT,
		@tipo					varchar(1),
		@numcartao				varchar(100),
		@numboleto				varchar(100),
		@valor					float,
		@id_produto				INT,
		@nome_produto			VARCHAR(250),
		@preco_produto			FLOAT,
		@quantidade				INT,
		@valor_prod_carrinh		INT,
		@id_produtovenda			INT,
		@quantidade_prod_venda	INT,
		@valorunit_prod_venda	FLOAT,
		@valortotal_prod_venda	FLOAT,
		@desconto_prod_venda	FLOAT,
		@idreceitamedica		INT,
		@crm					VARCHAR(250),
		@numero_receita			INT,
		--@imagem					TEXT,
		@id_endereco			int,
		@id_Fabrincante			INT,
		@id_receitamedica		INT,
		@id_produto_carrinho	INT,
		@id_venda				INT


--SET @imagem = '0'
--SET @id_carrinho	= 1
--SET @id_categoria	= 1
--SET @id_fabricante	= 1
--SET @id_pagamento	= 1
--SET @id_produto		= 1
--SET @id_usuario		= 1
--SET @id_carrinho	= 1
--SET @id_Categoria	= 1
--SET @id_endereco	= 1
--SET @id_Fabrincante = 1
--SET @id_receitamedica = 1
--SET @id_produto_carrinho =1
--SET @id_venda	= 1
--SET @sessao = 1
--set @id_produtovenda = 1


set @quantidade = 99
SET @preco_produto = 15
SET @valorunit_prod_venda = 15
SET @quantidade_prod_venda = 5




SELECT TOP 1 @id_usuario = ISNULL(idusuario+1,1) FROM USUARIO ORDER BY idusuario DESC
SET @nome			= 'Teste'+CONVERT(char(1),@id_usuario)
SET @sexo			= 'M'
SET @dt_nascimento	= '1990-02-01'
SET	@telefone		= '4699375869'
SET @email			= 'teste'+CONVERT(char(1),@id_usuario)+'@hotmail.com'
SET @senha			= 'teste'+CONVERT(char(1),@id_usuario)
SELECT TOP 1 @id_carrinho = ISNULL(idcarrinho+1,1) FROM CARRINHO order by idcarrinho desc
SELECT TOP 1 @sessao = ISNULL(sessao+1,1) FROM CARRINHO order by sessao desc
SELECT TOP 1 @id_Categoria = ISNULL(idCategoria+1,1) FROM Categoria order by idCategoria desc
SET @nome_categoria = 'Teste'+CONVERT(char(1),@id_usuario)
SELECT TOP 1 @idendereco = ISNULL(idendereco+1,1) FROM ENDERECO order by idendereco desc
SET @endereco = 'END TESTE'+CONVERT(char(1),@id_usuario)
SET @numero	= 000+@id_usuario
SET @complemento = 'APT 6012'+CONVERT(char(1),@id_usuario)
SELECT TOP 1 @id_Fabrincante = ISNULL(idFabrincante+1,1) FROM Fabricante order by idFabrincante desc
SET @nome_fabricante = 'FABRICANTE TESTE'+CONVERT(char(1),@id_Fabrincante)
SELECT TOP 1 @id_venda = ISNULL(idvenda+1,1) FROM Venda order by idvenda desc
SELECT TOP 1 @id_pagamento = ISNULL(idpagamento+1,1) FROM PAGAMENTO order by idpagamento desc
SELECT TOP 1 @id_Produto = ISNULL(idProduto+1,1) FROM Produto order by idProduto desc
SET @nome_produto = 'PRODUTO '+CONVERT(char(1),@id_Produto)
set @quantidade = @quantidade+1
SELECT TOP 1 @id_receitamedica = ISNULL(idreceitamedica+1,1) FROM RECEITA_MEDICA order by idreceitamedica desc
SELECT TOP 1 @id_produto_carrinho = ISNULL(idproduto_carrinho+1,1) FROM PRODUTO_CARRINHO order by idproduto_carrinho desc
SELECT TOP 1 @id_produtovenda = ISNULL(idprodutovenda+1,1) FROM PRODUTO_VENDA order by idprodutovenda desc
SELECT TOP 1 @id_carrinho = idcarrinho+1 FROM CARRINHO order by idcarrinho desc
SELECT TOP 1 @id_endereco = idendereco+1 FROM ENDERECO order by idendereco desc
SELECT @quantidade_prod_venda = quantidade FROM PRODUTO_CARRINHO WHERE idcarrinho = @id_carrinho
SET @valortotal_prod_venda = @preco_produto*@quantidade_prod_venda
select @valortotal_prod_venda




INSERT INTO USUARIO VALUES (@id_usuario,@nome,@sexo,@dt_nascimento,@telefone,@email,@senha)
INSERT INTO CARRINHO VALUES (@id_carrinho,@id_usuario,@sessao)
INSERT INTO Categoria VALUES (@id_Categoria,@nome_categoria)
INSERT INTO ENDERECO VALUES (@id_endereco,@id_usuario,@endereco,@numero,@complemento,'testes 2','PATO BRANCO','PR','S')
INSERT INTO Fabricante VALUES (@id_Fabrincante,@nome_fabricante)
INSERT INTO Produto VALUES (@id_Produto,@id_Categoria,@id_Fabrincante,@nome_produto,@preco_produto)
INSERT INTO VENDA VALUES (@id_venda,@id_usuario,'2017-03-27','B',@valortotal_prod_venda)
INSERT INTO PAGAMENTO VALUES (@id_pagamento,@id_venda,'2','1234565570145','14785239741250003014',@valortotal_prod_venda)
INSERT INTO PRODUTO_CARRINHO VALUES (@id_produto_carrinho,@id_carrinho,@id_produto,@quantidade,@valortotal_prod_venda)
INSERT INTO PRODUTO_VENDA VALUES (@id_produtovenda,@id_venda,@id_produto,@quantidade,@valorunit_prod_venda,@valortotal_prod_venda,0)
INSERT INTO RECEITA_MEDICA VALUES (@id_receitamedica,@id_venda,'547T9TT9',305,'0')





select *  from CARRINHO
select *  from USUARIO
select *  from Categoria
select *  from ENDERECO
select *  from Fabricante
select *  from PAGAMENTO
select *  from Produto
select *  from PRODUTO_CARRINHO
select *  from PRODUTO_VENDA
select *  from RECEITA_MEDICA
select *  from VENDA

/*
delete from CARRINHO
delete from USUARIO
delete from Categoria
delete from ENDERECO
delete from Fabricante
delete from PAGAMENTO
delete from Produto
delete from PRODUTO_CARRINHO
delete from PRODUTO_VENDA
delete from RECEITA_MEDICA
delete from VENDA
*/
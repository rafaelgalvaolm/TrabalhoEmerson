--------------------------------------------SELECT-----------------------------------------------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[SP.SelVenda]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [SP.SelVenda]

GO

CREATE PROCEDURE [SP.SelVenda]
	@id int = NULL,

	AS

	/* Documentação
	Arquivo Fonte..........: venda.sql
	Objetivo...............: Selecionar um ou mais registros da tabela venda
	Autor..................: Rafael Galvão
	Data...................: 23/01/2023
	Ex.....................: EXEC [SP.SelVenda] @id = 1
	*/

	BEGIN

    

		SELECT id, 
			   funcionario_id, 
			   produto_id,
			   data_venda
			FROM dbo.venda
			WHERE id = COALESCE(@id, id)
    
	END
GO

---------------------------------------------INSERT-----------------------------------------------------------------------------------------

 IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[SP.InsVenda]') AND objectproperty(ID,'isProcedure') = 1)
		DROP PROCEDURE [SP.InsVenda]

GO

CREATE PROCEDURE [SP.InsVenda]
	@funcionario_id        int,
	@produto_id			   int,
	@data_venda            datetime,
    @preco                 decimal(7,2)

	AS

	/* Documentação
	Arquivo Fonte ........: Venda.sql
	Objetivo..............: Inserir um ou mais dados dentro da tabela venda
	Autor.................: Rafael Galvão
	Data..................: 23/01/2023
	EX....................:  EXEC [SP.InsVenda] @funcionario_id = 3, @produto_id = 23, @data_venda = '20230113 20:00:56'
	código de retorno.....: 0 - Execução OK
                            1 - Execução Falhou
	*/

	BEGIN

		INSERT INTO dbo.venda (funcionario_id, produto_id, data_venda, preco)
			VALUES (@funcionario_id, @produto_id, @data_venda, @preco)

		IF @@ERROR <> 0
			RETURN 1

		RETURN 0
	END

GO

---------------------------------------------UPDATE-----------------------------------------------------------------------------------------
 
 IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[SP.UpVenda]') AND objectproperty(ID,'isProcedure') = 1)
		DROP PROCEDURE [SP.UpVenda]

 GO

 CREATE PROCEDURE [SP.UpVenda]

	@id                    int,
	@funcionario_id        int,
	@produto_id			   int,
	@data_venda            datetime
    @preco                 decimal(7,2)
	
	AS

        /* Documentação
        Arquivo Fonte ......: Venda.sql
        Objetivo ...........: Atualizar um ou mais registros na tabela venda
        Autor ..............: Rafael Galvão
        Data ...............: 23/01/2023
        Ex .................: EXEC [SP.UpVenda] @id = 10, @funcionario_id = 5, @produto_id = 40, @data_venda = '20230110 13:12:32', @preco = 3457,40
        Códigos de retorno: 0 - excução ok
                            1 - id não encontrado
        */

	BEGIN		

		UPDATE dbo.venda
		SET  funcionario_id = @funcionario_id,
			 produto_id = @produto_id,
			 data_venda = @data_venda,
             preco = @preco
	   WHERE id = @id

	IF @@ROWCOUNT = 0
		RETURN 1

		RETURN 0 
	END
GO

--------------------------------------------DELETE-----------------------------------------------------------------------------------------
 
 IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[SP.DelVenda]') AND objectproperty(ID,'isProcedure') = 1)
		DROP PROCEDURE [SP.DelVenda]

GO

	CREATE PROCEDURE [SP.DelVenda]
		@id			        int,
        @funcionario_id     int,
        @produto_id         int

	AS

    /* Documentação
    Arquivo Fonte...........: Venda.sql
    Objetivo................: Deletar um registro da tabela venda
    Autor...................: Rafael Galvão
    Data....................: 23/01/2023
    Ex......................: declare @cod int 
                            EXEC @cod = [SP.DelVenda] @id = 1
                            select @cod
        Código de Retorno:  0 - Execuçao OK
                            1 - id não encontrado
                            2 - esse id esta sendo mencionado na tabela Funcionario
                            3 - esse id esta sendo mencionado na tabela Produto
    */	


	BEGIN
		DECLARE @DATEINT DATETIME = GETDATE()
		DELETE FROM dbo.venda
			WHERE id = @id

		IF @@ROWCOUNT = 0
				 RETURN 1

        ELSE IF @funcionario_id EXISTS 
                 RETURN 2

        ELSE IF @produto_id EXISTS
                 RETURN 3

        ELSE

		RETURN DATEDIFF(MILLISECOND, @DATEINT, GETDATE())

		END
	GO


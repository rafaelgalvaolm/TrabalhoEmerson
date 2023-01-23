IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[SP.sales_performance_report]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [SP.sales_performance_report]

GO

CREATE PROCEDURE [SP.sales_performance_report]
    (@data_inicial DATE,
     @data_final DATE)
AS

	/* Documentação
	Arquivo Fonte..........: venda.sql
	Objetivo...............: Criará um relatório para mostrar o desempenho de vendas agrupado por categoria de produto e por funcionário
	Autor..................: Rafael Galvão
	Data...................: 23/01/2023
	Ex.....................: EXEC [SP.sales_performance_report] @data_inicial = '20200101', @data_final = '20200301'
	*/

BEGIN
    DECLARE @comissao = 0.4
    

    CREATE TABLE #sales_performance (
        funcionario_id INT,
        nome_funcionario VARCHAR(100),
        categoria_id INT,
        nome_categoria VARCHAR(50),
        total_vendas DECIMAL(7, 2),
        comissao DECIMAL(7, 2)
    )
    
    INSERT INTO #sales_performance 
     SELECT
        v.funcionario_id,
        f.nome,
        p.categoria_id,
        c.nome,
        SUM(p.preco) AS total_vendas,
        SUM(p.preco) * @comissao AS comissao
    FROM venda v
        INNER JOIN funcionario f 
            ON v.funcionario_id = f.id
        INNER JOIN produto p 
            ON v.produto_id = p.id
        INNER JOIN categoria c 
            ON p.categoria_id = c.id
        WHERE v.data_venda BETWEEN @data_inicial AND @data_final
            GROUP BY v.funcionario_id, f.nome, p.categoria_id, c.nome


    SELECT * FROM #sales_performance
END
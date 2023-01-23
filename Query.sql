SELECT c.nome as Cliente, p.preco as Valor_do_Pedido FROM cliente c
    INNER JOIN pedido p 
        ON p.cliente_id = c.id
WHERE p.data_pedido BETWEEN '20200101' AND '20200201' 

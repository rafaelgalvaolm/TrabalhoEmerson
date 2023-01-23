INSERT INTO cliente (nome, telefone) VALUES 
('João Silva', '1234567890'), 
('Maria Silva', '0987654321'),
('Carlos Oliveira', '5555555555'),
('Ana Paula', '6666666666'),
('Lucas Rodrigues', '7777777777');

INSERT INTO endereco (cliente_id, nome_rua, numero, bairro, cidade, estado) VALUES 
(1, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP'),
(2, 'Rua dos Pássaros', '456', 'Jardim', 'Rio de Janeiro', 'RJ'),
(3, 'Avenida Brasil', '789', 'Bairro', 'Belo Horizonte', 'MG'),
(4, 'Rua das Orquídeas', '321', 'Vila', 'Porto Alegre', 'RS'),
(5, 'Rua dos Coqueiros', '654', 'Praia', 'Recife', 'PE');

INSERT INTO funcionario (nome, data_contrato, salario) VALUES 
('Fernanda Souza', '20200101', '2000.00'),
('Lucas Almeida', '20200201', '3000.00'),
('Mateus Costa', '20200301', '2500.00'),
('Isabela Oliveira', '20200401', '3500.00'),
('Eduardo Silva', '20200501', '4500.00');

INSERT INTO categoria (nome) VALUES 
('Eletrônicos'),
('Livros'),
('Esportes'),
('Moda'),
('Jogos');

INSERT INTO produto (categoria_id, nome, descricao, preco) VALUES 
(1, 'Celular', 'Celular top de linha', '2000.00'),
(2, 'Livro de Ciência', 'Livro de ciência para estudantes', '50.00'),
(3, 'Bola de Futebol', 'Bola de futebol oficial', '100.00'),
(4, 'Camiseta', 'Camiseta de algodão', '30.00'),
(5, 'Jogo de tabuleiro', 'Jogo de tabuleiro para família', '70.00');

INSERT INTO venda (funcionario_id, produto_id, data_venda, preco) VALUES 
(1, 1, '20200101 12:00:00','2000.00'),
(2, 2, '20200201 13:00:00','50.00'),
(3, 3, '20200301 14:00:00','100.00'),
(4, 4, '20200401 15:00:00','30.00'),
(5, 5, '20200501 16:00:00','70.00');

INSERT INTO pedido (cliente_id, produto_id, data_pedido, quantidade, preco) VALUES 
(1, 1, '20200101', 2, '4000.00'),
(2, 2, '20200201', 1, '50.00'),
(3, 3, '20200301', 5, '500.00'),
(4, 4, '20200401', 3, '90.00'),
(5, 5, '20200501', 1, '70.00');
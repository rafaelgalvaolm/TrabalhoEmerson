Copy code
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
('Fernanda Souza', '2020-01-01', '2000.00'),
('Lucas Almeida', '2020-02-01', '3000.00'),
('Mateus Costa', '2020-03-01', '2500.00'),
('Isabela Oliveira', '2020-04-01', '3500.00'),
('Eduardo Silva', '2020-05-01', '4500.00');

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

INSERT INTO venda (funcionario_id, produto_id, data_venda) VALUES 
(1, 1, '2020-01-01 12:00:00'),
(2, 2, '2020-02-01 13:00:00'),
(3, 3, '2020-03-01 14:00:00'),
(4, 4, '2020-04-01 15:00:00'),
(5, 5, '2020-05-01 16:00:00');

INSERT INTO pedido (cliente_id, produto_id, data_pedido, quantidade, preco) VALUES 
(1, 1, '2020-01-01', 2, '4000.00'),
(2, 2, '2020-02-01', 1, '50.00'),
(3, 3, '2020-03-01', 5, '500.00'),
(4, 4, '2020-04-01', 3, '90.00'),
(5, 5, '2020-05-01', 1, '70.00');
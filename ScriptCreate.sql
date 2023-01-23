CREATE TABLE IF NOT EXISTS cliente(
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL, 
    endereco VARCHAR(80) NOT NULL, 
    telefone VARCHAR(12) NOT NULL, 
);

CREATE TABLE IF NOT EXISTS funcionario( 
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL, 
    data_contrato DATE NOT NULL,
    salario DECIMAL(6,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria( 
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto( 
    id INT PRIMARY KEY IDENTITY(1,1),
    categoria_id INT NOT NULL, 
    nome VARCHAR(60) NOT NULL, 
    descricao VARCHAR(240) NOT NULL,
    preco DECIMAL(7,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS venda( 
    id INT PRIMARY KEY IDENTITY(1,1),
    funcionario_id INT NOT NULL, 
    produto_id INT NOT NULL, 
    data_venda DATETIME NOT NULL, 
); 

CREATE TABLE IF NOT EXISTS pedido( 
    id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT NOT NULL, 
    produto_id INT NOT NULL, 
    data_pedido DATE NOT NULL, 
    quantidade INT NOT NULL, 
    preco DECIMAL(7,2) NOT NULL
);
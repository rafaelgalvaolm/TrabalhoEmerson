--CREATE DATABASE Emerson;
--use Emerson;

CREATE TABLE cliente(
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL, 
    telefone BIGINT NOT NULL, 
);

CREATE TABLE endereco(
    id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT NOT NULL,
    nome_rua VARCHAR(80) NOT NULL, 
    numero SMALLINT,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    estado CHAR(2) NOT NULL,
    CONSTRAINT fk_cliente_id1 FOREIGN KEY (cliente_id) 
        REFERENCES cliente (id)
);

CREATE TABLE funcionario( 
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL, 
    data_contrato DATE NOT NULL,
    salario DECIMAL(6,2) NOT NULL
);

CREATE TABLE categoria( 
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produto( 
    id INT PRIMARY KEY IDENTITY(1,1),
    categoria_id INT NOT NULL, 
    nome VARCHAR(60) NOT NULL, 
    descricao VARCHAR(240) NOT NULL,
    preco DECIMAL(7,2) NOT NULL
    CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id)
        REFERENCES categoria(id)
);

CREATE TABLE venda( 
    id INT PRIMARY KEY IDENTITY(1,1),
    funcionario_id INT NOT NULL, 
    produto_id INT NOT NULL, 
    data_venda DATETIME NOT NULL,
    preco DECIMAL(7,2) NOT NULL,
    CONSTRAINT fk_funcionario_id  FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id),
    CONSTRAINT fk_produto_id FOREIGN KEY (produto_id)
        REFERENCES produto(id) 
); 

CREATE TABLE pedido( 
    id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT NOT NULL, 
    produto_id INT NOT NULL, 
    data_pedido DATE NOT NULL, 
    quantidade INT NOT NULL, 
    preco DECIMAL(7,2) NOT NULL
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id)
        REFERENCES cliente(id),
    CONSTRAINT fk_produto_id1 FOREIGN KEY (produto_id)
        REFERENCES produto(id)
);
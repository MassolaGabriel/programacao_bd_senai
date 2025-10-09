create database senai;
use senai;

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE
);


INSERT INTO produto (nome, descricao, preco, quantidade_estoque)
VALUES
('Mouse Gamer', 'Mouse óptico com LED RGB', 129.90, 50),
('Teclado Mecânico', 'Teclado com switches azuis e iluminação RGB', 299.00, 25),
('Monitor 24"', 'Monitor LED Full HD com 75Hz', 899.90, 15),
('Cadeira Ergonômica', 'Cadeira com apoio loprodutoprodutombar e regulagem de altura', 699.00, 10),
('Headset Gamer', 'Headset estéreo com microfone e cancelamento de ruído', 199.90, 30),
('Webcam HD', 'Câmera USB com resolução 1080p', 249.90, 18),
('Pen Drive 64GB', 'Pen Drive USB 3.0 com alta velocidade', 79.90, 40),
('HD Externo 1TB', 'Disco rígido externo USB 3.0', 429.00, 12),
('Notebook 15.6"', 'Notebook Intel i5, 8GB RAM, SSD 512GB', 3499.00, 8),
('Suporte para Monitor', 'Suporte ajustável em altura para monitores até 27"', 159.00, 20);
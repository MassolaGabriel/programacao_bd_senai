-- ===============================
-- Tabela: fornecedores_insumos
-- ===============================
INSERT INTO fornecedores_insumos (nome, contato, telefone) VALUES
('AgroFert Ltda', 'João Silva', '(11) 99999-1111'),
('Defensivos Brasil', 'Maria Oliveira', '(21) 98888-2222'),
('Sementes do Futuro', 'Carlos Pereira', '(31) 97777-3333'),
('AgroMaster Insumos', 'Fernanda Costa', '(41) 96666-4444'),
('BioAgroTech', 'Ricardo Lima', '(51) 95555-5555');

-- ===============================
-- Tabela: insumos
-- ===============================
INSERT INTO insumos (nome, tipo, unidade_medida, custo_unitario) VALUES
('Adubo NPK 10-10-10', 'fertilizante', 'kg', 120.50),
('Herbicida XPlus', 'defensivo', 'litro', 85.75),
('Sementes de Milho Híbrido', 'semente', 'saco', 250.00),
('Fungicida ProAgro', 'defensivo', 'litro', 95.30),
('Calcário Agrícola', 'outros', 'kg', 45.20);

-- ===============================
-- Tabela: culturas
-- ===============================
INSERT INTO culturas (nome_cultura, tempo_colheita_dias, condicoes_ideais) VALUES
('Milho', 120, 'Clima quente, solo fértil e boa irrigação'),
('Soja', 110, 'Temperatura moderada, solo bem drenado'),
('Trigo', 130, 'Clima frio, solo argiloso'),
('Café', 180, 'Altitude elevada, clima tropical úmido'),
('Algodão', 150, 'Clima seco, solos profundos e férteis');

-- ===============================
-- Tabela: aquipamentos
-- ===============================
INSERT INTO aquipamentos (nome, tipo, data_aquisicao, status) VALUES
('Trator Massey Ferguson', 'Trator', '2022-03-15', 'ativo'),
('Colheitadeira John Deere', 'Colheitadeira', '2021-07-20', 'manutencao'),
('Pulverizador Automático', 'Pulverizador', '2023-05-10', 'ativo'),
('Semeadora de Precisão', 'Semeadora', '2020-09-05', 'inativo'),
('Grade Aradora', 'Implemento', '2022-11-12', 'ativo');

-- ===============================
-- Tabela: funcionarios
-- ===============================
INSERT INTO funcionarios (nome, funcao, salario, data_contratacao) VALUES
('Pedro Henrique', 'Agrônomo', 5500.00, '2021-01-10'),
('Ana Beatriz', 'Técnica Agrícola', 3200.00, '2022-04-18'),
('Lucas Almeida', 'Operador de Máquinas', 2800.00, '2020-08-05'),
('Juliana Rocha', 'Engenheira Agrícola', 6200.00, '2019-11-22'),
('Marcos Paulo', 'Auxiliar de Campo', 2200.00, '2023-06-30');

-- ===============================
-- Tabela: lotes_plantio
-- ===============================
INSERT INTO lotes_plantio (fk_cultura, area_plantada_m2, data_plantio, data_colheita_prevista, observacoes) VALUES
(1, 5000.00, '2024-01-15', '2024-05-15', 'Milho safra verão'),
(2, 4200.00, '2024-02-10', '2024-06-01', 'Soja em área irrigada'),
(3, 3800.00, '2024-03-01', '2024-07-10', 'Trigo de inverno'),
(4, 2500.00, '2024-04-20', '2024-10-17', 'Plantio de café experimental'),
(5, 4600.00, '2024-05-05', '2024-09-30', 'Algodão safra especial');

-- ===============================
-- Tabela: estoque_geral
-- ===============================
INSERT INTO estoque_geral (fk_item_tipo, fk_item_id, quantidade) VALUES
('insumo', 1, 1500.000),
('insumo', 2, 500.000),
('insumo', 3, 200.000),
('insumo', 4, 300.000),
('produto_colhido', 1, 1200.000);

-- ===============================
-- Tabela: movimentacao_estoque
-- ===============================
INSERT INTO movimentacao_estoque (fk_estoque, tipo_mov, quantidade, data_mov, referencia) VALUES
(1, 'entrada', 500.000, '2024-02-01 08:30:00', 'Compra fornecedor AgroFert'),
(2, 'saida', 100.000, '2024-02-05 10:00:00', 'Aplicação no lote 1'),
(3, 'entrada', 50.000, '2024-02-10 09:15:00', 'Compra Sementes do Futuro'),
(4, 'saida', 80.000, '2024-02-12 14:40:00', 'Uso no lote 2'),
(5, 'ajuste', 20.000, '2024-02-15 16:00:00', 'Ajuste inventário');


-- ===============================
-- Tabela: receitas_aplicacao
-- ===============================
INSERT INTO receitas_aplicacao (fk_cultura, fk_insumo, quantidade_por_m2, frequencia_dias) VALUES
(1, 1, 0.050, 30),   -- Milho com Adubo NPK
(2, 2, 0.010, 20),   -- Soja com Herbicida XPlus
(3, 3, 0.200, 90),   -- Trigo com Sementes de Milho Híbrido (exemplo de rotação)
(4, 4, 0.015, 25),   -- Café com Fungicida ProAgro
(5, 5, 0.080, 60);   -- Algodão com Calcário Agrícola
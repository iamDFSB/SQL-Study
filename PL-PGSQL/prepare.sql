-- 1. Cria a instrução preparada
PREPARE pedido_por_id (int) AS
    SELECT * FROM pedidos WHERE id = $1;

-- 2. Executa passando o parâmetro
EXECUTE pedido_por_id(10);
-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
	clientes (nome, lealdade)
VALUES
	('Georgia', 0);


-- 2)
INSERT INTO
	pedidos (status, cliente_id)
VALUES
	('Recebido', 6);


-- 3)
INSERT INTO
	produtos_pedidos (pedido_id, produto_id)
VALUES
	(6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);


-- Leitura

-- 1)
SELECT
	c.*,
    p.*,
    prod.*
 FROM 
 	clientes c
 JOIN
 	pedidos p ON p.cliente_id = c.id
 JOIN
 	produtos_pedidos pp ON pp.pedido_id = p.id
 JOIN
 	produtos prod ON prod.id = pp.produto_id
 WHERE
 	c.nome = 'Georgia';


-- Atualização

-- 1)
UPDATE
	clientes C
 SET
  	lealdade = 
    (SELECT
     	SUM(pts_de_lealdade) 
      FROM
     	produtos prod
      JOIN
     	produtos_pedidos pp ON pp.produto_id = prod.id
      JOIN
     	pedidos p ON p.id = pp.pedido_id
      JOIN
     	clientes c ON c.id = p.cliente_id
      WHERE 
 		c.nome = 'Georgia')
 WHERE
 	c.nome = 'Georgia';

-- Deleção

-- 1)
DELETE FROM
    clientes  
  WHERE 
    nome = 'Marcelo' RETURNING *;


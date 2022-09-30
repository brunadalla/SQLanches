-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
	ped.*,
	prod.*
 FROM
 	pedidos ped
 JOIN 
 	produtos_pedidos pp ON pp.pedido_id = ped.id
 JOIN
 	produtos prod ON prod.id = pp.produto_id;

-- 2)
SELECT
	ped.id
 FROM
 	pedidos ped
 JOIN 
 	produtos_pedidos pp ON pp.pedido_id = ped.id
 JOIN
 	produtos prod ON prod.id = pp.produto_id
 WHERE
 	prod.nome = 'Fritas';'

-- 3)
SELECT
	c.nome gostam_de_fritas
 FROM
 	clientes c
 JOIN 
 	pedidos p ON p.cliente_id = c.id
 JOIN
 	produtos_pedidos pp ON pp.pedido_id = p.id
 JOIN
 	produtos prod ON prod.id = pp.produto_id
 WHERE
 	prod.nome = 'Fritas';

-- 4)
SELECT
	SUM(preco)
 FROM
 	produtos prod
 JOIN
 	produtos_pedidos pp ON pp.produto_id = prod.id
 JOIN
 	pedidos p ON p.id = pp.pedido_id
 JOIN
 	clientes c ON c.id = p.cliente_id
 WHERE
 	c.nome = 'Laura';

-- 5)
SELECT
	prod.nome,
    COUNT(*)
 FROM
 	produtos prod
 JOIN
 	produtos_pedidos pp ON pp.produto_id = prod.id
 GROUP BY
 	prod.nome
 ORDER BY
 	prod.nome;
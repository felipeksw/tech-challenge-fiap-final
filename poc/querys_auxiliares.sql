-- Resumo do Pedido
SELECT
o.id pedido_id, o.client cliente_name, o.customer_id cliente_id, p.description produto, oi.additional_info extra_info, p.price preco, oi.quantity quantidade, (oi.quantity * p.price) valor
FROM
	tech_challenge.orders o,
	tech_challenge.orderitems oi,
	tech_challenge.products p
where
	o.id = oi.order_id
	and p.id = oi.product_id
	and o.id = :pedido_id
UNION ALL
SELECT
oi.order_id pedido_id, NULL cliente_name, NULL cliente_id, NULL produto, 'VALOR TOTAL' extra_info, NULL preco, NULL quantidade, sum(oi.quantity * p.price) valor
FROM
	tech_challenge.orderitems oi,
	tech_challenge.products p
where
	p.id = oi.product_id
	and oi.order_id  = :pedido_id

-- Itens RAW de um Pedido
SELECT
	*
FROM
	tech_challenge.orderitems
where
	order_id = :order_id;

-- Valor total de um Pedido
SELECT
	sum(oi.quantity * p.price) valor
FROM
	tech_challenge.orderitems oi,
	tech_challenge.products p
where
	p.id = oi.product_id
	and oi.order_id  = :order_id;
-- ORDER BY id OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
-- where rownum <= 5
-- 1.1 Listar os nomes completos dos clientes atendidos pelo vendedor “Michael Blythe”.
SELECT cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto 
FROM cliente 
JOIN pedido
ON cliente.codigo = pedido.codigocliente
JOIN (
    SELECT codigo, primeironome ||' '|| nomedomeio ||' '|| sobrenome as nomevendedor 
    FROM vendedor
) vend
ON pedido.codigovendedor = vend.codigo
WHERE vend.nomevendedor LIKE '%Michael%Blythe%' 
AND rownum <=5;

-- 1.2 Listar o número de clientes atendidos pelo vendedor “Jillian Carson”.
SELECT count(distinct cliente.codigo) "Clientes Atendidos"
FROM cliente 
JOIN pedido
ON cliente.codigo = pedido.codigocliente
JOIN (
    SELECT codigo, primeironome ||' '|| nomedomeio ||' '|| sobrenome as nomevendedor 
    FROM vendedor
) vend
ON pedido.codigovendedor = vend.codigo
WHERE vend.nomevendedor LIKE '%Jillian%Carson%'
AND rownum <=5; 

-- 1.3 Listar o código, nome e quantidade de entregas realizadas por cada transportadora.
SELECT transportadora.codigo, transportadora.nome, count(pedido.codigo) "Qtd Entregas"
FROM transportadora, pedido
WHERE transportadora.codigo = pedido.codigotransportadora
GROUP BY transportadora.codigo, transportadora.nome;

-- 1.4 Listar o código, nome e preço do produto mais caro.
SELECT produto.codigo, produto.nome, produto.preco 
FROM produto, (SELECT MAX(preco) as max_preco from produto) prod
where produto.preco = prod.max_preco;

-- 1.5 Listar o valor total de compras realizadas pela cliente “Jasmine E Clark”.
SELECT SUM((detalhespedido.precounitario*detalhespedido.quantidade)-detalhespedido.desconto) as totalcomprado
FROM detalhespedido
JOIN (
    SELECT pedido.codigo as cod, cli.nomecompleto as n
    FROM pedido
    JOIN (
        SELECT cliente.codigo as cod, cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto
        FROM cliente
    ) cli
    ON pedido.codigocliente = cli.cod
    WHERE cli.nomecompleto like '%Jasmine%E%Clark%'
) pedi
ON detalhespedido.codigopedido = pedi.cod;


-- 1.6 Listar o código e o nome completo de todos os vendedores que não realizaram nenhuma venda.
SELECT vendedor.codigo, vendedor.primeironome ||' '|| vendedor.nomedomeio ||' '|| vendedor.sobrenome as nomecompleto
FROM vendedor
LEFT JOIN pedido
ON vendedor.codigo=pedido.codigovendedor
WHERE pedido.codigovendedor IS NULL;

-- 1.7 Para os modelos de produtos que possuem descrição em mais de um idioma, listar o nome do modelo,
-- a descrição e o idioma.
SELECT modelo.nome, descricao.descricao, idioma.nome
FROM modelo, descricao, idioma
WHERE modelo.codigo = descricao.codigomodelo
AND descricao.siglaidioma = idioma.sigla
AND modelo.codigo IN (
    SELECT descricao.codigomodelo
    FROM descricao
    WHERE descricao.codigomodelo IS NOT NULL
    GROUP BY descricao.codigomodelo 
    HAVING count(*)>1
)
AND rownum <=5;


-- 1.8 Para os clientes que já fizeram ao menos 15 pedidos, listar o nome completo e a quantidade de compras
-- realizadas ordenada de forma decrescente.
SELECT cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto, ped.qtd 
FROM cliente
JOIN (
    SELECT pedido.codigocliente as cod, count(*) as qtd
    FROM pedido
    WHERE pedido.codigocliente IS NOT NULL
    GROUP BY pedido.codigocliente
    HAVING count(*) >= 15
) ped
ON cliente.codigo = ped.cod
WHERE rownum <=5
ORDER BY ped.qtd DESC
;


-- 1.9 Para os clientes que compraram algum dos produtos da seguinte lista (“Road-250 Red, 58”, “Touring-1000
-- Yellow, 50”, “Men s Bib-Shorts, S”), listar a data dos pedidos, os seus nomes, o endereço de entrega, o nome
-- do produto e a quantidade comprada.

SELECT pedido.dtpedido "Data Pedido", 
cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome "Nome Cliente", 
endereco.logradouro "Endereco", 
dt.n "Produto", 
dt.qtd "Quantidade"
FROM pedido
JOIN (
    SELECT detalhespedido.codigopedido as ped, detalhespedido.codigoproduto as pro, detalhespedido.quantidade as qtd, produto.nome as n
    FROM detalhespedido, produto
    WHERE detalhespedido.codigoproduto = produto.codigo
    AND (produto.nome like '%Road-250%Red,%58%' OR produto.nome like '%Touring-1000%Yellow,%50%' OR produto.nome like '%Men%s%Bib-Shorts,%S%')
) dt
ON pedido.codigo = dt.ped
JOIN endereco 
ON pedido.enderecoentrega = endereco.id
JOIN cliente
ON pedido.codigocliente = cliente.codigo
WHERE rownum <=5;


-- 1.10 Listar os produtos comprados (código, nome e preço) pelo cliente “Marshall M Shen” no ano de 2007.
SELECT produto.codigo, produto.nome, produto.preco
FROM produto
JOIN (
    SELECT detalhespedido.codigopedido, detalhespedido.codigoproduto as codprod, detalhespedido.precounitario
    FROM detalhespedido
    JOIN(
        SELECT pedido.codigo as cod, pedido.dtpedido, cli.nomecompleto
        FROM pedido
        JOIN (
            SELECT cliente.codigo as cod, cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto
            FROM cliente
        ) cli
        ON cli.cod = pedido.codigocliente
        WHERE pedido.dtpedido > '31/12/2006 23:59:59'
        AND pedido.dtpedido < '01/01/2008 00:00:00' 
        AND cli.nomecompleto like '%Marshal%M%Shen%'
    ) ped
    ON ped.cod = detalhespedido.codigopedido
) det
ON produto.codigo = det.codprod
WHERE rownum <=5
GROUP BY produto.codigo, produto.nome, produto.preco;

-- 1.11 Listar o nome e o preço do produto mais comprado pela cliente “Jennifer Taylor”, e a quantidade de vezes
-- em que foi comprado.
SELECT *
FROM (
    SELECT produto.nome, produto.preco, count(*) contador
    FROM produto
    JOIN (
        SELECT detalhespedido.codigopedido, detalhespedido.codigoproduto as codprod, detalhespedido.precounitario
        FROM detalhespedido
        JOIN(
            SELECT pedido.codigo as cod, cli.nomecompleto
            FROM pedido
            JOIN (
                SELECT cliente.codigo as cod, cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto
                FROM cliente
            ) cli
            ON cli.cod = pedido.codigocliente
            WHERE cli.nomecompleto like '%Jennifer%Taylor%'
        ) ped
        ON ped.cod = detalhespedido.codigopedido
    ) det
    ON produto.codigo = det.codprod
    GROUP BY produto.codigo, produto.nome, produto.preco
    ORDER BY contador DESC
)
WHERE ROWNUM = 1
;

-- 1.12 Para os pedidos em que o endereço de fatura é diferente do endereço de entrega, listar o nome completo do
-- cliente que recebeu o pedido, mas não realizou o pedido.

SELECT cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome "Nome Cliente"
FROM cliente, (
    SELECT PEDIDO.CODIGO, pedido.codigocliente, clienteendereco.codigocliente as codcli
    FROM PEDIDO
    JOIN clienteendereco
    ON clienteendereco.codigocliente != pedido.codigocliente
    AND clienteendereco.idendereco = pedido.enderecoentrega
    WHERE pedido.enderecoentrega != pedido.enderecofatura
) cli
WHERE cliente.codigo = cli.codcli
AND rownum <=5;

-- 1.13 Listar o nome completo, a quota definida e o total de vendas dos vendedores que atingiram sua quota de
-- vendas no primeiro bimestre (janeiro e fevereiro) de 2006.
SELECT vendedor.primeironome ||' '|| vendedor.nomedomeio ||' '|| vendedor.sobrenome "Nome Vendedor",
vendedor.quota,
r.totalvenda
FROM vendedor
JOIN (
    Select v.codvend as codvend, sum(v.totalvenda) as totalvenda
    From (
        SELECT ped.cod as cod, ped.codvend as codvend, sum((detalhespedido.precounitario*detalhespedido.quantidade)-detalhespedido.desconto) totalvenda
        FROM detalhespedido
        JOIN (
            SELECT pedido.codigo as cod, pedido.codigovendedor as codvend
            FROM pedido
            WHERE pedido.dtpedido > '31/12/2005 23:59:59'
            AND pedido.dtpedido < '01/03/2006 00:00:00'
            AND pedido.codigovendedor IS NOT NULL
        ) ped
        ON detalhespedido.codigopedido = ped.cod
        GROUP BY ped.codvend, ped.cod
    ) v
    GROUP BY v.codvend
) r
ON vendedor.codigo = r.codvend
WHERE r.totalvenda >= vendedor.quota
AND rownum <=5;


-- 1.14 Para os clientes que compraram a mesma quantidade de produtos, listar seus nomes completos, o código
-- de seus pedidos e a quantidade de itens comprados.
SELECT cli.nomecompleto, pedido.codigo, cli.quantidade, sum(detalhespedido.quantidade) as quantidadepedido
FROM pedido, detalhespedido, (
    SELECT cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto,
    det.codcli as codcli,
    det.quantidade as quantidade
    FROM cliente, (
        SELECT pedido.codigocliente as codcli, sum(detalhespedido.quantidade) as quantidade
        FROM pedido, detalhespedido
        Where pedido.codigo = detalhespedido.codigopedido
        group by pedido.codigocliente
    ) det      
    WHERE cliente.codigo = det.codcli
    AND det.quantidade IN (SELECT det.quantidade
            FROM (
                SELECT pedido.codigocliente as codcli, sum(detalhespedido.quantidade) as quantidade
                FROM pedido, detalhespedido
                Where pedido.codigo = detalhespedido.codigopedido
                group by pedido.codigocliente
            ) det
    GROUP BY det.quantidade
    HAVING count(*)>1)
) cli
WHERE pedido.codigocliente = cli.codcli
AND pedido.codigo = detalhespedido.codigopedido
GROUP BY cli.nomecompleto, pedido.codigo, cli.quantidade
ORDER BY cli.nomecompleto asc
FETCH FIRST 5 ROWS ONLY
;


-- 1.15 Listar todos os clientes que também compraram todos os produtos comprados pelo cliente “Lucas B
-- Ross”.

Select ocli.codcli, ocli.nomecompleto
from pedido, (
    Select cliente.codigo as codcli, cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto
    from cliente
) ocli
Where ocli.codcli = pedido.codigocliente
AND ocli.nomecompleto NOT LIKE '%Lucas%B%Ross%'
AND pedido.codigo IN (
    Select detalhespedido.codigopedido
    from detalhespedido
    where detalhespedido.codigoproduto IN (
        Select detalhespedido.codigoproduto
        from detalhespedido, (
            Select pedido.codigo as codped
            from pedido, (
                Select cliente.codigo as codcli, cliente.primeironome ||' '|| cliente.nomedomeio ||' '|| cliente.sobrenome as nomecompleto
                from cliente
            ) cli
            where pedido.codigocliente = cli.codcli
            AND cli.nomecompleto like '%Lucas%B%Ross'
        ) ped
        Where detalhespedido.codigopedido = ped.codped 
    ))
ORDER BY ocli.nomecompleto;
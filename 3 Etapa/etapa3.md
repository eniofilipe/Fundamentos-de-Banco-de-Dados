<div class="logo-if">
  <img src="iflogo.png"/>
</div>
<div class="title">

# Etapa 3 - Projeto de Curso

## Ênio Filipe Miranda Souza

### Ciência da Computação

### Fundamento de Banco de Dados

Revisão do modelo de esquema relacional e normalização do esquema relacional

Links relacionados ao trabalho:

<a href="https://github.com/eniofilipe/Fundamentos-de-Banco-de-Dados/tree/master/3%20Etapa">Repositório da etapa 3 com o mapeamento feito passo-a-passo.</a>

</div>
<div class="page"/>

## 1 - Conjunto de Relações do Banco de Dados

### 1.1 - Produto

<table >
<tbody>
    <tr >
    <td colspan=7>PRODUTO (<u>COD</u>, NOME*, PRECO, CUSTO_PRODUCAO, DT_IN_VENDA, DT_FI_VENDA, <span class="fk">COD_MODELO* </span>)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> NOME </br>
      (COD) -> PRECO </br>
      (COD) -> CUSTO_PRODUCAO </br>
      (COD) -> DT_IN_VENDA </br>
      (COD) -> DT_FI_VENDA </br>
      (COD) -> COD_MODELO </br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  
  </tbody>
</table>

</br>

### 1.2 - Modelo

<table >
<tbody>
    <tr >
    <td colspan=7>MODELO (<u>COD</u>, NOME, COR, TAMANHO, PESO, LOCAL_FABRICACAO)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> NOME</br>
(COD) -> COR</br>
(COD) -> TAMANHO</br>
(COD) -> PESO</br>
(COD) -> LOCAL_FABRICACAO</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.3 - Descricao

<table >
<tbody>
    <tr >
    <td colspan=7>DESCRICAO ( <u>COD</u>, TEXTO*, <span class="fk pk">COD_MODELO</span> )
</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
(COD, COD_MODELO) -> TEXTO</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

<div class="page"/>

### 1.4 - Idioma

<table >
<tbody>
    <tr >
    <td colspan=7>IDIOMA (<u>IDIOMA</u>, <span class="fk pk">COD_DESCRICAO</span>)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD_DESCRICAO) -> IDIOMA
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.5 - Pertence

<table >
<tbody>
    <tr >
    <td colspan=7>PERTENCE (<span class="fk pk">COD_PRODUTO</span>,<span class="fk pk"> COD_CATEGORIA</span>)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD_PRODUTO) -> COD_CATEGORIA
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.6 - Categoria

<table >
<tbody>
    <tr >
    <td colspan=7>CATEGORIA (<u>COD</u>, NOME*, <span class="fk">COD_SUBCATEGORIA</span>)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> NOME</br>
(COD) -> COD_SUBCATEGORIA</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.7 - Item

<table >
<tbody>
    <tr >
    <td colspan=7>ITEM ( <span class="fk pk">COD_PRODUTO</span>, <span class="fk pk">COD_PEDIDO</span>, PRECO_VENDA, DESCONTO, QUANTIDADE )</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD_PRODUTO, COD_PEDIDO) -> PRECO_VENDA</br>
(COD_PRODUTO, COD_PEDIDO) -> DESCONTO</br>
(COD_PRODUTO, COD_PEDIDO) -> QUANTIDADE</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.8 - Transportadora

<table >
<tbody>
    <tr >
    <td colspan=7>TRANSPORTADORA (<u>COD</u>, NOME*, TAXA_MIN*, TAXA_PRODUTO*)
</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> NOME</br>
(COD) -> TAXA_MIN</br>
(COD) -> TAXA_PRODUTO</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.9 - Funcionario

<table >
<tbody>
    <tr >
    <td colspan=7>FUNCIONARIO ( <u>COD</u>, NOME, DT_CONTRATO*, DT_NASCIMENTO, GENERO)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> NOME</br>
(COD) -> DT_CONTRATO</br>
(COD) -> DT_NASCIMENTO</br>
(COD) -> GENERO</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.10 - Senha

<table >
<tbody>
    <tr >
    <td colspan=7>SENHA ( <u>COD</u>, SENHA*, <span class="fk">COD_FUNCIONARIO*</span>)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> SENHA</br>
(COD) -> COD_FUNCIONARIO</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

<div class="page"/>

### 1.11 - Conec_Vendas

<table >
<tbody>
    <tr >
    <td colspan=7>CONEC_VENDAS ( <u>COD</u>, BONUS , COMISSAO, <span class="fk sk">COD_FUNCIONARIO</span>, <span class="fk sk">COD_SENHA</span> )</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD_FUNCIONARIO, COD_SENHA) ->  BONUS </br>
(COD_FUNCIONARIO, COD_SENHA) -> COMISSAO</br>
(COD) -> COD_FUNCIONARIO</br>
(COD) -> COD_SENHA</br>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✖</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✖</td>
    <td>BCNA ✖</td>
    <td>4 FN ✖</td>
  </tr>
  <tr >
    <td colspan=7>
    CONEC_VENDAS ( <u>COD</u> <span class="fk sk">COD_FUNCIONARIO</span>, <span class="fk sk">COD_SENHA</span> )</br>
    CONEC_VENDAS_FUNC (<span class="fk pk">COD_FUNCIONARIO</span>, <span class="fk pk">COD_SENHA</span>, BONUS , COMISSAO) </br>

</td>
  </tr>
  </tbody>
</table>

</br>

### 1.12 - Cliente

<table >
<tbody>
    <tr >
    <td colspan=7>CLIENTE (<u>CADASTRO</u>, PRIMEIRO_NOME*, NOME_MEIO*, SOBRENOME*, SENHA*, TRATAMENTO)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (CADASTRO) -> PRIMEIRO_NOME</br>
(CADASTRO) -> NOME_MEIO</br>
(CADASTRO) -> SOBRENOME</br>
(CADASTRO) -> SENHA</br>
(CADASTRO) -> TRATAMENTO</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.13 - Endereco

<table >
<tbody>
    <tr >
    <td colspan=7>ENDERECO ( <u>COD</u>, RUA*, NUMERO*, CIDADE*, ESTADO*, PAIS*, CEP*)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> RUA</br>
(COD) -> NUMERO</br>
(COD) -> CIDADE</br>
(COD) -> ESTADO</br>
(COD) -> PAIS</br>
(COD) -> CEP</br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.14 - Cliente_Tem_Endereco

<table >
<tbody>
    <tr >
    <td colspan=7>CLIENTE_TEM_ENDERECO (<span class="fk pk">COD_CLIENTE</span>, <span class="fk pk">COD_ENDERECO</span>)</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD_CLIENTE) -> COD_ENDERECO
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✔</td>
    <td>2 FN G ✔</td>
    <td>3 FN G ✔</td>
    <td>BCNA ✔</td>
    <td>4 FN ✔</td>
  </tr>
  </tbody>
</table>

</br>

### 1.15 - Pedido

<table >
<tbody>
    <tr >
    <td colspan=7>PEDIDO ( <u>COD</u>, TOTAL, IMPOSTO, CONTA_CLIENTE, COD_CARTAO, COD_TRANSACAO, DT_EFETIVADO, DT_ENVIO, DT_ENTREGA, MERCADO*, DESCONTO_FRETE, IMPOSTO_EUROPEU, <span class="fk">COD_CLIENTE*</span>, <span class="fk">COD_TRANSPORTADORA*</span>, <span class="fk">COD_CONEC_VENDAS</span>, <span class="fk">COD_END_ENTREGA*</span>, <span class="fk">COD_END_COBRANCA*</span>)
</td>
  </tr>
  <tr >
    <td colspan=7>
    <p>
      (COD) -> TOTAL</br>
(COD) -> IMPOSTO</br>
(COD_CLIENTE) -> CONTA_CLIENTE</br>
(COD_CLIENTE) -> COD_CARTAO</br>
(COD) -> COD_TRANSACAO</br>
(COD) -> DT_EFETIVADO</br>
(COD, COD_TRANSPORTADORA, COD_END_ENTREGA) -> DT_ENVIO</br>
(COD, COD_TRANSPORTADORA, COD_END_ENTREGA) -> DT_ENTREGA</br>
(COD) -> MERCADO</br>
(COD, MERCADO, TOTAL) -> DESCONTO_FRETE</br>
(COD, MERCADO, TOTAL) -> IMPOSTO_EUROPEU</br>
(COD) -> COD_CLIENTE</br>
(COD) -> COD_CONEC_VENDAS</br>
(COD_CLIENTE, COD_CARTAO) -> COD_END_COBRANCA </br>
      </p>
    </td>
  </tr>
  <tr >
    <td>1 FN ✔</td>
    <td>2 FN ✔</td>
    <td>3 FN ✖</td>
    <td>2 FN G ✖</td>
    <td>3 FN G ✖</td>
    <td>BCNA ✖</td>
    <td>4 FN ✖</td>
  </tr>
  <tr >
    <td colspan=7>
    PEDIDO ( <u>COD</u>, IMPOSTO, COD_TRANSACAO, DT_EFETIVADO, <span class="fk">COD_CLIENTE*</span>,  <span class="fk">COD_CONEC_VENDAS</span>)</br>
PEDIDO_CLIENTE ( <u>COD_CLIENTE</u>, <u>COD_CARTAO</u>, <span class="fk">COD_END_COBRANCA\*</span> )</br>
CONTA_CLIENTE ( <u>COD_CLIENTE</u>, <u>CONTA_CLIENTE</u>)</br>
ENTREGA_PEDIDO (<u>COD</u>, <span class="fk pk">COD_TRANSPOSRTADORA</span>, <span class="fk pk">COD_END_ENTREGA</span>, DT_ENVIO, DT_ENTREGA)</br>
PEDIDO_MERCADO ( <u>COD</u>, <u>MERCADO</u>, <u>TOTAL</u>, DESCONTO_FRETE, IMPOSTO_EUROPEU )</br>
</td>
  </tr>
  </tbody>
</table>

</br>

<div class="page"/>

## 2 - DER Corrigido revisado

<img class="mapeamento-final" src="DER_Corrigido_2.png"/>

<div class="page"/>

## 3 - Mapeamento esquema relacional revisado

<img class="mapeamento-final" src="Final_11.svg"/>

<div class="page"/>

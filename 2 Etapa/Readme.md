# Etapa 2 - Projeto de Curso

Nessa etapa, mapeamos o Diagrama Entidade-Relacionamento Estendido, construído a partir de um mundo proposto pela disciplina Fundamento de Banco de Dados na Etapa 1, para Modelo Relacional.

Utilizando metodologia proposta pelo professor Lúcio, que constitui em 7 passos de mapeamento:

1. Conjunto de Entidades

2. Conjunto de Entidades Fracas

   2.1 Conjunto Abstrações de Generalização

   2.2 Conjunto Abstrações de Agregação

3. Conjunto de Relacionamentos binários 1:1

4. Conjunto de Relacionamentos binários 1:N

5. Conjunto de Relacionamentos binários M:N

6. Conjunto de Relacionamentos >2

7. Atributos Multivalorados

<hr/>

## Ferramentas utilizadas

- [Draw.io VS Code Integration](https://github.com/hediet/vscode-drawio.git)

<hr/>

## 1 - Conjunto de Entidades

### 1.1 - Produto

<u>Descrição:</u> Representa cada produto e suas características de comercialização.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do produto</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NOME</td>
    <td style="border: 1px solid black;">Nome do produto</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >CUSTO_PRODUCAO</td>
    <td style="border: 1px solid black;">Custo de produção do produto</td>
    <td style="border: 1px solid black;">FLOAT >= 0, representação de ponto flutuante maior ou igual a 0, podendo ser restringido a 3 ou 2 casas decimais</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >PRECO</td>
    <td style="border: 1px solid black;">Preço do produto</td>
    <td style="border: 1px solid black;">FLOAT >= 0, valor em ponto flutuante maior ou igual a 0, podendo ser restringido a 3 ou 2 casas decimais</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >DT_IN_VENDA</td>
    <td style="border: 1px solid black;">Data de início de venda do produto</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >DT_FI_VENDA</td>
    <td style="border: 1px solid black;">Data de fim de venda do produto</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
</table>

### 1.2 - Modelo

<u>Descrição:</u> Representa o modelo a ser seguido por determinado produto, especificando seus atributos específicos.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NOME</td>
    <td style="border: 1px solid black;">Nome do modelo</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >COR</td>
    <td style="border: 1px solid black;">Decreve a cor referente ao modelo</td>
    <td style="border: 1px solid black;">VARCHAR(20) cadeia de caracteres com no máximo 20 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >TAM</td>
    <td style="border: 1px solid black;">Descreve o tamanho em milímetros referente ao modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0 número inteiro maior que 0</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >PESO</td>
    <td style="border: 1px solid black;">Descreve o peso em gramas referente ao modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número inteiro maior que 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >LOCAL_FABRICACAO</td>
    <td style="border: 1px solid black;">Decreve o local de fabricação do modelo</td>
    <td style="border: 1px solid black;">VARCHAR(10) cadeia de caracteres com no máximo 10 caracteres, restrito à "ASIA", "AMERICA", "EUROPA", "OCEANIA" ou "AFRICA"</td>
  </tr>
</table>

### 1.3 - Descrição

<u>Descrição:</u> Representa a descrição de cada modelo, podendo ser em vários idiomas.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação da descrição</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >TEXTO</td>
    <td style="border: 1px solid black;">Conteúdo da descrição</td>
    <td style="border: 1px solid black;">VARCHAR(300) cadeia de caracteres com no máximo 300 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >IDIOMA</td>
    <td style="border: 1px solid black;">Descreve um ou mais idiomas em que a descrição pode ser vista pelo usuário.</td>
    <td style="border: 1px solid black;">CHAR(2) cadeia de caracteres com 2 caracteres</td>
  </tr>  
</table>

### 1.4 - Categoria

<u>Descrição:</u> Representa categorias em que os produtos podem pertencer e serem organizados.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação da categoria</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">NOME</td>
    <td style="border: 1px solid black;">Nome da categoria</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
</table>

### 1.5 - Transportadora

<u>Descrição:</u> Representa as transportadoras que podem fazer entregas das vendas aos clientes.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NOME</td>
    <td style="border: 1px solid black;">Nome da transportadora</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >TAXA_MIN</td>
    <td style="border: 1px solid black;">Decreve o valor mínimo de total de venda para que a transportadora esteja apta a entregar a venda.</td>
    <td style="border: 1px solid black;">FLOAT >= 0 valor em ponto flutuante maior ou igual a 0, podendo ser restringido a 2 ou 3 casas decimais </td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >TAXA_PRODUTO</td>
    <td style="border: 1px solid black;">Descreve a taxa que cada transportadora cobra por produto na venda</td>
    <td style="border: 1px solid black;">FLOAT >= 0 valor em ponto flutuante maior ou igual a 0, podendo ser restringido a 2 ou 3 casas decimais </td>
  </tr>
</table>

### 1.6 - Funcionário

<u>Descrição:</u> Representa cada funcionário que pode realizar uma venda e seus dados principais.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">GENERO</td>
    <td style="border: 1px solid black;">Descreve o gênero ao qual cada funcionário se identifica</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >DT_CONTR</td>
    <td style="border: 1px solid black;">Descreve a data de contratação do funcionário</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >DT_NASC</td>
    <td style="border: 1px solid black;">Descreve a data de nascimento do funcionário</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
</table>

### 1.7 - Senha

<u>Descrição:</u> Representa as senhas que os funcionários podem ter cadastradas no sistema.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >SENHA</td>
    <td style="border: 1px solid black;">Senha do funcionário</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no mínimo 7 e no máximo 30 caracteres</td>
  </tr>
</table>

### 1.8 - Cliente

<u>Descrição:</u> Representa o cliente que pode fazer compras e seus dados específicos.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>CADASTRO</u></td>
    <td style="border: 1px solid black;">Código de cadastro do cliente</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NOME</td>
    <td style="border: 1px solid black;">Nome do cliente</td>
    <td style="border: 1px solid black;">VARCHAR(70) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >SENHA</td>
    <td style="border: 1px solid black;">Senha do cliente</td>
    <td style="border: 1px solid black;">VARCHAR(30) NOT_NULL cadeia de caracteres com no mínimo 7 e no máximo 30 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >TRATAMENTO</td>
    <td style="border: 1px solid black;">Descreve a forma de tratamento em que o cliente gostaria de ser chamado</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
</table>

### 1.9 - Endereço

<u>Descrição:</u> Representa os endereços dos clientes.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do endereço</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">RUA</td>
    <td style="border: 1px solid black;">Descreve a rua do endereço</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NUMERO</td>
    <td style="border: 1px solid black;">Decreve o número do endereço</td>
    <td style="border: 1px solid black;">INT > 0 valor inteiro maior que 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">CIDADE</td>
    <td style="border: 1px solid black;">Descreve a cidade em que o endereço está</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">ESTADO</td>
    <td style="border: 1px solid black;">Descreve o estado(Unidade Federativa) em que o endereço está</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">PAIS</td>
    <td style="border: 1px solid black;">Descreve o país em que o endereço está</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;">CEP</td>
    <td style="border: 1px solid black;">Descreve o código postal do endereço</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>  
  </tr>
</table>

### 1.10 - Pedido

<u>Descrição:</u> Representa cada pedido que pode ser feito pelo cliente e seus atributos.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do pedido</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >TOTAL</td>
    <td style="border: 1px solid black;">Descreve a soma dos valores dos produtos do pedido</td>
    <td style="border: 1px solid black;">FLOAT >= 0 valor em ponto flutuante maior ou igual a 0, derivado da soma dos preços dos produtos relacionados ao pedido</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >IMPOSTO</td>
    <td style="border: 1px solid black;">Decreve porcentagem de imposto que pode incidir sobre o pedido</td>
    <td style="border: 1px solid black;">FLOAT >= 0 valor em ponto flutuante maior ou igual a 0</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >CONTA_CLIENTE</td>
    <td style="border: 1px solid black;">Descreve a conta do cliente</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >COD_CARTAO</td>
    <td style="border: 1px solid black;">Descreve o código do cartão do cliente</td>
    <td style="border: 1px solid black;">VARCHAR(20)> cadeia de caracteres que representa o código do cartão(16 primeiros caracteres) e a data de expiração(4 ultimos caracteres) ex: "11118888222255550725"</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >COD_TRANSACAO</td>
    <td style="border: 1px solid black;">Descreve o código de transação do pagamento do pedido</td>
    <td style="border: 1px solid black;">STRING</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >DT_EFETIVADO</td>
    <td style="border: 1px solid black;">Descreve a data em que o pedido foi efetivado</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >DT_ENVIO</td>
    <td style="border: 1px solid black;">Descreve a data de envio do pedido</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >DT_ENTREGA</td>
    <td style="border: 1px solid black;">Descreve a data que o pedido foi entregue ao cliente</td>
    <td style="border: 1px solid black;">DATE OU TIMESTAMPS representação de data. Obs.: Salvar no banco com GMT 0</td>
  </tr>
</table>

### 1.2 - Entidade 2

<u>Descrição:</u> Representa o modelo a ser seguido por determinado produto, especificando seus atributos específicos.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NOME</td>
    <td style="border: 1px solid black;">Nome do modelo</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >COR</td>
    <td style="border: 1px solid black;">Decreve a cor referente ao modelo</td>
    <td style="border: 1px solid black;">VARCHAR(20) cadeia de caracteres com no máximo 20 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >TAM</td>
    <td style="border: 1px solid black;">Descreve o tamanho em milímetros referente ao modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0 número inteiro maior que 0</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >PESO</td>
    <td style="border: 1px solid black;">Descreve o peso em gramas referente ao modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número inteiro maior que 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >LOCAL_FABRICACAO</td>
    <td style="border: 1px solid black;">Decreve o local de fabricação do modelo</td>
    <td style="border: 1px solid black;">VARCHAR(10) cadeia de caracteres com no máximo 10 caracteres, restrito à "ASIA", "AMERICA", "EUROPA", "OCEANIA" ou "AFRICA"</td>
  </tr>
</table>

### 1.2 - Entidade 2

<u>Descrição:</u> Representa o modelo a ser seguido por determinado produto, especificando seus atributos específicos.

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
    <tr >
    <td style="border: 1px solid black;" ><u>COD</u></td>
    <td style="border: 1px solid black;">Código de identificação do modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número maior que 0, UNIQUE e NOT_NULL, gerado automaticamente pelo banco</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >NOME</td>
    <td style="border: 1px solid black;">Nome do modelo</td>
    <td style="border: 1px solid black;">VARCHAR(30) cadeia de caracteres com no máximo 30 caracteres</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >COR</td>
    <td style="border: 1px solid black;">Decreve a cor referente ao modelo</td>
    <td style="border: 1px solid black;">VARCHAR(20) cadeia de caracteres com no máximo 20 caracteres</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >TAM</td>
    <td style="border: 1px solid black;">Descreve o tamanho em milímetros referente ao modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0 número inteiro maior que 0</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >PESO</td>
    <td style="border: 1px solid black;">Descreve o peso em gramas referente ao modelo</td>
    <td style="border: 1px solid black;">BIGINT > 0, número inteiro maior que 0</td>
  </tr>
  <tr >
    <td style="border: 1px solid black;" >LOCAL_FABRICACAO</td>
    <td style="border: 1px solid black;">Decreve o local de fabricação do modelo</td>
    <td style="border: 1px solid black;">VARCHAR(10) cadeia de caracteres com no máximo 10 caracteres, restrito à "ASIA", "AMERICA", "EUROPA", "OCEANIA" ou "AFRICA"</td>
  </tr>
</table>

## 2 - Conjunto de Relacionamentos

### 2.1 - Relacionamento

<u>Descrição:</u> Loairoaisjdokasdkjalskjdalksjdalksjdlaksjdlaksjdlakslaksjdlaksjdlaksjdlaksjdlaksjdlaksjdalksdjalksjdalksjd
askaposdasd
asjkdasda
sdjasd
asjdas
dasasdasd

<u>Atributos:</u>

<table style="border: 1px solid black;">
  <tr>
    <th style="border: 1px solid black;" scope="col">Nome</th>
    <th style="border: 1px solid black;" scope="col">Descrição</th>
    <th style="border: 1px solid black;" scope="col">Tipo e formato</th>
    </tr>
  <tr >
    <td style="border: 1px solid black;" >Nome Atributo</td>
    <td style="border: 1px solid black;">Descricao</td>
    <td style="border: 1px solid black;">TIPO cada descricao</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >Nome Atributo</td>
    <td style="border: 1px solid black;">Descricao</td>
    <td style="border: 1px solid black;">TIPO cada descricao</td>
  </tr>
    <tr >
    <td style="border: 1px solid black;" >Nome Atributo</td>
    <td style="border: 1px solid black;">Descricao</td>
    <td style="border: 1px solid black;">TIPO cada descricao</td>
  </tr>
</table>

### 2.2 - Relacionamento 2

<u>Descrição:</u>
Loairoaisjdokasdkj alskjdalksjdalksjd laksjdlaksjdlakslaksjdla ksjdlaksjdlaksj dlaksjdlaks jdalksd jalksjdalksjd
askaposdasd
asjkdasda
sdjasd
asjdas
dasasdasd

<u>Atributos:</u>
Sem Atributos específicos

<br/>

<hr/>

## Mapeamento final em modelo relacional

<img src="Final_10.svg"/>

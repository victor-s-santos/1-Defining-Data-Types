# Tipos de dados no nosso banco
## No momento, temos todos os dados na nossa tabela como tipo Text

# Prejuízos oriundos da má modelagem do banco:
- Não conseguimos utilizar funções matemáticas no nosso select:
    - Exemplo: SELECT MAX("Calories") FROM ...;

- Não conseguimos utilizar ordenações coerentes:
    - Exemplo ... ORDER BY "Calories";

- Entre outros muitos exemplos.

# Como Corrigir:
- Esta seção trás um script sql, dentro do diretório sql, através de 5 etapas, que deverão ser executadas a fim de corrigir o tipo de dados para a coluna Calories. O mesmo procedimento deve ser realizado para as outras colunas que também trazem valores numéricos, mas estão definidos como tipo TEXT.
Os passos a seguir são:
* 1- cria uma nova coluna do tipo integer;
* 2- atualizar a coluna com valores convertidos para integer;
* 3- remover a coluna antiga, e renomear a coluna nova;
* 4- para recuperar a posição, vamos criar outra tabela;
* 5 recuperar o primary key.
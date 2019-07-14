# conversor_de_moedas

App Flutter conversor de moeda.
Fonte dos dados: HG Finance. Disponível em <https://hgbrasil.com/status/finance>

# Algumas explicações

01 É uma função que pra ser executada não trava o fluxo principal do app. Se uma função demora tempo
considerável pra fazer algo, como um download, colocamos dentro de uma função assíncrona pra não travar 
o app. Se colocasse em uma função normal, você não conseguiria nem usar os botões do app enquanto ele 
baixa o arquivo.

02 Como o 'http.get' não retornará os dados na hora,o 'await' serve para esperar esses dados e só depois
a variável 'response' armazena esse dado. Como temos uma variável nesse estilo, utilizamos 'async' na
declaração da função. 
Como se trata de um dado futuro (que ainda vai chegar), utilizamos 'Future<>' na declaração.

03 Como agora temos uma variável de valor JSON, se você fizer teste com o print, vamos ter muitas informações.
Para simplificar, fazemos o seguinte: print(json.decode(response.body)["Results"]["Currencies"]["USD"]).
Nesse caso, temos aí o resultado do valor do Dólar.
Obs.: caso só tenha 'response', não aparecerá o resultado esperado (todo o conteúdo do JSON), só aparecerá
'Instance of Response'. Por isso, utilizamos 'response.body'.

04 Pegamos o valor futuro de 'getData()' e passamos para o 'FutureBuilder'. Ele construirá a tela dependendo
do que tiver em 'getData()', ou seja, se o 'getData()' estiver carregando os dados, eu vou mostrar 'carregando
dados' na tela e se ele já tiver carregado, irá mostrar a tela completa com os dados.

05 'snapshot' é o estado da requisição. Fazemos uma verificação do mesmo através do 'switch' e retornamos
um 'Center()', que é um widget que centraliza um outro widget. Nesse caso, mostraremos uma mensagem
'carregando dados' ou 'erro'.
Obs.: Como parâmetros da função anônima builder, temos o 'context', que é o contexto e o 'snapshot', que
é uma cópia momentânea da informação que recebemos do servidor. 

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

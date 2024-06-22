# Desenvolvendo um Sistema de Banco de Dados para um Hospital

<h2> Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:</h2>

<h3> 🔹Parte 1 - Diagrama Entidade Relacionamento </h3>
O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.

![Diagrama em branco_ Lucidchart - Google Chrome 10_05_2024 23_08_49](https://github.com/DanielFS22/DataBase-Hospital/assets/161477598/04e6c5d7-bac4-4f71-a177-014fd27a40b8)

<h3>🔹Parte 2 - Diagrama Entidade Relacionamento</h3>
No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos.

Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados.

As internações precisam ser vinculadas a quartos, com a numeração e o tipo.

Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).

A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.

Por último, crie um script SQL para a geração do banco de dados
![Diagrama em branco_ Lucidchart e mais 6 páginas - Pessoal — Microsoft​ Edge 20_05_2024 19_34_20](https://github.com/DanielFS22/DataBase-Hospital/assets/161477598/c2456df9-18cd-4350-a9d8-7a6630cb6012)

<h3>🔹Parte 3 - Alimentando o banco de dados </h3>
Crie scripts de povoamento das tabelas desenvolvidas na atividade anterior. Observe as seguintes atividades:

Inclua ao menos dez médicos de
Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastroenterologia e dermatologia”).
Inclua ao menos 15 pacientes.
Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.
Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas.
Criar entidade de relacionamento entre médico e especialidade.
Criar Entidade de Relacionamento entre internação e enfermeiro.
Arrumar a chave estrangeira do relacionamento entre convênio e médico.
Criar entidade entre internação e enfermeiro.
Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).
Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.
Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.
Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.

<h3> 🔹Parte 4 - A Ordem do Alterar </h3>

Pensando no banco que já foi criado para o Projeto do Hospital, realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:
Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 
Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.
![MySQL Workbench 27_05_2024 09_30_20](https://github.com/DanielFS22/DataBase-Hospital/assets/161477598/02facff1-d37c-4b28-b011-933cf54c2652)

<h3> 🔹Parte 5 - As Relíquias dos Dados </h3>

Uma vez que o banco estiver bem estruturado e desenhado, é possível realizar testes, simulando relatórios ou telas que o sistema possa necessitar. A tarefa consiste em criar consultas que levem aos resultados esperados.

<strong>Consultas e Valores Médios: </strong>

Consulta de todos os dados e valor médio das consultas realizadas no ano de 2020.
Consulta de todos os dados e valor médio das consultas realizadas sob convênio.

<strong>Internações com Data de Alta Maior que Prevista: </strong>

Consulta dos dados das internações que tiveram a data de alta maior que a data prevista.

<strong>Receituário da Primeira Consulta com Receituário Associado:</strong>

Consulta do receituário completo da primeira consulta registrada com receituário associado.

<strong>Consulta de Maior e Menor Valor: <strong/>
Consulta dos dados da consulta de maior valor e da consulta de menor valor (ambas não realizadas sob convênio).

<strong>Internações com Detalhes e Total de Internação:</strong>

Consulta dos dados das internações em seus respectivos quartos, incluindo o total da internação baseado no valor da diária do quarto e o número de dias entre a entrada e a alta.

<strong>Internações em Quartos do Tipo "Apartamento":</strong>

Consulta da data, procedimento e número de quarto de internações em quartos do tipo "apartamento".

<strong>Consultas de Menores de 18 Anos com Especialidades Diferentes de Pediatria:</strong>

Consulta do nome do paciente, data da consulta e especialidade de consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não é "pediatria", ordenadas por data de realização da consulta.

<strong>Internações por Médicos da Especialidade "Gastroenterologia" em Enfermarias:</strong>

Consulta do nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade "gastroenterologia", que tenham acontecido em "enfermaria".

<strong>Quantidade de Consultas por Médico:</strong>

Consulta dos nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
<strong>Médicos com "Gabriel" no Nome:</strong>

Consulta dos médicos que têm "Gabriel" no nome.
<strong>Enfermeiros com Mais de Uma Internação:</strong>

Consulta dos nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

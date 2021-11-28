-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 28, 2021 at 05:32 PM
-- Server version: 5.7.32
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `seccim`
--

-- --------------------------------------------------------

--
-- Table structure for table `cronograma`
--

CREATE TABLE `cronograma` (
  `id` int(11) NOT NULL,
  `hora_inicio` varchar(5) NOT NULL,
  `hora_final` varchar(5) NOT NULL,
  `data` varchar(10) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='id_evento => 0=não palestra-minicurso. 1=palestra, 2=minicur';

--
-- Dumping data for table `cronograma`
--

INSERT INTO `cronograma` (`id`, `hora_inicio`, `hora_final`, `data`, `id_evento`, `nome`, `ordem`) VALUES
(1, '08:00', '09:30', '07/10', 11, NULL, 15),
(2, '09:30', '09:50', '*', 0, 'Coffe Break', 1),
(3, '09:50', '12:00', '07/10', 11, NULL, 16),
(4, '12:00', '14:00', '*', 0, 'Almoço', 2),
(5, '14:00', '16:00', '07/10', 10, NULL, 17),
(6, '16:10', '16:25', '*', 0, 'Coffe Break', 3),
(7, '16:25', '18:00', '07/10', 10, NULL, 21),
(8, '14:00', '16:00', '08/10', 13, NULL, 29),
(9, '16:25', '18:00', '08/10', 13, NULL, 32),
(10, '08:00', '09:30', '09/10', 21, NULL, 36),
(11, '09:50', '10:50', '07/10', 0, 'Abertura', 5),
(13, '14:00', '15:00', '07/10', 12, NULL, 18),
(14, '15:10', '16:10', '07/10', 7, NULL, 19),
(15, '09:50', '10:50', '08/10', 8, NULL, 26),
(16, '11:00', '12:00', '08/10', 24, NULL, 28),
(17, '15:10', '16:10', '08/10', 26, NULL, 31),
(18, '16:25', '17:25', '08/10', 9, NULL, 33),
(19, '11:00', '12:00', '10/10', 22, NULL, 46),
(21, '15:10', '16:10', '10/10', 14, NULL, 49),
(23, '09:50', '12:00', '11/10', 15, NULL, 56),
(24, '11:00', '12:00', '11/10', 0, 'Aquecimento para a Maratona', 54),
(26, '14:00', '16:00', '11/10', 0, 'Maratona de Programação', 58),
(27, '16:25', '18:00', '11/10', 0, 'Maratona de Programação', 59),
(29, '10:00', '10:50', '09/10', 17, NULL, 37),
(30, '10:50', '11:40', '09/10', 16, NULL, 38),
(31, '12:30', '13:30', '09/10', 0, 'Almoço', 6),
(32, '14:30', '15:20', '09/10', 20, NULL, 40),
(33, '15:20', '16:10', '09/10', 18, NULL, 41),
(34, '13:40', '14:30', '09/10', 19, NULL, 40),
(35, '17:30', '18:00', '*', 0, 'Encerramento', 4),
(36, '14:00', '16:00', '11/10', 0, 'CineComp: O Jogo da Imitação', 57),
(37, '09:50', '12:00', '08/10', 27, NULL, 27),
(38, '16:25', '17:25', '07/10', 30, NULL, 22),
(39, '14:00', '15:00', '08/10', 28, NULL, 30),
(40, '14:00', '15:00', '10/10', 29, NULL, 48),
(41, '11:40', '12:30', '09/10', 31, NULL, 39),
(42, '11:00', '12:00', '07/10', 32, NULL, 16),
(43, '14:00', '16:00', '10/10', 33, NULL, 48),
(44, '16:25', '18:00', '10/10', 33, NULL, 50),
(45, '09:50', '10:50', '10/10', 34, NULL, 35),
(46, '14:00', '15:00', '11/10', 35, NULL, 57),
(47, '16:25', '17:25', '10/10', 36, NULL, 51);

-- --------------------------------------------------------

--
-- Table structure for table `minicurso_palestra`
--

CREATE TABLE `minicurso_palestra` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `tipo` int(11) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `resumo` varchar(500) DEFAULT NULL,
  `conteudo` longtext NOT NULL,
  `ano` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `colab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `minicurso_palestra`
--

INSERT INTO `minicurso_palestra` (`id`, `titulo`, `tipo`, `foto`, `resumo`, `conteudo`, `ano`, `url`, `colab`) VALUES
(7, 'secDevLabs: Treinando desenvolvedores a programarem de forma segura', 1, 'seguranca.jpg', 'O curso secDevLabs da Globo.com, baseado na lista dos\r\n10 tópicos de segurança que apresentam o maior risco às aplicações web da OWASP,\r\ncontempla um laboratório com aplicações intencionalmente vulneráveis que devem ser\r\nprotegidas.', 'O curso (https://github.com/globocom/secDevLabs) da Globo.com, baseado na lista dos\r\n10 tópicos de segurança que apresentam o maior risco às aplicações web da OWASP,\r\ncontempla um laboratório com aplicações intencionalmente vulneráveis que devem ser\r\nprotegidas. A dinâmica é totalmente hands-on, onde desenvolvedores devem conhecer\r\ncomo cada ataque funciona através de etapas detalhadas em narrativas de ataque e, em\r\nseguida, propor correções através de Pull Requests no repositório.\r\nAo longo da apresentação serão discutidas as razões pelas quais optamos por transferir o\r\nconhecimento em segurança de forma muito mais orgânica e transparente ao torná-lo\r\nmais próximo do cotidiano dos desenvolvedores e como a atividade proporcionou em\r\nparalelo uma oportunidade de aprendizado para o próprio time de segurança.como cada ataque funciona através de etapas detalhadas em narrativas de ataque e, em\r\nseguida, propor correções através de Pull Requests no repositório.\r\nAo longo da apresentação serão discutidas as razões pelas quais optamos por transferir o\r\nconhecimento em segurança de forma muito mais orgânica e transparente ao torná-lo\r\nmais próximo do cotidiano dos desenvolvedores e como a atividade proporcionou em\r\nparalelo uma oportunidade de aprendizado para o próprio time de segurança.', 2019, 'secDevLabs-treinando-desenvolvedores-a-programarem-de-forma-segura', NULL),
(8, 'Conquistas e Desafios em jogos digitais e\r\nrealidade virtual', 1, 'realidade-virtual.jpg', 'Esta palestra irá apresentar os principais desafios atuais na área de jogos digitais e\r\nrealidade virtual. Serão expostos temas relacionados a rendering, inteligencia artificial e\r\ncybersickness, bem como suas implicações nos jogos do futuro.', 'Esta palestra irá apresentar os principais desafios atuais na área de jogos digitais e\r\nrealidade virtual. Serão expostos temas relacionados a rendering, inteligencia artificial e\r\ncybersickness, bem como suas implicações nos jogos do futuro.', 2019, 'conquistas-e-desafios-em-jogos-digitais-e-realidade-virtual', NULL),
(9, 'Engenharia de software, quando usar?', 1, 'scrum.jpg', 'Visamos com essa palestra enfatizar a importância da engenharia de software, com exemplos\r\nreais de projetos desenvolvidos com e sem a sua utilização dentro do globoesporte.com.', 'Visamos com essa palestra enfatizar a importância da engenharia de software, com exemplos\r\nreais de projetos desenvolvidos com e sem a sua utilização dentro do globoesporte.com.\r\nDiscutiremos sobre como diferenciar projetos que chamamos de produtos dos projetos com\r\ntempo de vida curta, e como a engenharia de software se encaixa em cada um desses casos.\r\nFalaremos também sobre como é o ciclo de vida de um projeto dentro de uma redação, da sua\r\nidealização até a sua entrega, e sobre o dia a dia de trabalho ao lado de jornalistas e pessoas não\r\nformadas na nossa área.', 2019, 'engenharia-de-software-quando-usar', NULL),
(10, 'Aprendendo Desenvolvimento Web para Iniciantes: Front-End.', 0, 'dev-web.jpg', 'Neste minicurso iremos ensinar aos alunos a desenvolver suas habilidades com\r\nHTML e CSS, além de ter uma boa base da linguagem de programação Javascript.', 'Neste minicurso iremos ensinar aos alunos a desenvolver suas habilidades com\r\nHTML e CSS, além de ter uma boa base da linguagem de programação Javascript. Já com\r\nrelação ao CSS o aluno verá o framework Bootstrap, necessário para criar layouts de páginas e\r\nsites na web. Iremos também desenvolver um projeto responsivo, ou seja, que funciona bem\r\nem todos os dispositivos, mobiles, tablets e desktop, e por final teremos pequenos passos com\r\nJavascript, linguagem que atualmente é a mais utilizada entre os desenvolvedores web.', 2019, 'aprendendo-desenvolvimento-web-para-iniciantes-front-end', NULL),
(11, 'C Language for Supreme Ninjas - Black Belt', 0, 'programador.jpg', 'A linguagem C, sem dúvida alguma, é a linguagem mais usada em sistemas embarcados.\r\nEntretanto, para programar um sistema embarcado torna-se necessário um bom dominío da\r\nlinguagem.', 'A linguagem C, sem dúvida alguma, é a linguagem mais usada em sistemas embarcados.\r\nEntretanto, para programar um sistema embarcado, por exemplo algum que utilize um System On Chip\r\n(SoC) ou até mesmo um simples Microcontrolador (MCU) torna-se necessário um bom dominío da\r\nlinguagem. Neste minicurso, os alunos terão a oportunidade de conhecer recursos avançados da linguagem\r\nC.', 2019, 'c-language-for-supreme-ninjas', NULL),
(12, 'Internet das coisas - IoT', 1, 'iot.jpg', 'O que saber sobre Internet das coisas além da parte técnica? Quais caminhos\r\ndevemos tomar como estudiosos de tecnologia?', 'A internet vem ganhando protagonismo, na mesma medida em que os avanços\r\ntecnológicos influenciam o cotidiano humano. Em meio a tanta dúvida sobre o futuro e\r\npossibilidades positivas, o próprio Governo brasileiro se prepara para aderir esta nova\r\nideia em território nacional, como plano de Governo.\r\nMas afinal, o que saber sobre Internet das coisas além da parte técnica? Quais caminhos\r\ndevemos tomar como estudiosos de tecnologia?\r\nMuitas reflexões nos direcionam à “modernidade líquida” e suas consequências.', 2019, 'internet-das-coisas-iot', NULL),
(13, 'Desenvolvimento Web para Iniciantes: Back-End (Em PHP)', 0, 'php.jpg', 'Nesse minicurso, pretende-se abordar os principais tópicos do desenvolvimento web\r\ncom a linguagem PHP.', 'Nesse minicurso, pretende-se abordar os principais tópicos do desenvolvimento web\r\ncom a linguagem PHP, começando do básico da linguagem, suas funcionalidades até uso da\r\narquitetura MVC para organizar os projetos com integração com banco de dados.', 2019, 'desenvolvimento-web-para-iniciantes-back-end-em-php', NULL),
(14, 'Ameaças virtuais, danos reais', 1, 'hacker.jpg', 'Nesta palestra,\r\niremos abordar como funcionam os ataques virtuais e como fazer para combatê-los no dia-a-dia.', 'Páginas falsas são apenas a ponta do iceberg. No cenário atual, os cibercriminosos fazem\r\nde tudo para obter lucro, mesmo que gerem consequências fatais para suas vitimas. Nesta palestra,\r\niremos abordar como funcionam os ataques virtuais e como fazer para combatê-los no dia-a-dia.', 2019, 'ameacas-virtuais-danos-reais', NULL),
(15, 'Empregabilidade - Desafios e oportunidades para o sucesso', 1, 'empregabilidade.jpg', 'O tema explora a capacidade de o indivíduo manter-se ou reinserir-se no mercado de\r\ntrabalho.', 'O tema explora a capacidade de o indivíduo manter-se ou reinserir-se no mercado de\r\ntrabalho, agrupando um conjunto de ingredientes que o torne capaz de competir com\r\ntodos aqueles que disputam um emprego. Empresários podem refletir sobre as\r\nhabilidades que sua equipe necessita desenvolver, incluindo a compreensão de como\r\navaliar pessoas em dinâmicas.<br>\r\nConteúdo programático:<br>\r\n. Conceito de Empregabilidade<br>\r\n. Fatores essenciais<br>\r\n. Planejamento pessoal<br>\r\n. Relacionamento interpessoal<br>\r\n. Muitas funções irão sumir<br>\r\n. Quem quer dinheiro?<br>\r\n. Sonhos x Objetivos<br>\r\n. Mundo real x virtual<br>\r\n. Realidade em que estamos inseridos<br>\r\n. O novo perfil - você está enquadrado?<br>\r\n. Qualificação para o mercado<br>\r\n. Cursos de especialização Grátis<br>\r\n. A atenção aos detalhes<br>\r\n. Percepção do que vemos<br>\r\n. 10 perguntas de emprego que mais erram<br>\r\n. Traçando Estratégias<br>\r\n. Analisando pelas Dinâmicas de Grupo<br>\r\n. Ter sorte: a fórmula mágica<br>', 2019, 'empregabilidade-desafios-e-oportunidades-para-o-sucesso', NULL),
(16, 'O Fantástico mundo dos dados:  Para que servem? Como se reproduzem?', 1, 'mundo-dos-dados.jpg', 'Vamos entender o fluxo dos dados dentro de uma organização até se tornarem informação relevante  com exemplos práticos.', 'Vamos entender o fluxo dos dados dentro de uma organização até se tornarem informação relevante  com exemplos práticos.', 2019, 'o-fantastico-mundo-dos-dados-para-que-servem-como-se-reproduzem', 8),
(17, '90% de cobertura de testes em projetos? Sim, é possível!', 1, '90-teste.jpg', 'Sabemos que testes são importantes, deveriam guiar nosso desenvolvimento e tornam nossos código mais resiliente.', 'Sabemos que testes são importantes, deveriam guiar nosso desenvolvimento e tornam nossos código mais resiliente. Mas como a teoria encontra a prática e a gente mantém nossos projetos com uma boa cobertura de testes? Vou mostrar como o meu time na OLX conseguiu isso nos nossos microsserviços em Python.', 2019, '90-de-cobertura-de-testes-em-projetos-sim-e-possivel', 8),
(18, 'A Crowd Science framework for Plagiarism Detection', 1, 'crowdsourcing.jpg', 'Palestra sobre o projeto de desenvolvimento de uma ferramenta em um sistema de Crowdsoursing que auxiliasse a criação de uma base de dados de textos plagiados.', 'Palestra sobre o projeto de desenvolvimento de uma ferramenta em um sistema de Crowdsoursing que auxiliasse a criação de uma base de dados de textos plagiados.', 2019, 'crowdsourcing', 8),
(19, 'Programas de Incentivo à Participação Feminina em Computação', 1, 'garotas-programando.jpg', 'A baixa participação de mulheres nas áreas de Computação é um fato preocupante já que diversidade em qualquer ambiente é de vital importância para sua evolução.', 'A baixa participação de mulheres nas áreas de Computação é um fato preocupante já que diversidade em qualquer ambiente é de vital importância para sua evolução, principalmente no cenário atual em que os usuários passaram de consumidores para produtores de tecnologias e conteúdos digitais. Esse trabalho descreve a evolução da atividade realizada pelo Projeto #include\r\n&lt;meninas.uff&gt; na Universidade Federal Fluminense (UFF) com os alunos recém matriculados no curso de Ciência da Computação e Sistemas de Informação, além disso, trabalhos feitos com os alunos do 6º ao 9º anos do colégio Aplicação da UFF (COLUNI).', 2019, 'programas-incentivo-participacao-feminina-em-computacao', 8),
(20, 'Visualização de informação: keep calm and visualize your data.', 1, 'visualizacao-de-dados.jpg', 'O workshop abordara a parte de visualização de dados com demonstrações e\r\nexemplificações.', ' Nos últimos anos, os Sistemas de Informação têm sido marcados pelo excesso de\r\ndados disponíveis aos usuários. Técnicas de Visualização de Informação são\r\ncomumente empregadas para facilitar a análise e o entendimento dos dados.\r\nO workshop abordara a parte de visualização de dados com demonstrações e\r\nexemplificações. Na parte prática será apresentado o Tableau onde a criação de um\r\ndashboard interativo será a principal atividade.', 2019, 'visualizacaoo-de-informacao', 8),
(21, 'Saindo do Zero com o Git: Comece já a versionar seus projetos', 0, 'curso-git.jpg', 'Neste minicurso, daremos uma introdução a ferramenta Git em conjunto com o Github, explicando os principais comandos e seus conceitos de forma didática e prática, para que você possa gerenciar e versionar seus próprios projetos de software.', 'Neste minicurso, daremos uma introdução a ferramenta Git em conjunto com o Github, explicando os principais comandos e seus conceitos de forma didática e prática, para que você possa gerenciar e versionar seus próprios projetos de software.', 2019, 'saindo-do-zero-com-o-git', 8),
(22, 'Transformação digital e riscos cibernéticos: um novo panorama de ameaças', 1, 'computacao-forense.jpg', 'Estamos no epicentro de uma nova transformação digital que vai causar grande\r\nimpacto nos modelos de negócio que já conhecemos.', 'Estamos no epicentro de uma nova transformação digital que vai causar grande\r\nimpacto nos modelos de negócio que já conhecemos. Com a evolução de tecnologias como\r\nBig Data, Inteligência Artificial e Internet das Coisas, as organizações poderão explorar novos\r\nmercados e ofertar novos serviços. Por outro lado, a conectividade em larga escala\r\nfomentada pelo 5G trará também novos riscos cibernéticos para as organizações e que\r\npoderão comprometer drasticamente os novos modelos de negócio se não forem tratados.\r\nPrestes a entrarmos em uma nova era de ameaças cibernéticas, a palestra apresenta uma\r\nabordagem de mapeamento de riscos focada na transformação digital.', 2019, 'transformacao-digital-e-riscos-ciberneticos-um-novo-panorama-de-ameacas', NULL),
(24, 'Organização, Gerenciamento de Tarefas e Motivação com o Habitica (Mesa Redonda)', 1, 'organizacao-tempo.jpg', 'O objetivo da mesa redonda é motivar uma discussão sobre as diferentes\r\nestratégias de gerenciamento de tarefas, organização e motivação utilizando o Habitica.', 'O objetivo da mesa redonda é motivar uma discussão sobre as diferentes\r\nestratégias de gerenciamento de tarefas, organização e motivação utilizando o Habitica.\r\nMuito além de apenas apresentar a utilização da ferramenta, o intuito é discutir como\r\nos vieses do comportamento humano e do funcionamento do cérebro afetam a motivação,\r\nhábitos, como nos comportamos em relação a prazo e como devemos atacar problemas\r\ndifíceis. Também será discutido pelo palestrante vieses pessoais, que o fizeram\r\nter atitudes e comportamentos adicionais em relação à organização de modo geral. Será\r\naberto aos presentes falar sobre suas próprias estratégias e comportamentos percebidos\r\nao longo do esforço de se organizarem.', 2019, 'organizacao-gerenciamento-de-tarefas-e-motivacao-com-o-habitica', NULL),
(26, 'Inovação e Pós-Modernidade', 1, 'inovacao-pos-modernidade.jpg', 'A palestra abordará o fenômeno da comunicação na pós-modernidade e a relação entre inovação e mercado de consumo e educação. Também será abordado a vida digital e as características do \"Universo Virtual\".', 'A palestra abordará o fenômeno da comunicação na pós-modernidade e a relação entre inovação e mercado de consumo e educação. Também será abordado a vida digital e as características do \"Universo Virtual\".', 2019, 'inovacao-e-pos-modernidade', NULL),
(27, 'Workshop de Análise de Sentimentos com Word Clouds', 0, 'word-cloud.jpg', 'O objetivo deste workshop é permitir uma discussão introdutória sobre a área de\r\nconhecimento de Ciência de Dados abordando o conceito de Análise de Sentimento.', 'O objetivo deste workshop é permitir uma discussão introdutória sobre a área de\r\nconhecimento de Ciência de Dados abordando o conceito de Análise de Sentimento, de maneira a\r\napresentar seus resultados de forma gráfica e interativa. Ao longo do workshop, serão abordados\r\nconceitos básicos de processamento da linguagem natural via texto utilizando bibliotecas\r\namplamente utilizadas da linguagem Python para realizar a análise de dados, como Pandas e\r\nNLTK.<br/>\r\nAssim, esse workshop introduz estratégias de análise de grandes quantidades de dados, a fim de\r\ndetectar opiniões gerais sobre determinado número de avaliações fornecidas.', 2019, 'workshop-de-analise-de-sentimentos-com-word-clouds', NULL),
(28, 'Jornada Digital - Como, na Prática, Pegar essa Estrada', 1, 'jornada-digital.jpg', 'Hoje em dia muito se fala em Transformação Digital e Inovação. É uma via de mão única e quem não pegar essa estrada vai ficar pelo caminho. Mas como, na prática, é possível colocar a sua organização nessa Jornada Digital?', 'Hoje em dia muito se fala em Transformação Digital e Inovação. É uma via de mão única e quem não pegar essa estrada vai ficar pelo caminho. Mas como, na prática, é possível colocar a sua organização nessa Jornada Digital? Como a Tecnologia Digital vem transformando as empresas, quer seja na oferta de produtos, quer seja no seu relacionamento com clientes fornecedores e funcionários? Em nossa palestra apresentaremos um conjunto de tecnologias de fácil adoção que vem ajudando as Organizações a tomarem essa estrada e a colherem os frutos do mundo digital de forma rápida e segura.', 2019, 'jornada-digital-como-na-pratica-pegar-essa-estrada', NULL),
(29, 'Introdução à Maratona de Programação', 1, 'introducao-maratona.jpg', 'Esta palestra fará uma introdução à Maratona de Programação.', 'Esta palestra fará uma introdução à Maratona de Programação, discutindo diversos aspectos da competição, curiosidades e benefícios que podem ser alcançados pelos participantes.', 2019, 'introducao-a-maratona-de-programacao', NULL),
(30, 'React com foco em React Hooks', 1, 'react-hooks.jpg', 'A palestra consiste de uma apresentação das atualizações do React para 2019,\r\ncom novidades e como aplicá-las atualmente, tendo como foco React Hooks.', 'A palestra consiste de uma apresentação das atualizações do React para 2019, com novidades e como aplicá-las atualmente, tendo como foco React Hooks.', 2019, 'react-com-foco-em-react-hooks', NULL),
(31, 'Como a ciência de dados pode ser usada para causar impactos sociais.', 1, 'dados-sociedade.jpg', 'Nesta palestra vamos discutir como usar ciência e análise de dados para trabalhar em problemas de impacto social.', 'Nesta palestra vamos discutir como usar ciência e análise de dados para trabalhar em problemas de impacto social. É importante levar em consideração questões legais, sociais, culturais e filosóficas à medida que inventamos novas tecnologias, promovendo o uso de dados de maneira justa e ética. Nesta palestra, vou apresentar diferentes projetos com os quais já trabalhei nos mais variados segmentos (educação, saúde, desenvolvimento econômico e no combate a fake news), mostrando as tecnologias utilizadas e como podemos criar modelos complexos de Inteligência Artificial sem abrir mão do entendimento humano.\r\n', 2019, 'como-ciencia-de-dados-pode-ser-usada-para-causar-impactos-sociais', 8),
(32, 'Era dos Dados: Oportunidades e Desafios', 1, 'era-dos-dados.jpg', 'Há uma revolução em curso. Estamos no início da era dos dados!', 'Há uma revolução em curso. Estamos no início da era dos dados! Nesta palestra veremos como a popularização da Internet, das redes sociais e dos smartphones, aliados com a tecnologia de Computação em Nuvem, reuniram os elementos necessários e suficientes para o nascimento de um novo paradigma nos negócios, cujo ativo central são dados. Serão apresentados os principais conceitos da economia dos dados e como sua dinâmica vem mudando drasticamente áreas da Indústria, Financeiro, Saúde, Educação, Governo e Ciência, dentre outras, sendo o principal catalizador para a inovação no mundo. Apresentaremos também o perfil do principal profissional desta área – o cientista de dados, que reúne um conjunto de competências e habilidades de diversas áreas. Por fim, discutiremos os potenciais desdobramentos da área e suas perspectivas no Brasil.', 2019, 'era-dos-dados-oportunidades-e-desafios', NULL),
(33, 'Introdução a Programação Funcional', 0, 'programacao-funcional.jpg', 'A proposta desse workshop é de mostrar como podemos achar soluções mais simples mudando nossa forma de pensar quando desenvolvemos nossas aplicações.', 'A proposta desse workshop é de mostrar como podemos achar soluções mais simples mudando nossa forma de pensar quando desenvolvemos nossas aplicações. Normalmente aprendemos a programar de forma imperativa ou com objetos, programação funcional nos ensina a programar com pequenas funções e a construir comportamentos grandes com essas pequenas partes. Esperamos que no final do workshop todos tenham a base e a vontade de aprender ainda mais sobre esse paradigma que está conquistando seu espaço no mercado após consecutivos casos de sucesso.', 2019, 'introducao-a-programacao-funcional', NULL),
(34, 'Bancos de dados NoSQL', 1, 'nosql.jpg', 'Bancos de dados NOSQL, são sem dúvida alguma, a principal escolha quando necessita de alta performance, disponibilidade e escalabilidade.', 'Bancos de dados NOSQL, são sem dúvida alguma, a principal escolha quando necessita de alta performance, disponibilidade e escalabilidade. Nesta palestra veremos suas principais características e como realizar operações básicas com MongoDB.', 2019, 'bancos-de-dados-nosql', NULL),
(35, 'O uso de ciência de dados para a detecção de problemas e melhoria da eficiência das operações de fraturamento hidráulico', 1, 'ciencia-de-dados.jpg', 'A palestra tem o objetivo de expor as aplicações de ciência de dados da Intelie referentes às operações de fraturamento hidráulico.', 'A palestra tem o objetivo de expor as aplicações de ciência de dados da Intelie referentes às operações de fraturamento hidráulico. A Intelie, que faz parte do grupo Rignet desde 2018, é uma empresa de tecnologia inovadora que fornece, aos seus clientes, ferramentas e serviços de software para transformar dados em resultados e aumentar a produtividade nas operações e no backoffice. ', 2019, 'o-uso-de-ciencia-de-dados-para-a-deteccao-de-problemas-e-melhoria-da-eficiencia-das-operacoes', NULL),
(36, 'Simulação de Dinâmicas Sociais', 1, 'simulacao-social.jpg', 'Em breve mais informações.', 'Em breve mais informações.', 2019, 'simulacao-de-dinamicas-sociais', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `palestrante`
--

CREATE TABLE `palestrante` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `posicao` varchar(300) NOT NULL,
  `descricao` varchar(2000) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `palestrante`
--

INSERT INTO `palestrante` (`id`, `nome`, `tipo`, `posicao`, `descricao`, `foto`, `id_evento`, `linkedin`, `instagram`) VALUES
(1, 'Raíza Santanna', 1, 'Desenvolvedora Full Stack na OLX.', 'Bacharela em Ciência da Computação pela UFRRJ em 2016, 25 anos e apaixonada por programação e novas tecnologias.', 'raiza-santanna.jpg', 17, NULL, NULL),
(2, 'Patrícia de Castro Wang\r\n', 1, 'Bolsista de Mestrado do Programa de Engenharia de Sistemas e Computação (PESC/COPPE) na área de Engenharia de Dados e Conhecimento e participa do projeto Reflora da Fundação Coppetec como desenvolvedora web com foco em MDArte e Java.', 'Técnica  em Informática Industrial pelo Centro Federal de Educação e Tecnologia Celso Suckow da Fonseca (CEFET/RJ - Campus Maria da Graça) e graduada em Ciência da Computação pela Universidade Federal Rural do Rio de Janeiro (em 2018.1). Além disso, participou no desenvolvimento do trabalho publicado \"A Crowd Science framework to support the construction of a Gold Standard Corpus for Plagiarism Detection\"  referente ao tcc entregue e fez participação da  International Conference on Computer Supported Cooperative Work in Design em 2019 realizada na cidade do Porto em Portugal devido ao trabalho desenvolvido.', 'patricia-wang.jpg', 18, NULL, NULL),
(3, 'Vanessa Santos Soares\r\n', 1, 'Desenvolvedora na Intelie, na equipe voltada para a área de petróleo e gás.', 'Graduada em Ciência da Computação pela Universidade Federal Rural do Rio de Janeiro (em 2018.1), já atuou em áreas como desenvolvimento web e big data. Além disso, participou e apresentou o trabalho publicado \"A Crowd Science Framework to support the construction of a Gold standard corpus for plagiarism Detection\" na International Conference on Computer Supported Cooperative Work in Design em 2019 realizada na cidade do Porto em Portugal.', 'vanessa-soares.jpg', 18, NULL, NULL),
(4, 'Caroline Ribeiro', 1, 'Coordenadora de Business Intelligence e Dados na Akross', 'Graduada em Ciência da Computação pela UERJ e pós graduada em Banco de dados, Datawarehouse, Datamining  e Gestão do conhecimento nas empresas pela PUC-Rio.<br/>Atua na área de dados há 12 anos com passagem por DBA, modelagem e análise de dados e há 2 anos exerce papel de liderança voltada para inovação e aplicação de novos processos e soluções para acompanhamento de resultados.', 'carolina-ribeiro.jpg', 16, NULL, NULL),
(5, 'Elihofni Guirra Lima', 1, 'Desenvolvedor Web Full Stack na globoesporte.com', 'Programador Web Junior na Rede Globo formado na Universidade Federal Fluminense em Ciência da Computação.<br/>Principais competências em JavaScript, React.js e Python.', 'elihofni-guirra.jpeg', 9, 'elihofni', NULL),
(6, 'Diego Córdoba de O. e Silva', 1, 'Professor e Consultor de Tecnologia na educação', 'Professor pós-graduado pela UFF no curso de Planejamento e Gestão de Educação a Distância, pós-graduado em Tecnologia Educacional pela Universidade Cândido Mendes (AVM), também Pós-Graduado na universidade Cândido Mendes (AVM) em Docência do Ensino Superior, possui Bacharelado em Sistema de Informação pela Faculdade Cenecista da Ilha do Gov. e mestre em Divulgação da Ciência, tecnologia e saúde pela COC/FIOCRUZ.', 'diego-cordoba.jpg', 12, 'professordiegocordoba', 'professordiegocordoba'),
(7, 'Raquel Bravo', 1, 'Professora, graduada em Matemática pela UERJ, mestrado e doutorado em Engenharia de Sistemas e Computação pela UFRJ', 'A professora Raquel Bravo possui graduação em Matemática pela Universidade do Estado do Rio de Janeiro (2003), mestrado e doutorado em Engenharia de Sistemas e Computação pela Universidade Federal do Rio de Janeiro (2006 e 2011, respectivamente). Fez Pós-Doutorado, na Universidade Federal Fluminense. Por 2 anos trabalhou como professora adjunta efetiva na Universidade Federal Rural do Rio de Janeiro e desde 2015 é professora adjunta efetiva do Instituto de Computação da Universidade Federal Fluminense. Possui experiência na área de Ciência da Computação, com ênfase em Estrutura de Dados, Análise e Projeto de Algoritmos, Algoritmos em Grafos, Otimização em Grafos, Complexidade de Algoritmos e Teoria dos Grafos.', 'raquel-bravo.jpg', 19, NULL, NULL),
(8, 'Bárbara Pimenta Caetano', 1, 'Graduada em Sistemas de Informação pela UNIFEI. Mestre em Engenharia de Sistemas e Computação pela PESC/COPPE/UFRJ. Atualmente sou Doutoranda em Engenharia de Sistemas e Computação pela PESC/COPPE/UFRJ.', 'Sou graduada em Sistemas de Informação pela UNIFEI. Mestre em Engenharia de\r\nSistemas e Computação pela PESC/COPPE/UFRJ. Atualmente sou Doutoranda em\r\nEngenharia de Sistemas e Computação pela PESC/COPPE/UFRJ. Realizo pesquisa na \r\nárea de paricipação eletrônica e desde 2012 realizo pesquisas na área de visualização de \r\ndados quando tive a oportunidade de atuar criando Visualizações de dados públicos no projeto \r\nVisPublica no CAPGov. Atualmente sou líder da equipe de BI cujo o objetivo é desenvolver \r\ndashboards de dados em diversas áreas.', 'barbara-pimenta.jpg', 20, NULL, NULL),
(17, 'Rafael Oliveira', 1, 'Analista de Segurança e trabalha na equipe de Segurança da Globo.com', 'Formado em Ciência da Computação pela UFRJ, trabalho hoje no time de Segurança da\r\nGlobo.com, mais especificamente na parte de segurança de aplicações. Minha paixão por\r\nsegurança começou quando entrei para o CSIRT-UFRJ em 2010, grupo de extensão\r\nvoltado para estudos na temática dentro da universidade. Tenho grande interesse na área\r\nde segurança ofensiva, desenvolvimento de exploits, e na criação de ferramentas que\r\nauxiliam desenvolvedores a tornarem seus códigos mais seguros.', 'rafael-oliveira.jpeg', 7, NULL, NULL),
(18, 'Alexandre G Neves', 1, 'Atua no Departamento de Alianças da Alterdata Software', 'Graduado em Administração, Formado em Sistemas de Informação, Pós-graduando em Inteligência Artificial e Machine Learning, professor de processamento de dados, instrutor Internacional de Liderança, já realizou centenas de palestras dentro e fora do Brasil e atua no Depto de Alianças da Alterdata Software, orientando empresários, profissionais contábeis e estudantes no entendimento de diferentes tecnologias e informações de mercado. É palestrante cadastrado no CFC - Conselho Federal de Contabilidade.https://alterdata.software/', 'alexandre-neves.jpg', 15, NULL, NULL),
(19, 'Emilio Simoni', 1, 'Diretor do dfndr lab - laboratório especializado em segurança digital da PSafe.', 'Desenvolvedor e pesquisador de segurança há 17 anos, atuando também como Data Scientist. Já trabalhou nas áreas de segurança da informação, pesquisa e desenvolvimento em empresas como GÁS Tecnologia e Diebold, criando soluções de proteção para bancos brasileiros. Atualmente, é Diretor do dfndr lab, laboratório especializado em segurança digital, formado por um time de especialistas em cibersegurança, que utiliza técnicas de inteligência artificial e machine learning para detectar, analisar e alertar a população sobre os mais recentes e sofisticados ataques cibernéticos.', 'emilio-simoni.png', 14, 'emiliosimoni', NULL),
(20, 'Esteban Clua', 1, 'Professor da Universidade Federal Fluminense e coordenador geral do UFF Medialab', 'Possui graduação em Computação pela Universidade de São Paulo, mestrado e doutorado em Informática pela PUC-Rio. Sua área de atuação está especialmente focada na área de Video Games, Realidade Virtual, GPUs e visualização. É um dos fundadores do SBGames (Simpósio Brasileiro de Games e Entretenimento Digital), tendo sido presidente da Comissão Especial de Jogos da SBC entre 2010 e 2014. Atualmente é o representante para o Brasil do Technical Committee de Entretenimento Digital da International Federation of Information Processing (IFIP) e membro honorário do conselho diretivo da Abragames (Associação Brasileira de Desenvolvimento de Games). Em 2015 foi nomeado NVIDIA CUDA Fellow. Em 2007 recebeu o prêmio da ABRAGAMES como o maior contribuidor da academia para a indústria de jogos digitais no Brasil. Esteban é membro do comitê de programa das mais importantes conferencias na área de entretenimento digital. Atualmente é coordenador do Centro de Excelência da NVIDIA no Brasil, que funciona no instituto de computação da Universidade Federal Fluminense. Esteban é do conselho de inovação da Secretaria da Cultura do Estado do Rio de Janeiro, membro da comissão permanente do Rio Criativo, Membro do Fórum permanente de Inovação e Tecnologia da Assembléia Legislativa do Rio de Janeiro e membro do conselho da Agencia de Inovação da UFF. Ao longo dos últimos 5 anos Esteban participou ativamente na incubação e criação de diversas empresas de entretenimento digital no Estado do Rio de Janeiro. Em 2014 recebeu o premio Prata da Casa, dado pela UFF, sendo reconhecido como o segundo melhor docente da Universidade no ano e destacando-se pela sua atuação de aproximação da universidade com a indústria regional de Tecnologia da Informação. Em 2018 Esteban Clua foi Program Chair do IFIP ICEC (International Conference on Entertainment COmputing), uma das mais presitigiosas conferencias em entretenimento digital e General Chair do SBGames 2018.', 'esteban-clua.jpg', 8, NULL, NULL),
(21, 'Patrick Oliveira', 1, 'Desenvolvedor Web Full Stack no Globoesporte.com', 'Programador Web Full Stack no globoesporte.com, formado em Ciência da Computação no Centro Universitário Carioca.<br/>Principais Competências em Python, Django e MySQL.', 'patrick-oliveira.jpg', 9, 'patrick-oliveira-42475510b', NULL),
(22, 'Niuan Lucas Nicolau de Albuquerque', 2, 'Estudante de Ciência da Computação na Universidade Federal Rural do Rio de Janeiro.', 'Estudante de Ciência da Computação na Universidade Federal Rural do Rio de Janeiro.\r\nTécnico CEFET em Telecomunicações com ênfase em Computação e Desenvolvimento de Projetos de uso de Hardware com Microcomputadores e Microcontroladores. Apaixonado por Programação e Tecnologia, e adora trabalhar nas linhas de Pesquisa de Smart Cities e IoT.\r\nPrincipais Competências em Telecomunicações, Informática, Design e Mídia Digital', 'niuan-lucas.jpg', 10, 'niuan-lucas', 'niuanlucas'),
(23, 'Matheus Zaché Gonçalves', 2, 'Estudante de Ciência da Computação na Universidade Federal Rural do Rio de Janeiro.', 'Técnico em Informática pelo CEFET UnED NI. \r\nPossui experiência em programação web com PHP e conhecimento de modelagem e implementação de Banco de Dados.\r\n<br>Principais Competências em PHP e MySQL.', 'matheus-zache.jpg', 13, NULL, NULL),
(24, 'Deived William', 2, 'Estudante de Ciência da Computação na Universidade Federal Rural do Rio de Janeiro.', 'Embedded Systems Software Developer at TracSense and Technological Initiation at the National Astronomy Observatory', 'deived-william.jpeg', 11, NULL, NULL),
(25, 'Lívia de Azevedo', 2, 'Graduanda em Ciência da Computação pela Universidade Federal Rural do Rio de Janeiro.', 'Exerceu atividade de Monitoria da disciplina \"Linguagens Formais e Autômatos\" durante 3 anos e realizou uma Iniciação Científica Voluntária com tema voltado para área de Sistemas de Recomendação durante 1 ano. Atualmente, é estagiária de Desenvolvimento na área de Big Data na empresa Globo.com, tendo iniciado em setembro de 2018.', 'livia-de-azevedo.jpg', 21, NULL, NULL),
(26, 'Bárbara Ayres', 2, 'Graduanda em Ciência da Computação pela Universidade Federal Rural do Rio de Janeiro.', 'Organizadora do Grupo PyLadies Rural e voluntária na Iniciação Científica no Projeto Meninas Digitais. Estagiou durante 6 meses na Infoglobo na área de desenvolvimento de software e atualmente é estagiária de desenvolvimento de software na Globo TV.', 'barbara-ayres.jpg', 21, NULL, NULL),
(28, 'Alex Castellar', 1, 'Secretário municipal de assuntos estratégicos, ciência, tecnologia e inovação.', 'Há duas décadas vem ocupando cargos na administração pública brasileira. Foi assessor especial\r\nda presidência da ALERJ, ocupou a chefia de gabinete na Câmara de Deputados Federais, na\r\nAlerj e na Câmara Municipal do Rio de Janeiro, além de ter sido Secretário de Governo na\r\ncidade de Teresópolis.\r\nEm sua trajetória, idealizou e coordenou também importantes projetos educacionais: a Exposição\r\nPermanente e o Parlamento Juvenil na Alerj, além de ter sido coordenador geral do programa\r\nJovem Trabalhador Social, da Secretaria de Infância e Juventude no Governo do Estado do Rio\r\nde Janeiro.', 'alex-castellar.jpg', 26, NULL, NULL),
(29, 'André Tardelli', 2, 'Graduando do curso de Ciência da Computação na Universidade Federal do Rio de Janeiro e atua como instrutor e desenvolvedor no Grupo Caelum Rio, ministrando cursos presenciais em temas de Front End e Data Science.', 'Tendo atuado em projetos web e mobile em grandes empresas como Petrobrás e Accenture, possui contato tanto no meio corporativo quanto no meio acadêmico. Com artigos apresentados nacionalmente e internacionalmente, tem como foco de pesquisa implementar conceitos de psicologia aplicados à tecnologia, de modo a buscar novas formas de humanizar as interações realizadas de maneira digital.', 'andre-tardelli.jpg', 27, NULL, NULL),
(30, 'Leandro Bataglia', 1, 'Graduando em Ciência da Computação na UFRRJ', 'Estudante do 4º período de Ciência da Computação na Universidade Federal Rural do Rio de Janeiro', 'leandro-bataglia.jpg', 24, NULL, NULL),
(31, 'George J.A Chaves', 1, 'Perito Forense e Especialista em Cyber Security', 'Perito em Computação Forense, Especialista em Cibersegurança e MBA em Gestão de Segurança da Informação. Possui ampla experiência com Cyber Security, atuando em projetos de auditoria, mapeamento de riscos e implantação de políticas de segurança da informação em empresas de todos os portes. É professor do curso de Pós-Graduação em Indústria Avançada do Senai Cetiqt, faz mentoria de projetos relacionados a robótica e Internet das Coisas e participa de comunidades de tecnologia e inovação no Estado do Rio. Atualmente exerce a função Risk Advisory Senior Specialist na Italtel Digital Security, atuando em projetos de governança de segurança da informação de grandes corporações.', 'george-chaves.jpg', 22, 'georgechaves', 'eugeorgechaves'),
(32, 'Roberto Lima', 1, 'Empresário, Administrador de Empresas, Analista de Sistemas', 'Mais de 30 anos de atuação com executivo em Consultoria em TI, com ampla experiência na elaboração e condução de planos estratégicos nas áreas comercial, operacional e de gestão de pessoas.<br/>\r\nForte expertise no desenvolvimento de diversas parcerias de negócio nacionais e internacionais, junto a empresas brasileiras, americanas, canadenses e europeias, tendo sido o responsável pela elaboração do plano de negócios para operacionalizar cada uma dessas parcerias.<br/>\r\nSólida experiência na comercialização e entregas de projetos associados a soluções de Automação de Processos, Inteligência Artificial, RPA, BPM, ERP, BI, CRM, Procurement e Fiscal.<br/>\r\nSócio Fundador da Greenfive Soluções em Tecnologia Ltda., empresa de consultoria focada na automação de processos e Inteligência Artificial.', 'roberto-lima.jpg', 28, 'roberto-lima-junior', NULL),
(33, 'Vinicius Fernandes dos Santos', 1, 'Professor do Magistério Superior', 'Trabalha no Departamento de Ciência da Computação da Universidade Federal de Minas Gerais. Doutor em Engenharia de Sistemas e Computação pela Universidade Federal do Rio de Janeiro.', 'vinicius-fernandes.jpg', 29, NULL, NULL),
(34, 'Laura Moraes \r\n', 1, 'Co-fundadora da start-up de ciência de dados Twist e mestre e doutoranda em Engenharia de Sistemas e Computação pela COPPE/UFRJ, com especialidade na linha de Inteligência Artificial.', 'Graduada em Engenharia Eletrônica e de Computação pela Universidade Federal do Rio de Janeiro, participou da colaboração UFRJ-CERN por mais de 4 anos. Em 2018, participou do programa Data Science for Social Good da Universidade de Chicago. Atualmente, é professora no MBA em Big Data & Analytics da Fundação Getúlio Vargas.', 'laura-moraes.jpg', 31, NULL, NULL),
(35, 'Hillary Sousa', 1, 'Desenvolvedora Jr.', 'Desenvolvedora na B2W Digital', 'hillary-sousa.jpg', 30, 'hillarysousa', NULL),
(36, 'Carlos Eduardo R. de Mello', 1, 'Professor adjunto e chefe do Departamento de Informática Aplicada do Centro de Ciências Exatas e Tecnologia (CCET) da Universidade Federal do Estado do Rio de Janeiro - UNIRIO.', 'Em 2006, graduou-se Bacharel Ciência da Computação pela Universidade Federal do Rio de Janeiro - UFRJ, sendo condecorado com dignidade acadêmica cum laude em virtude do seu notável desempenho. Na mesma universidade, em maio de 2008, obteve mestrado em Engenharia de Sistemas e Computação pelo Instituto Alberto Luiz Coimbra de Pós graduação e Pesquisa em Engenharia – COPPE. Em 2013, recebeu o título de Doutor em Ciência da Computação pela École Centrale Paris (atualmente Université Paris-Saclay) em cotutela com COPPE/UFRJ, tendo realizado sua pesquisa em ambos os países ao longo de 4 anos. Seus interesses de pesquisa estão na áreas de Aprendizado de Máquina e Mineração de Dados, em especial na investigação de novos desenvolvimentos metodológicos e abordagens de modelagem. As principais aplicações exploradas na sua pesquisa estão focadas no emprego da Ciência de Dados para o Bem-estar Social. Na UNIRIO, o prof. Mello lidera o grupo de pesquisa Dados para o Bem – DBEM. Atualmente, há três eixos de aplicação em desenvolvimento no grupo DBEM: Proteção de Crianças na Internet, Análise de Redes Sociais de Participação Política no Brasil e Viés e Bolhas de Informação em Sistemas de Recomendação e Buscadores.', 'carlos-eduardo.jpg', 32, NULL, NULL),
(37, 'Matheus da Costa Mesquita', 2, 'Desenvolvedor', 'Desenvolvedor na B2W Digital', 'matheus-mesquita.jpg', 33, 'matheus-mesquita-3b78a3139', NULL),
(38, 'Felipe Frazão', 1, 'Engenheiro de Software e Graduando em Engenharia de Computação - Instituto Infnet.', 'Estagiou na área de desenvolvimento de software por um ano e seis meses na Editora Globo e atualmente Engenheiro de Software na Editora Globo.', 'felipe-frazao.jpg', 34, 'felipe-frazao', NULL),
(39, 'Adriano Cabral Linhares Mourthé', 1, 'Possui graduação em Sistemas de Informação e mestrado em Informática pela Universidade Federal do Estado do Rio de Janeiro (UNIRIO).', 'Ao longo dos últimos 3 anos atuou na intelie com a aplicação de técnicas de aprendizado de máquina na área de Óleo e Gás.', 'adriano-mourthe.jpg', 35, NULL, NULL),
(40, 'Mariana Oliveira', 1, 'Graduanda em Sistemas de Informação pela Universidade Federal do Estado do Rio de Janeiro (UNIRIO).', 'Atualmente, atua há 1 ano como estagiária de ciência de dados na área de Óleo e Gás na Intelie, dando suporte às aplicações de aprendizado de máquina.', 'sem-foto.jpg', 35, NULL, NULL),
(41, 'Marcelo Zamith', 1, 'Professor do Departamento de Tecnologias e Linguagens do Instituto Multidisciplinar na Universidade Rural do Rio de Janeiro – UFRRJ', 'Possui graduação em pela Universidade Gama Filho (2005) e mestrado (2007) e doutorado (2013) em Computação pela Universidade Federal Fluminense. Atualmente é professor do Departamento de Tecnologias e Linguagens do Instituto Multidisciplinar na Universidade Rural do Rio de Janeiro – UFRRJ – Campus de Nova Iguaçu, atuando principalmente nos seguintes temas: GPU Computing, simulação e jogos.', 'marcelo-zamith.jpg', 36, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patrocinador`
--

CREATE TABLE `patrocinador` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `ordem` int(11) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patrocinador`
--

INSERT INTO `patrocinador` (`id`, `nome`, `img`, `url`, `ordem`, `tipo`) VALUES
(1, 'Alterdata', 'alterdata.png', 'alterdata.com.br', 1, 3),
(3, 'FAPERJ', 'faperj.png', 'faperj.br', 3, 1),
(4, 'Maratonou!', 'maratonou.png', 'facebook.com/maratonou/', 4, 3),
(5, 'Meninas Digitais', 'meninas-digitais.png', 'meninas.sbc.org.br', 8, 2),
(6, 'Mobicare', 'mobicare.png', 'mobicare.com.br', 6, 1),
(7, 'PSafe', 'psafe.png', 'psafe.com', 7, 3),
(8, 'Pyladies Rural', 'pyladies.png', 'facebook.com/pyladiesrural/', 5, 2),
(10, 'Sociedade Brasileira de Computação', 'sbc.png', 'sbc.org.br', 10, 0),
(11, 'UFRRJ', 'ufrrj.png', 'portal.ufrrj.br', 11, 3),
(12, 'Caelum', 'caelum.png', 'caelum.com.br', 13, 1),
(13, 'B2W Digital', 'b2w.png', 'ri.b2w.digital', 14, 3),
(14, 'GreenFive', 'greenfive.png', 'greenfive.com.br', 15, 3),
(15, 'Intelie', 'intelie.png', 'www.intelie.com.br', 16, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ordem` (`ordem`);

--
-- Indexes for table `minicurso_palestra`
--
ALTER TABLE `minicurso_palestra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `palestrante`
--
ALTER TABLE `palestrante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patrocinador`
--
ALTER TABLE `patrocinador`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cronograma`
--
ALTER TABLE `cronograma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `minicurso_palestra`
--
ALTER TABLE `minicurso_palestra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `palestrante`
--
ALTER TABLE `palestrante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `patrocinador`
--
ALTER TABLE `patrocinador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

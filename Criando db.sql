/*CREATE DATABASE appFisico;*/

USE appFisico;

CREATE TABLE IF NOT EXISTS cliente(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    sobrenome VARCHAR(50),
    celular VARCHAR(11),
    cpf VARCHAR(11),
    particular INTEGER,
    avaliacao VARCHAR(400),
    foto VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS consulta(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    evolucao VARCHAR(50),
    dataConsulta INTEGER,
    horaInicio INTEGER,
    horaTermino INTEGER,
    idCliente INTEGER,
    nivelDor INTEGER
);

INSERT INTO cliente 
(
	nome, sobrenome, celular, cpf, particular, avaliacao, foto
)
VALUES
(
	'Yusuke', 'Urameshi', '11985632147', '12345678987', 1, 'Tranks', ''
),
(
	'Gandalf', 'Mithrandir', '11997546521', '14785236987', 0, 'De buenas', ''
),
(
	'Gollum', 'Smeagol', '11985632147', '12345678987', 1, 'Suave', ''
),
(
	'Israel', 'Alves', '11972757721', '36219636856', 0, 'Coluna doendo', ''
);

INSERT INTO consulta
(
	titulo, evolucao, dataConsulta, horaInicio, horaTermino, idCliente, nivelDor
)
VALUES
(
	'Consulta E', 'Piorando', 32132654, 12354654, 2546987, 12, 0
),
(
	'Consulta F', 'Melhorando', 98794621, 123544698, 546987, 9, 1
),
(
	'Consulta G', 'Na mesma', 321341655, 123554698, 2146987, 10, 2
),
(
	'Consulta H', 'Humpf', 32132654, 123548, 21316987, 11, 0
);

SELECT * FROM consulta;
SELECT * FROM cliente;

SELECT *
FROM
	consulta cst
    JOIN cliente clt
		ON clt.id = cst.idCliente











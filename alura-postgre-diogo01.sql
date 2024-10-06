/*INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
); VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

SELECT * FROM aluno

UPDATE aluno
    SET nome = 'Carlos Gabriel',
    cpf = '10987654321',
    observacao = 'Nossaaaaa, que maneiro',
    idade = 20,
    dinheiro = 5.23,
    altura = 1.90,
    ativo = TRUE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1;  

SELECT nome AS "Nome do Aluno",
	   idade,
	   matriculado_em AS "Quando se matriculou"
FROM aluno;

 INSERT INTO aluno (nome) VALUES ('Ladybug');
INSERT INTO aluno (nome) VALUES ('Catnoar');
INSERT INTO aluno (nome) VALUES ('Josey Wales');
INSERT INTO aluno (nome) VALUES ('Carlos Rafael Da Silva');

SELECT *
 FROM aluno
 WHERE nome LIKE '% %';

SELECT *
 FROM aluno
 WHERE idade BETWEEN 10 AND 40

SELECT *
 FROM aluno
 WHERE nome LIKE 'C%r'
    OR nome LIKE 'L%';
*/
DROP TABLE aluno;
DROP TABLE curso;
DROP TABLE aluno_curso;

	Create TABLE curso(
	id integer PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
	);

	INSERT INTO curso(id, nome) VALUES (1, 'JavaScript');
	INSERT INTO curso(id, nome) VALUES (2, 'Java');


SELECT * FROM curso;
SELECT * FROM aluno;
SELECT * FROM aluno_curso;

CREATE TABLE aluno(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno(nome) VALUES ('Bolsonaro');
INSERT INTO aluno(nome) VALUES ('Lula');

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (curso_id, aluno_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),

	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);


SELECT aluno.nome AS aluno,
	   curso.nome AS curso
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso       ON curso.id             = aluno_curso.curso_id

  INSERT INTO aluno_curso(aluno_id, curso_id) VALUES (2, 2);

  INSERT INTO aluno (nome) VALUES ('Zoro');

  INSERT INTO curso (id, nome) VALUES (3, 'VSCODE');

SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id;


SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id;


SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id;


SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
CROSS JOIN curso;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
     ON DELETE CASCADE
	 ON UPDATE CASCADE,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)

);

SELECT 
	   aluno.id   as "Id do Aluno",
	   aluno.nome as "Nome do Aluno",
	   curso.id   as "Id do Curso",
       curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso       ON curso.id             = aluno_curso.curso_id;



	DELETE FROM aluno WHERE id = 4;

	UPDATE aluno
    SET id = 2
    WHERE id = 10;

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

SELECT *
FROM funcionarios
ORDER BY 4 DESC, funcionarios.nome DESC, 2 ASC;


SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome

SELECT *
  FROM funcionarios
  ORDER BY id
 LIMIT 5
OFFSET 10;

SELECT COUNT (id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id),0)
  FROM funcionarios;

  SELECT curso.nome,
        COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1;


	SELECT DISTINCT
        nome
  FROM funcionarios
  ORDER BY nome;

  SELECT curso.nome,
        COUNT (aluno.id)
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
    --WHERE curso.nome = 'Javascritp'
GROUP BY 1
    HAVING COUNT (aluno.id) = 0
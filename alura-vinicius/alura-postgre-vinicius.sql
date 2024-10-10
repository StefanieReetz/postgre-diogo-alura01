SELECT * FROM curso;
SELECT * FROM categoria;

SELECT id FROM categoria WHERE nome NOT LIKE '% %';


SELECT curso.nome FROM curso WHERE categoria_id IN (
SELECT id FROM categoria WHERE nome LIKE '% %'
);
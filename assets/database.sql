-- SCHEMA : Estrutura de tabelas do projeto

-- Tabela de salas
CREATE TABLE salas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT,
  capacidade INTEGER,
  recursos TEXT,
  numero TEXT,
  localizacao TEXT,
  disponivel INTEGER 
);

-- Tabela de cursos
CREATE TABLE cursos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome_curso TEXT,
  data_inicio TEXT,
  data_fim TEXT,
  turno TEXT,
  professor TEXT,
  codigo_sig TEXT
);

-- Tabela de reservas
CREATE TABLE reservas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_curso INTEGER,
  id_sala INTEGER,
  
  FOREIGN KEY (id_curso) REFERENCES cursos(id),
  FOREIGN KEY (id_sala) REFERENCES salas(id)
);

-- QUERIES: Operações do banco de dados

INSERT INTO salas( nome, capacidade, recursos, numero, localizacao, disponivel)
	VALUES('Lab Mac', 11, 'Computadores iMac 2019, Smart TV',  '209', '2º Piso', 1);

SELECT *
FROM salas;

INSERT INTO cursos(nome_curso, data_inicio, data_fim, turno, professor, codigo_sig)
	VALUES('Programador de Dispositivos Móveis', '06/02/2026', '18/05/2026', 'T', 'Patrick Macelo', '2026.7.54');

SELECT *
FROM cursos;

INSERT INTO reservas(id_curso, id_sala)
	VALUES (1, 1);

SELECT *
FROM reservas;

SELECT *
FROM salas,cursos,reservas
WHERE salas.id = reservas.id_sala
AND cursos.id = reservas.id_curso;

SELECT salas.nome, cursos.nome_curso
FROM salas,cursos,reservas
WHERE salas.id = reservas.id_sala
AND cursos.id = reservas.id_curso;

SELECT *
FROM reservas
	INNER JOIN salas ON salas.id = reservas.id_sala
    INNER JOIN cursos ON cursos.id = reservas.id_curso;

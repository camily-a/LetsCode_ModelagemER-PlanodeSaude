CREATE TABLE cliente (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	nome varchar(100) NOT NULL,
	data_nascimento date NOT NULL, 
	email varchar(100) NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (id)	
)

CREATE TABLE dependente (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_titular int NOT NULL,
	id_dependente int NOT NULL,
	CONSTRAINT dependente_pk PRIMARY KEY (id),
	CONSTRAINT titular_fk FOREIGN KEY (id_titular) REFERENCES cliente(id),
	CONSTRAINT dependente_fk FOREIGN KEY (id_dependente) REFERENCES cliente(id)
)

CREATE TABLE contrato (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_titular int NOT NULL,
	data_inicio date NOT NULL,
	CONSTRAINT contrato_pk PRIMARY KEY (id),
	CONSTRAINT titular_fk FOREIGN KEY (id_titular) REFERENCES cliente(id)
)

CREATE TABLE produto (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	cod_ans int NOT NULL,
	descricao varchar(250) NOT NULL,
	valor money NOT NULL,
	CONSTRAINT produto_pk PRIMARY KEY (id)
)

-- tabela associativa
CREATE TABLE produtos_contrato (
	id_contrato int NOT NULL,
	id_produto int NOT NULL,
	CONSTRAINT contrato_fk FOREIGN KEY (id_contrato) REFERENCES contrato(id),
	CONSTRAINT produto_fk FOREIGN KEY (id_produto) REFERENCES produto(id)
)
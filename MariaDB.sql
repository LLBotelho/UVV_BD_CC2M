CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo VARCHAR(1),
                salario NUMERIC(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                PRIMARY KEY (cpf),
               
);


COMMENT ON TABLE funcionario
IS 'tabela criada para funcionarios';

COMMENT ON COLUMN funcionario.cpf
Is 'chave primaria da tabela';

COMMENT ON COLUMN funcionario.cpf_supervisor
Is 'chave estrangeira da tabela';



CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
               
);

COMMENT ON TABLE dependentes
IS 'tabela criada para dependentes';

COMMENT ON COLUMN dependentes.nome_dependente
Is 'chave primaria da tabela';

COMMENT ON COLUMN dependentes.cpf_funcionario
Is 'chave composta da tabela';





CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
               
);


COMMENT ON TABLE departamento
IS 'tabela criada para departamentos';

COMMENT ON COLUMN departamento.numero_departamento
Is 'chave primaria da tabela';

COMMENT ON COLUMN departamento.cpf_gerente
Is 'chave estrangeira da tabela';

COMMENT ON COLUMN departamento.nome_departamento
Is 'chave unica da tabela';




CREATE UNIQUE INDEX nome_departamento
ON departamento
(nome_departamento);



CREATE TABLE localizacoes_departamento (
                numero_departamento INTEGER NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY(numero_departamento, local)
               
);


COMMENT ON TABLE localizacoes_departamento
IS 'tabela criada para as localizações dos departamentos';

COMMENT ON COLUMN localizacoes_departamento.local
Is 'chave primaria da tabela';

COMMENT ON COLUMN localizacoes_departamento.numero_departamento
Is 'chave composta da tabela';



CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                local_projeto VARCHAR(15),
                PRIMARY KEY (numero_projeto)
);


COMMENT ON TABLE projeto
IS 'tabela criada para os projetos
COMMENT ON COLUMN projeto.numero_projeto
Is 'chave primaria da tabela';
COMMENT ON COLUMN projeto.numero_departamento
Is 'chave estrangeira da tabela';
COMMENT ON COLUMN projeto.nome_projeto
Is 'chave unica da tabela';



CREATE UNIQUE INDEX nome_projeto
ON projeto
(nome_projeto);


CREATE TABLE trabalha_em (

                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL,
                horas NUMERIC(3,1) NOT NULL,
                PRIMARY KEY(cpf_funcionario, numero_projeto),
               
                
);

COMMENT ON TABLE trabalha_em
IS 'tabela criada para os projetos
COMMENT ON COLUMN trabalha_em.cpf_funcionario
Is 'chave primaria da tabela';
COMMENT ON COLUMN trabalha_em.numero_projeto
Is 'chave primaria da tabela';
COMMENT ON COLUMN trabalha_em.cpf_funcionario
Is 'chave estrangeira da tabela';
COMMENT ON COLUMN trabalha_em.numero_projeto
Is 'chave estrangeira da tabela';




ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;





INSERT INTO funcionario
(primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES
('joao','B', 'silva', '12345678966', '09-01-1965', 'Rua das Flores 751 São Paulo SP', 'M', 30.000, '33344555587', 5);
('Fernando','T', 'Wong', '33344555587', '08-12-1955', 'Rua das Lapa 34 São Paulo SP', 'M', 40.000, '88866555576', 5);
('Alice','J', 'Zelaya', '99988777767', '19-01-1968', 'Rua SOuza Lima 35 Curitiba PR', 'F', 25.000, '98765432168', 4);
('Jeniffer','S', 'Souza', '98765432168', '20-06-1941', 'Av Arthur de Lima 54 Santo Andre SP', 'F', 43.000, '88866555576', 4);
('Ronaldo','K', 'Lima', '66688444476', '15-09-1965', 'Rua Rebouças 65 Piracicaba SP', 'M', 38.000, '33344555587', 5);
('Joice','A', 'Leite', '45345345376', '31-07-1972', 'Av Lucas Obes 74 São Paulo SP', 'F', 25.000, '33344555587', 5);
('André','V', 'Pereira', '98798798733', '29-03-1969', 'Rua Timbira 35 São Paulo SP', 'M', 25.000, '98765432168', 4);
('Jorge','E', 'Brito', '88866555576', '10-11-1937', 'Rua do Horto 35 São Paulo SP', 'M', 55.000, 'null', 1);


--Dados tabela dependentes:

INSERT INTO dependente
(cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES
('33344555587', 'Alicia', F, 05-04-1986, 'Filha');
('33344555587', 'Tiago', M, 05-04-1983, 'Filho');
('33344555587', 'Janaina', F, 05-04-1958, 'Esposa');
('98765432168', 'Antonio', M, 05-04-1942, 'Marido');
('12345678966', 'Michael', M, 05-04-1988, 'Filho');
('12345678966', 'Alicia', F, 05-04-1988, 'Filha');
('12345678966', 'Elizabeth', F, 05-05-1967, 'Esposa');


--Dados tabela departamento:

INSERT INTO.departamento
(nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES
('Pesquisa', 5, '33344555587', 22-05-1988);
('Administração', 4, '98765432168', 01-01-1995);
('Matriz', 1, '88866555576', 19-06-1981);


--Dados tabela localizacoes_departamento:

INSERT INTO localizacoes_departamento
(numero_departamtno, local)
VALUES
(1, 'São Paulo');
(4, 'Mauá');
(5, 'Santo Andre');
(5, 'Itu');
(5, 'São Paulo');


--Dados tabela projeto:

INSERT INTO projeto
(nome_projeto, numero_projeto, local_projeto, numero_projeto)
VALUES
('ProdutoX', 1, 'Santo André', 5);
('ProdutoY', 2, 'Itu', 5);
('ProdutoZ', 3, 'São Paulo', 5);
('Informatização', 10, 'Mauá', 4);
('Reorganização', 20, 'São Paulo', 1);
('Novosbenefícios', 30, 'Mauá', 4);


--Dados tabela trabalha_em:

INSERT INTO trabalha_em
(cpf_funcionario, numero_projeto, horas)
VALUES
('1234567866', 1, 32,5);
('1234567866', 2, 7,5);
('66688444476', 3, 40);
('45345345376', 1, 20);
('45345345376', 2, 20);
('33344555587', 2, 10);
('33344555587', 3, 10);
('33344555587', 10, 10);
('33344555587', 20, 10);
('99988777767', 30, 30);
('99988777767', 10, 10);
('98798798733', 10, 35);
('98798798733', 30, 5);
('98765432168', 30, 20);
('98765432168', 20, 15);
('88866555576', 20, null);



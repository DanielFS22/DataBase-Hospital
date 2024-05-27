CREATE DATABASE IF NOT EXISTS Hospital;
USE Hospital;

CREATE TABLE IF NOT EXISTS medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome_medico VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    crm VARCHAR(20),
    cargo VARCHAR(100),
    especialidade VARCHAR(100)
);

-- Tabela cadastro_paciente
CREATE TABLE IF NOT EXISTS cadastro_paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome_paciente VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_de_nascimento DATE NOT NULL,
    telefone_paciente VARCHAR(14),
    endereco_paciente VARCHAR(255)
);


-- Tabela quarto
CREATE TABLE IF NOT EXISTS quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL UNIQUE,
    tipo_quarto ENUM('apartamento', 'quarto duplo', 'enfermaria') NOT NULL,
    valor_diaria DECIMAL(10, 2) NOT NULL
);

-- Tabela internacao
CREATE TABLE IF NOT EXISTS internacao (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prevista_alta DATE,
    data_efetiva_alta DATE,
    descricao_procedimentos TEXT,
    id_paciente INT,
    id_medico INT,
    id_quarto INT,
    FOREIGN KEY (id_paciente) REFERENCES cadastro_paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto)
);

CREATE TABLE IF NOT EXISTS enfermeiro (
    id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome_enfermeiro VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cre VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS internacao_enfermeiro (
    internacao_id INT,
    enfermeiro_id INT,
    PRIMARY KEY (internacao_id, enfermeiro_id),
    FOREIGN KEY (internacao_id) REFERENCES internacao(id_internacao),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id_enfermeiro)
);

CREATE TABLE IF NOT EXISTS especialidade_medica (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_especialidade VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS medico_especialidade (
    id_medico INT,
    id_especialidade INT,
    PRIMARY KEY (id_medico, id_especialidade),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade_medica(id_especialidade)
);

CREATE TABLE IF NOT EXISTS registro_de_consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_da_consulta DATE,
    medico_da_consulta INT,
    paciente_consulta INT,
    valor_da_consulta DECIMAL(10, 2),
    nome_do_convenio VARCHAR(255),
    especialidade_buscada_pelo_paciente VARCHAR(255),
    FOREIGN KEY (medico_da_consulta) REFERENCES medico(id_medico),
    FOREIGN KEY (paciente_consulta) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE IF NOT EXISTS receita_medica (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    medicamento VARCHAR(255) NOT NULL,
    quantidade_medicamento INT NOT NULL,
    instrucao_de_uso TEXT,
    consulta_fk INT,
    FOREIGN KEY (consulta_fk) REFERENCES registro_de_consulta(id_consulta)
);

CREATE TABLE IF NOT EXISTS cadastro_convenio (
    data_da_consulta DATE,
    id_medico INT,
    id_paciente INT,
    valor_consulta DECIMAL(10, 2),
    nome_convenio VARCHAR(255),
    especialidade_buscada_pelo_paciente VARCHAR(255),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE IF NOT EXISTS documentos (
    cpf VARCHAR(14) PRIMARY KEY,
    rg VARCHAR(20),
    convenio VARCHAR(255)
);




-- Médicos
INSERT INTO medico (nome_medico, cpf, telefone, data_nascimento, crm, cargo, especialidade) VALUES
('Dr. João Silva', '111.111.111-11', '11999999991', '1975-06-15', 'CRM-12345', 'Chefe de Pediatria', 'Pediatria'),
('Dra. Maria Oliveira', '222.222.222-22', '21999999992', '1980-08-22', 'CRM-23456', 'Clínica Geral', 'Clínica Geral'),
('Dr. Pedro Santos', '333.333.333-33', '31999999993', '1985-03-11', 'CRM-34567', 'Gastroenterologista', 'Gastroenterologia'),
('Dra. Ana Lima', '444.444.444-44', '41999999994', '1990-12-05', 'CRM-45678', 'Dermatologista', 'Dermatologia'),
('Dr. Carlos Pereira', '555.555.555-55', '51999999995', '1972-09-23', 'CRM-56789', 'Ortopedista', 'Ortopedia'),
('Dra. Fernanda Costa', '666.666.666-66', '61999999996', '1978-01-30', 'CRM-67890', 'Neurologista', 'Neurologia'),
('Dr. Rafael Souza', '777.777.777-77', '71999999997', '1982-11-18', 'CRM-78901', 'Cardiologista', 'Cardiologia'),
('Dra. Juliana Martins', '888.888.888-88', '81999999998', '1987-05-09', 'CRM-89012', 'Clínica Geral', 'Clínica Geral'),
('Dr. Paulo Almeida', '999.999.999-99', '91999999999', '1976-02-28', 'CRM-90123', 'Endocrinologista', 'Endocrinologia'),
('Dra. Laura Rodrigues', '000.000.000-00', '10999999990', '1983-07-14', 'CRM-01234', 'Ginecologista', 'Ginecologia');

-- Pacientes
INSERT INTO cadastro_paciente (nome_paciente, cpf, data_de_nascimento, telefone_paciente, endereco_paciente) VALUES
('Ana Paula', '111.111.111-11', '1980-01-01', '11999999991', 'Rua A, 123'),
('Bruno Silva', '222.222.222-22', '1982-02-02', '11999999992', 'Rua B, 234'),
('Carla Souza', '333.333.333-33', '1984-03-03', '11999999993', 'Rua C, 345'),
('Daniel Lima', '444.444.444-44', '1986-04-04', '11999999994', 'Rua D, 456'),
('Eduarda Santos', '555.555.555-55', '1988-05-05', '11999999995', 'Rua E, 567'),
('Fernando Costa', '666.666.666-66', '1990-06-06', '11999999996', 'Rua F, 678'),
('Gabriela Pereira', '777.777.777-77', '1992-07-07', '11999999997', 'Rua G, 789'),
('Henrique Almeida', '888.888.888-88', '1994-08-08', '11999999998', 'Rua H, 890'),
('Isabela Martins', '999.999.999-99', '1996-09-09', '11999999999', 'Rua I, 901'),
('Jorge Rodrigues', '000.000.000-00', '1998-10-10', '11999999990', 'Rua J, 012'),
('Karla Lima', '111.111.111-12', '2000-11-11', '11999999911', 'Rua K, 123'),
('Lucas Souza', '222.222.222-23', '2002-12-12', '11999999912', 'Rua L, 234'),
('Mariana Silva', '333.333.333-34', '2004-01-01', '11999999913', 'Rua M, 345'),
('Nathalia Costa', '444.444.444-45', '2006-02-02', '11999999914', 'Rua N, 456'),
('Otávio Pereira', '555.555.555-56', '2008-03-03', '11999999915', 'Rua O, 567');


-- Quartos
INSERT INTO quarto (numero, tipo_quarto, valor_diaria) VALUES
('101', 'apartamento', 200.00),
('102', 'quarto duplo', 150.00),
('103', 'enfermaria', 100.00);

-- Internações
INSERT INTO internacao (data_entrada, data_prevista_alta, data_efetiva_alta, descricao_procedimentos, id_paciente, id_medico, id_quarto) VALUES
('2020-01-01', '2020-01-10', '2020-01-09', 'Cirurgia de apendicite', 1, 1, 1),
('2020-02-01', '2020-02-05', '2020-02-04', 'Tratamento de pneumonia', 2, 2, 2),
('2020-03-01', '2020-03-07', '2020-03-06', 'Fratura de perna', 3, 3, 3),
('2020-04-01', '2020-04-08', '2020-04-07', 'Infecção urinária', 4, 4, 1),
('2020-05-01', '2020-05-04', '2020-05-03', 'Observação pós-operatória', 5, 5, 2),
('2020-06-01', '2020-06-10', '2020-06-09', 'Tratamento de diabetes', 6, 6, 3),
('2020-07-01', '2020-07-14', '2020-07-13', 'Cirurgia de vesícula', 7, 7, 1),
('2020-08-01', '2020-08-11', '2020-08-10', 'Tratamento de asma', 8, 8, 2);

-- Internação e Enfermeiro
INSERT INTO internacao_enfermeiro (internacao_id, enfermeiro_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5), (3, 6),
(4, 7), (4, 8),
(5, 9), (5, 10),
(6, 1), (6, 2),
(7, 3), (7, 4),
(8, 5), (8, 6);

-- Consultas
INSERT INTO registro_de_consulta (data_da_consulta, medico_da_consulta, paciente_consulta, valor_da_consulta, nome_do_convenio, especialidade_buscada_pelo_paciente) VALUES
('2020-01-01', 1, 1, 100.00, 'Amil', 'Pediatria'),
('2020-01-02', 2, 2, 150.00, 'Bradesco', 'Clínica Geral'),
('2020-01-03', 3, 3, 200.00, 'Unimed', 'Gastroenterologia'),
('2020-01-04', 4, 4, 250.00, 'SulAmérica', 'Dermatologia'),
('2020-01-05', 5, 5, 300.00, 'Amil', 'Ortopedia'),
('2020-01-06', 6, 6, 350.00, 'Bradesco', 'Neurologia'),
('2020-01-07', 7, 7, 400.00, 'Unimed', 'Cardiologia'),
('2020-01-08', 8, 8, 450.00, 'SulAmérica', 'Clínica Geral'),
('2020-01-09', 9, 9, 500.00, 'Amil', 'Endocrinologia'),
('2020-01-10', 10, 10, 550.00, 'Bradesco', 'Ginecologia'),
('2020-01-11', 1, 2, 600.00, 'Unimed', 'Pediatria'),
('2020-01-12', 2, 3, 650.00, 'SulAmérica', 'Clínica Geral'),
('2020-01-13', 3, 4, 700.00, 'Amil', 'Gastroenterologia'),
('2020-01-14', 4, 5, 750.00, 'Bradesco', 'Dermatologia'),
('2020-01-15', 5, 6, 800.00, 'Unimed', 'Ortopedia'),
('2020-01-16', 6, 7, 850.00, 'SulAmérica', 'Neurologia'),
('2020-01-17', 7, 8, 900.00, 'Amil', 'Cardiologia'),
('2020-01-18', 8, 9, 950.00, 'Bradesco', 'Clínica Geral'),
('2020-01-19', 9, 10, 1000.00, 'Unimed', 'Endocrinologia'),
('2020-01-20', 10, 1, 1050.00, 'SulAmérica', 'Ginecologia');

-- Receitas Médicas
INSERT INTO receita_medica (medicamento, quantidade_medicamento, instrucao_de_uso, consulta_fk) VALUES
('Medicamento A', 2, 'Tomar 2x ao dia', 1),
('Medicamento B', 1, 'Tomar 1x ao dia', 1),
('Medicamento C', 3, 'Tomar 3x ao dia', 2),
('Medicamento D', 2, 'Tomar 2x ao dia', 2),
('Medicamento E', 1, 'Tomar 1x ao dia', 3),
('Medicamento F', 2, 'Tomar 2x ao dia', 3),
('Medicamento G', 1, 'Tomar 1x ao dia', 4),
('Medicamento H', 2, 'Tomar 2x ao dia', 4),
('Medicamento I', 1, 'Tomar 1x ao dia', 5),
('Medicamento J', 2, 'Tomar 2x ao dia', 5),
('Medicamento K', 1, 'Tomar 1x ao dia', 6),
('Medicamento L', 2, 'Tomar 2x ao dia', 6),
('Medicamento M', 1, 'Tomar 1x ao dia', 7),
('Medicamento N', 2, 'Tomar 2x ao dia', 7),
('Medicamento O', 1, 'Tomar 1x ao dia', 8),
('Medicamento P', 2, 'Tomar 2x ao dia', 8),
('Medicamento Q', 1, 'Tomar 1x ao dia', 9),
('Medicamento R', 2, 'Tomar 2x ao dia', 9),
('Medicamento S', 1, 'Tomar 1x ao dia', 10),
('Medicamento T', 2, 'Tomar 2x ao dia', 10);

-- Convênios
INSERT INTO cadastro_convenio (data_da_consulta, id_medico, id_paciente, valor_consulta, nome_convenio, especialidade_buscada_pelo_paciente) VALUES
('2020-01-01', 1, 1, 100.00, 'Amil', 'Pediatria'),
('2020-01-02', 2, 2, 150.00, 'Bradesco', 'Clínica Geral'),
('2020-01-03', 3, 3, 200.00, 'Unimed', 'Gastroenterologia'),
('2020-01-04', 4, 4, 250.00, 'SulAmérica', 'Dermatologia'),
('2020-01-05', 5, 5, 300.00, 'Amil', 'Ortopedia'),
('2020-01-06', 6, 6, 350.00, 'Bradesco', 'Neurologia'),
('2020-01-07', 7, 7, 400.00, 'Unimed', 'Cardiologia'),
('2020-01-08', 8, 8, 450.00, 'SulAmérica', 'Clínica Geral'),
('2020-01-09', 9, 9, 500.00, 'Amil', 'Endocrinologia'),
('2020-01-10', 10, 10, 550.00, 'Bradesco', 'Ginecologia');

-- Inserção dos Dados de Especialidades Médicas
INSERT INTO especialidade_medica (nome_especialidade) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastroenterologia'),
('Dermatologia'),
('Ortopedia'),
('Neurologia'),
('Cardiologia'),
('Endocrinologia'),
('Ginecologia');

-- Relacionamento entre Médico e Especialidade
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 2),
(9, 8),
(10, 9);

-- Enfermeiros
INSERT INTO enfermeiro (nome_enfermeiro, cpf, cre, telefone) VALUES
('Enfermeiro 1', '111.111.111-11', 'CRE-001', '11999999901'),
('Enfermeiro 2', '222.222.222-22', 'CRE-002', '11999999902'),
('Enfermeiro 3', '333.333.333-33', 'CRE-003', '11999999903'),
('Enfermeiro 4', '444.444.444-44', 'CRE-004', '11999999904'),
('Enfermeiro 5', '555.555.555-55', 'CRE-005', '11999999905'),
('Enfermeiro 6', '666.666.666-66', 'CRE-006', '11999999906'),
('Enfermeiro 7', '777.777.777-77', 'CRE-007', '11999999907'),
('Enfermeiro 8', '888.888.888-88', 'CRE-008', '11999999908'),
('Enfermeiro 9', '999.999.999-99', 'CRE-009', '11999999909'),
('Enfermeiro 10', '000.000.000-00', 'CRE-010', '11999999910');



ALTER TABLE medico
ADD COLUMN em_atividade BOOLEAN DEFAULT TRUE;

-- Atualizar dois médicos como inativos (Dr. João Silva e Dra. Maria Oliveira)
UPDATE medico 
SET em_atividade = FALSE
WHERE cpf IN ('111.111.111-11', '222.222.222-22');

-- Atualizar os outros médicos como ativos
UPDATE medico 
SET em_atividade = TRUE
WHERE cpf NOT IN ('111.111.111-11', '222.222.222-22');


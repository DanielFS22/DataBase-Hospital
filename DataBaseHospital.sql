create database Hospital;
USE Hospital;

USE Hospital;

CREATE TABLE cadastro_paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome_paciente VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_de_nascimento DATE NOT NULL,
    telefone_paciente VARCHAR(14),
    endereco_paciente VARCHAR(255)
);

CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome_medico VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    crm VARCHAR(20),
    cargo VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL UNIQUE,
    tipo_quarto ENUM('apartamento', 'quarto duplo', 'enfermaria') NOT NULL,
    valor_diaria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE enfermeiro (
    id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome_enfermeiro VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cre VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE internacao (
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

CREATE TABLE internacao_enfermeiro (
    internacao_id INT,
    enfermeiro_id INT,
    PRIMARY KEY (internacao_id, enfermeiro_id),
    FOREIGN KEY (internacao_id) REFERENCES internacao(id_internacao),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id_enfermeiro)
);

CREATE TABLE especialidade_medica (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_especialidade VARCHAR(255) NOT NULL
);

CREATE TABLE registro_de_consulta (
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

CREATE TABLE receita_medica (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    medicamento VARCHAR(255) NOT NULL,
    quantidade_medicamento INT NOT NULL,
    instrucao_de_uso TEXT,
    consulta_fk INT,
    FOREIGN KEY (consulta_fk) REFERENCES registro_de_consulta(id_consulta)
);

CREATE TABLE cadastro_convenio (
    data_da_consulta DATE,
    id_medico INT,
    id_paciente INT,
    valor_consulta DECIMAL(10, 2),
    nome_convenio VARCHAR(255),
    especialidade_buscada_pelo_paciente VARCHAR(255),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE documentos (
    cpf VARCHAR(14) PRIMARY KEY,
    rg VARCHAR(20),
    convenio VARCHAR(255)
);

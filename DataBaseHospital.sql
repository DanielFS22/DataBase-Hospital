create database Hospital;
USE Hospital;

CREATE TABLE cadastro_paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome_paciente VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Data_de_nascimento DATE NOT NULL,
    telefone_paciente VARCHAR(14),
    endereco_paciente VARCHAR(255)
);

CREATE TABLE Medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome_medico VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    data_nascimento DATE NOT NULL,
    crm VARCHAR(20),
    cargo VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL UNIQUE,
    tipo_quarto ENUM('apartamento', 'Quarto Duplo', 'enfermaria') NOT NULL,
    Valor_diaria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Enfermeiro (
    id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome_enfermeiro VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    CRE VARCHAR(20) NOT NULL UNIQUE,
    Telefone VARCHAR(20)
);

CREATE TABLE Internacao (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prevista_alta DATE,
    data_efetiva_alta DATE,
    descricao_procedimentos TEXT,
    id_paciente INT,
    id_medico INT,
    id_quarto INT,
    FOREIGN KEY (id_paciente) REFERENCES cadastro_paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto)
);

CREATE TABLE Internacao_Enfermeiro (
    internacao_id INT,
    enfermeiro_id INT,
    PRIMARY KEY (internacao_id, enfermeiro_id),
    FOREIGN KEY (internacao_id) REFERENCES Internacao(id_internacao),
    FOREIGN KEY (enfermeiro_id) REFERENCES Enfermeiro(id_enfermeiro)
);

CREATE TABLE telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    DDD VARCHAR(3) NOT NULL,
    telefone_numero VARCHAR(20) NOT NULL,
    medico_id INT,
    paciente_id INT,
    FOREIGN KEY (medico_id) REFERENCES Medico(id_medico),
    FOREIGN KEY (paciente_id) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE endereco (
    endereco_id INT AUTO_INCREMENT PRIMARY KEY,
    telefone_id INT,
    logradouro VARCHAR(255) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    medico_fk INT,
    paciente_fk INT,
    FOREIGN KEY (telefone_id) REFERENCES telefone(id_telefone),
    FOREIGN KEY (medico_fk) REFERENCES Medico(id_medico),
    FOREIGN KEY (paciente_fk) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE especialidade_medica (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_especialidade VARCHAR(255) NOT NULL
);

CREATE TABLE Registro_de_consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_da_consulta DATE,
    medico_da_consulta INT,
    paciente_consulta INT,
    valor_da_consulta DECIMAL(10, 2),
    nome_do_convenio VARCHAR(255),
    especialidade_buscada_pelo_paciente VARCHAR(255),
    FOREIGN KEY (medico_da_consulta) REFERENCES Medico(id_medico),
    FOREIGN KEY (paciente_consulta) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE Receita_medica (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    medicamento VARCHAR(255) NOT NULL,
    quantidade_medicamento INT NOT NULL,
    instrucao_de_uso TEXT,
    consulta_fk INT,
    FOREIGN KEY (consulta_fk) REFERENCES Registro_de_consulta(id_consulta)
);

CREATE TABLE cadastro_convenio (
    data_da_consulta DATE,
    id_medico INT,
    id_paciente INT,
    valor_consulta DECIMAL(10, 2),
    nome_convenio VARCHAR(255),
    especialidade_buscada_pelo_paciente VARCHAR(255),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES cadastro_paciente(id_paciente)
);

CREATE TABLE documentos (
    CPF VARCHAR(14) PRIMARY KEY,
    RG VARCHAR(20),
    convenio VARCHAR(255)
);


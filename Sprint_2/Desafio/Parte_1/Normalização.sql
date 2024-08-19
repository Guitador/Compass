Tabela clientes: CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY,
    nomeCliente VARCHAR(100),
    cidadeCliente VARCHAR(40),
    estadoCliente VARCHAR(40),
    paisCliente VARCHAR(40)
);

Carros: CREATE TABLE Carros (
    idCarro INT PRIMARY KEY,
    kmCarro INT,
    classiCarro VARCHAR(50),
    marcaCarro VARCHAR(80),
    modeloCarro VARCHAR(80),
    anoCarro INT
);

Combustível: CREATE TABLE Combustivel (
    idcombustivel INT PRIMARY KEY,
    tipoCombustivel VARCHAR(20)
);

Vendedores: CREATE TABLE Vendedores (
    idVendedor INT PRIMARY KEY,
    nomeVendedor VARCHAR(15),
    sexoVendedor SMALLINT,
    estadoVendedor VARCHAR(40)
);

Locações: CREATE TABLE Locacoes (
    idLocacao INT PRIMARY KEY,
    idCliente INT,
    idCarro INT,
    idcombustivel INT,
    dataLocacao DATETIME,
    horaLocacao TIME,
    qtdDiaria INT,
    vlrDiaria DECIMAL(18,2),
    dataEntrega DATE,
    horaEntrega TIME,
    idVendedor INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idCarro) REFERENCES Carros(idCarro),
    FOREIGN KEY (idcombustivel) REFERENCES Combustivel(idcombustivel),
    FOREIGN KEY (idVendedor) REFERENCES Vendedores(idVendedor)
);

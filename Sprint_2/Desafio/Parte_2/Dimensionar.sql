Cliente: CREATE TABLE Dim_Cliente (
    idCliente INT PRIMARY KEY,
    nomeCliente VARCHAR(100),
    cidadeCliente VARCHAR(40),
    estadoCliente VARCHAR(40),
    paisCliente VARCHAR(40)
);

Carro: CREATE TABLE Dim_Carro (
    idCarro INT PRIMARY KEY,
    classiCarro VARCHAR(50),
    marcaCarro VARCHAR(80),
    modeloCarro VARCHAR(80),
    anoCarro INT
);

Combustível: CREATE TABLE Dim_Combustivel (
    idCombustivel INT PRIMARY KEY,
    tipoCombustivel VARCHAR(20)
);


Vendedor: CREATE TABLE Dim_Vendedor (
    idVendedor INT PRIMARY KEY,
    nomeVendedor VARCHAR(15),
    sexoVendedor SMALLINT,
    estadoVendedor VARCHAR(40)
);

Tempo: (Usando a data e hora da locação como dimensões temporais) CREATE TABLE Dim_Tempo (
    idTempo INT PRIMARY KEY,
    dataLocacao DATE,
    horaLocacao TIME,
    dataEntrega DATE,
    horaEntrega TIME
);

2. Tabela de Fatos
Fato_Locacao: CREATE TABLE Fato_Locacao (
    idLocacao INT PRIMARY KEY,
    idCliente INT,
    idCarro INT,
    idCombustivel INT,
    idTempo INT,
    idVendedor INT,
    qtdDiaria INT,
    vlrDiaria DECIMAL(18,2),
    FOREIGN KEY (idCliente) REFERENCES Dim_Cliente(idCliente),
    FOREIGN KEY (idCarro) REFERENCES Dim_Carro(idCarro),
    FOREIGN KEY (idCombustivel) REFERENCES Dim_Combustivel(idCombustivel),
    FOREIGN KEY (idTempo) REFERENCES Dim_Tempo(idTempo),
    FOREIGN KEY (idVendedor) REFERENCES Dim_Vendedor(idVendedor)
);



CREATE TABLE Pasajeros(
    ID INT NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    CiudadaniaPais VARCHAR(50) NOT NULL,
    PaisResidencia VARCHAR(50) NOT NULL,
    NumeroPasaporte VARCHAR(20) NOT NULL,
    Creado DATETIME NOT NULL,
    Actualizado DATETIME NOT NULL,
    CONSTRAINT PK_Pasajeros_ID PRIMARY KEY CLUSTERED (ID)
) 

CREATE TABLE Aeropuerto(
    ID INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Creado DATETIME NOT NULL,
    Actualizado  DATETIME NOT NULL,
    CONSTRAINT PK_Aeropuerto_ID PRIMARY KEY CLUSTERED (ID)
)

CREATE TABLE Aerolinea(
    ID INT NOT NULL,
    CodigoAerolinea INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Creado DATETIME NOT NULL,
    Actualizado  DATETIME NOT NULL,
    CONSTRAINT PK_Aerolinea_ID PRIMARY KEY CLUSTERED (ID)
)

CREATE TABLE Reserva(
    ReservaID INT NOT NULL,
    VueloID INT NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    PlataformaReserva VARCHAR(20) NOT NULL,
    Creado DATETIME,
    Actualizado DATETIME,
    PasajeroID INT NOT NULL,
    CONSTRAINT PK_Reserva_ReservaID PRIMARY KEY CLUSTERED (ReservaID),
    CONSTRAINT FK_Reserva_Pasajeros FOREIGN KEY (PasajeroID) REFERENCES Pasajeros (ID)
)

CREATE TABLE ControlEquipaje
(
    ID INT NOT NULL,
    Resultado VARCHAR(50) NOT NULL,
    Creado INT NOT NULL,
    Actualizado INT NOT NULL,
    ReservaID INT NOT NULL,
    PasajeroID INT NOT NULL,
    CONSTRAINT PK_ControlEquipaje_ID PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ControlEquipaje_Reserva FOREIGN KEY (ReservaID) REFERENCES Reserva (ReservaID), 
    CONSTRAINT FK_ControlEquipaje_Pasajeros FOREIGN KEY (PasajeroID) REFERENCES Pasajeros (ID) 
)

CREATE TABLE ControlSeguridad(
    ID INT NOT NULL,
    Resultado VARCHAR(20) NOT NULL,
    Comentarios VARCHAR(6553),
    Creado DATETIME NOT NULL,
    Actulizado DATETIME NOT NULL,
    PasajeroID INT NOT NULL,
    CONSTRAINT PK_ControlSeguridad_ID PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ControlSeguridad_Pasajeros FOREIGN KEY (PasajeroID) REFERENCES Pasajeros (ID)
)


CREATE TABLE VetadosVuelos(
    ID INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaTermino  DATE NOT NULL,
    Razon VARCHAR(255) NOT NULL,
    Creado DATETIME NOT NULL,
    Actualizado DATETIME NOT NULL,
    PasajeroID INT,
    CONSTRAINT PK_VetadosVuelos_ID PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_VetadosVuelos_Pasajeros FOREIGN KEY (PasajeroID) REFERENCES Pasajeros (ID)
)


CREATE TABLE Equipaje(
    ID INT NOT NULL,
    PesoKg  DECIMAL(4,2) NOT NULL,
    FechaCreacion DATETIME NOT NULL,
    FechaActualizacion DATETIME NOT NULL,
    ReservaID INT,
    CONSTRAINT PK_Equipaje_ID PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_Equipaje_Reserva FOREIGN KEY (ReservaID) REFERENCES Reserva (ReservaID)
)

CREATE TABLE Vuelos(
    VueloID INT NOT NULL,
    PuertaSalida VARCHAR(20) NOT NULL,
    PuertaLlegada VARCHAR(20) NOT NULL,
    Creado DATETIME NOT NULL,
    Actualizado DATETIME NOT NULL,
    AerolineaID INT,
    AeropuertoSalidaID INT,
    AeropuertoLlegadaID INT,
    CONSTRAINT PK_Vuelos_VueloID PRIMARY KEY CLUSTERED (VueloID),
    CONSTRAINT FK_Vuelos_Aerolinea FOREIGN KEY (AerolineaID) REFERENCES Aerolinea (ID),
    CONSTRAINT FK_Vuelos_Aeropuerto_Salida FOREIGN KEY (AeropuertoSalidaID) REFERENCES Aeropuerto (ID),
    CONSTRAINT FK_Vuelos_Aeropuerto_Llegada FOREIGN KEY (AeropuertoLlegadaID) REFERENCES Aeropuerto (ID)
)

CREATE TABLE ManifiestoVuelo(
    ID INT NOT NULL,
    Creado DATETIME NOT NULL,
    ReservaID INT,
    VueloID INT,
    CONSTRAINT PK_ManifiestoVuelo_ID PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ManifiestoVuelo_Reserva FOREIGN KEY (ReservaID) REFERENCES Reserva (ReservaID),
    CONSTRAINT FK_ManifiestoVuelo_VueloID FOREIGN KEY (VueloID) REFERENCES Vuelos (VueloID)
)

CREATE TABLE PaseAbordar(
    ID INT NOT NULL,
    QRCode VARCHAR(6553),
    Creado DATETIME NOT NULL,
    Actualizado  DATETIME NOT NULL,
    ReservaID INT,
    CONSTRAINT PK_PaseAbordar_ID PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_PaseAbordar_Reserva FOREIGN KEY (ReservaID) REFERENCES Reserva (ReservaID) 
)


-- Verificar las tablas creadas

SELECT *
FROM INFORMATION_SCHEMA.TABLES;
    
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;
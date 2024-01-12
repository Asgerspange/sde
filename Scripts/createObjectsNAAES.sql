use NAAES;
go

CREATE SCHEMA members;
go
CREATE SCHEMA teams;
go
CREATE SCHEMA tournaments;
go

CREATE TABLE members.info (
    id INT IDENTITY (1, 1) PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    mail VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    street VARCHAR(255) NOT NULL,
    birthYear INT NOT NULL,
    role VARCHAR(50)
);

CREATE TABLE members.membership_history (
    id INT IDENTITY (1, 1) PRIMARY KEY,
    memberId INT NOT NULL,
    joinDate DATE NOT NULL,
    leaveDate DATE,
    active INT NOT NULL,
    FOREIGN KEY (memberId) REFERENCES members.info(id)
);

CREATE TABLE teams.games (
    gameID INT IDENTITY (1, 1) PRIMARY KEY,
    gameName VARCHAR(255) NOT NULL
);

CREATE TABLE teams.info (
    teamID INT IDENTITY (1, 1) PRIMARY KEY,
    teamName VARCHAR(255) NOT NULL,
    captainID INT,
    sponsor VARCHAR(255),
    gameID INT,
    FOREIGN KEY (captainID) REFERENCES members.info (id),
    FOREIGN KEY (gameID) REFERENCES teams.games (gameID)
);

CREATE TABLE teams.players (
    teamID INT,
    playerID INT,
    FOREIGN KEY (teamID) REFERENCES teams.info (teamID) ON DELETE CASCADE,
    FOREIGN KEY (playerID) REFERENCES members.info (id) ON DELETE CASCADE
);
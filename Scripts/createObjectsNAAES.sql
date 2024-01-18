use NAAES;
go

CREATE SCHEMA members;
go
CREATE SCHEMA teams;
go
CREATE SCHEMA tournaments;
go

CREATE TABLE members.info (
    id INT IDENTITY (1, 1) PRIMARY KEY, -- Hvert medlem får et id, som kan referes til
	profilePicture VARCHAR(2000) NOT NULL, -- Medlemmets profilbillede
    firstName VARCHAR(255) NOT NULL, -- Medlemmets fornavn
    lastName VARCHAR(255) NOT NULL, -- Medlemmets efternavn
    mail VARCHAR(255) NOT NULL, -- Medlemmets mail
    phoneNumber VARCHAR(15) NOT NULL, -- Medlemmets Telefonnummer
    street VARCHAR(255) NOT NULL, -- Medlemmets Addresse
    birthYear INT NOT NULL, -- Medlemmets fødselsår
    role VARCHAR(50), -- Medlemmets rolle på et hold
	created_at DATETIME DEFAULT GETDATE(), -- Hvornår blev entryet lavet
    updated_at DATETIME, -- Hvornår blev entryet opdateret
    deleted_at DATETIME -- Hvornår blev entryet slettet (Soft delete)
);

CREATE TABLE members.passwords (
	id INT PRIMARY KEY, -- Medlemmets id så password passer med medlemmet
	password VARCHAR(255) NOT NULL, -- Medlemmets password
	FOREIGN KEY (id) REFERENCES members.info(id) ON DELETE CASCADE -- Referer id til medlemmets id
);

CREATE TABLE members.membership_history (
    memberId INT NOT NULL, -- Medlemmets id så historien passer med medlemmet
    joinDate DATE NOT NULL, -- Medlemmets tilmeldingsdato
    leaveDate DATE, -- Medlemmets forladelsesdato
    active INT DEFAULT 1 NOT NULL, -- 1 hvis medlemmet er aktivt, 0 hvis det ikke er
    FOREIGN KEY (memberId) REFERENCES members.info(id) -- så memberId passer til medlemmets id
);

CREATE TABLE teams.games (
    gameID INT IDENTITY (1, 1) PRIMARY KEY, -- Hvert spil får et id, som kan referes til
    gameName VARCHAR(255) NOT NULL -- Spillets navn
);

CREATE TABLE teams.info (
    teamID INT IDENTITY (1, 1) PRIMARY KEY, -- Hvert hold får et id, som der kan referes til
    teamName VARCHAR(255) NOT NULL, -- Holdets navn
    captainID INT, -- Et medlems id som er kaptajn på holdet
    sponsor VARCHAR(255), -- Sponsor
    gameID INT, -- Spillets id
	created_at DATETIME DEFAULT GETDATE(), -- Hvornår blev entryet lavet
    updated_at DATETIME, -- Hvornår blev entryet opdateret
    deleted_at DATETIME -- Hvornår blev entryet slettet (Soft delete)
    FOREIGN KEY (captainID) REFERENCES members.info (id), -- captainID referer til medlemmets id
    FOREIGN KEY (gameID) REFERENCES teams.games (gameID) -- gameID referer til spillets id
);

CREATE TABLE teams.players (
    teamID INT, -- holdets id
    playerID INT, -- medlemmets id
    FOREIGN KEY (teamID) REFERENCES teams.info (teamID) ON DELETE CASCADE, -- teamID referer til holdets id
    FOREIGN KEY (playerID) REFERENCES members.info (id) ON DELETE CASCADE -- playerID referer til medlemmets id
);

CREATE TABLE tournaments.tournament_info (
    tournamentID INT IDENTITY (1, 1) PRIMARY KEY, -- Hver turnering får et id som kan referes til
    tournamentName VARCHAR(255) NOT NULL, -- Turneringens navn
    startDate DATE NOT NULL, -- Turnerings startdato
    endDate DATE, -- Turneringens slutdato
    location VARCHAR(255), -- Turneringens lokation
    winnerID INT, -- Holdets id hvis de har vundet
	created_at DATETIME DEFAULT GETDATE(), -- Hvornår blev entryet lavet
    updated_at DATETIME, -- Hvornår blev entryet opdateret
    deleted_at DATETIME -- Hvornår blev entryet slettet (Soft delete)
    FOREIGN KEY (winnerID) REFERENCES teams.info (teamID) -- winnerID referer til holdets id
);

CREATE TABLE tournaments.tournament_teams (
    tournamentID INT, -- Turneringens id
    teamID INT, -- Holdets id
	created_at DATETIME DEFAULT GETDATE(), -- Hvornår blev entryet lavet
    updated_at DATETIME, -- Hvornår blev entryet opdateret
    deleted_at DATETIME -- Hvornår blev entryet slettet (Soft delete)
    FOREIGN KEY (tournamentID) REFERENCES tournaments.tournament_info(tournamentID), -- tournamentID referer til turnerings id
    FOREIGN KEY (teamID) REFERENCES teams.info(teamID) -- teamID referer til holdets id
);
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

CREATE TABLE tournaments.matches (
    matchID INT IDENTITY (1, 1) PRIMARY KEY, -- Unique ID for each match
    tournamentID INT, -- The ID of the tournament the match belongs to
    team1ID INT, -- The ID of the first team in the match
    team2ID INT, -- The ID of the second team in the match
    startDate DATETIME NOT NULL, -- The start date and time of the match
    endDate DATETIME, -- The end date and time of the match (if it's completed)
    winnerID INT, -- The ID of the winning team (if the match is completed)
    created_at DATETIME DEFAULT GETDATE(), -- When the match entry was created
    updated_at DATETIME, -- When the match entry was last updated
    deleted_at DATETIME, -- When the match entry was soft-deleted
    FOREIGN KEY (tournamentID) REFERENCES tournaments.tournament_info(tournamentID), -- tournamentID refers to the tournament the match belongs to
    FOREIGN KEY (team1ID) REFERENCES teams.info(teamID), -- team1ID refers to the first team in the match
    FOREIGN KEY (team2ID) REFERENCES teams.info(teamID), -- team2ID refers to the second team in the match
    FOREIGN KEY (winnerID) REFERENCES teams.info(teamID) -- winnerID refers to the winning team
);

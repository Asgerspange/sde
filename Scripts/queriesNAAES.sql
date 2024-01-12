use NAAES;
go

-------- Display all members
select * from members.info;

-------- Insert incorrect gameId into players to display that there is a link between the tables
--INSERT INTO teams.players (teamID, playerID, gameID)
--VALUES
--	(1, 1, 3);

-------- Display all captains
SELECT
    m.firstName,
    m.lastName,
    t.teamName AS Team
FROM
    members.info m
JOIN
    teams.info t ON m.id = t.captainID;

-------- Display all players on CS:GO Team A
SELECT
    m.firstName,
    m.lastName,
	m.role
FROM
    members.info m
JOIN
    teams.players tp ON m.id = tp.playerID
JOIN
    teams.info t ON tp.teamID = t.teamID
WHERE
	t.teamName = 'CS:GO Team A'
use NAAES;
go

---------- Display 10 members in ASCENDING order
--select TOP 10 * from members.info order by firstName ASC;

---------- Get all members born after the year 2000
--select * from members.info where birthYear > 2000;

---------- Get amount of members
--select count(*) from members.info;

---------- Single row query
--SELECT * FROM teams.games WHERE gameID = 1;

--------- Group function
--SELECT t.teamName, COUNT(m.id) AS NumberOfMembers
--FROM teams.info t
--INNER JOIN teams.players p ON t.teamID = p.teamID
--INNER JOIN members.info m ON p.playerID = m.id
--GROUP BY t.teamName;

-------- Update birthyear to year 1000 if bearthYear is over 2000
--UPDATE members.info
--SET birthYear = 1000
--WHERE birthYear > 2000;

-------- Delete member
--delete members.membership_history where memberId = 1;
--go

-------- Create View to display each members team and team captain
CREATE VIEW members.MembersWithTeams AS
SELECT
    m.id AS MemberID,
    m.firstName,
    m.lastName,
    m.mail,
    m.phoneNumber,
    m.street,
    m.birthYear,
    m.role,
    t.teamName,
    t.captainID AS TeamCaptainID,
    c.firstName AS TeamCaptainFirstName,
    c.lastName AS TeamCaptainLastName
FROM
    members.info m
JOIN
    teams.players p ON m.id = p.playerID
JOIN
    teams.info t ON p.teamID = t.teamID
LEFT JOIN
    members.info c ON t.captainID = c.id;
go

select * from members.MembersWithTeams;

---------- Stored procedure that shows tournament details
--CREATE PROCEDURE GetTournamentDetails
--    @tournamentID INT
--AS
--BEGIN
--    SELECT
--        ti.tournamentID,
--        ti.tournamentName,
--        ti.startDate,
--        ti.endDate,
--        ti.location,
--        ti.winnerID AS WinningTeamID,
--        t.teamName AS WinningTeamName,
--        m.matchID,
--        m.team1ID AS Team1ID,
--        t1.teamName AS Team1Name,
--        m.team2ID AS Team2ID,
--        t2.teamName AS Team2Name,
--        m.startDate AS MatchStartDate,
--        m.endDate AS MatchEndDate,
--        m.winnerID AS MatchWinnerID,
--        wt.teamName AS MatchWinnerTeamName
--    FROM
--        tournaments.tournament_info ti
--    LEFT JOIN
--        tournaments.matches m ON ti.tournamentID = m.tournamentID
--    LEFT JOIN
--        teams.info t ON ti.winnerID = t.teamID
--    LEFT JOIN
--        teams.info t1 ON m.team1ID = t1.teamID
--    LEFT JOIN
--        teams.info t2 ON m.team2ID = t2.teamID
--    LEFT JOIN
--        teams.info wt ON m.winnerID = wt.teamID
--    WHERE
--        ti.tournamentID = @tournamentID;
--END;

--EXEC GetTournamentDetails @tournamentID = 1;
--go
go
CREATE TRIGGER UpdateMemberUpdatedAt
ON members.info
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE members.info
    SET updated_at = GETDATE()
    FROM members.info m
    INNER JOIN inserted i ON m.id = i.id;
END;

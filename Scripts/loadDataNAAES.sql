use NAAES;
go

INSERT INTO members.info (firstName, lastName, mail, phoneNumber, street, birthYear, role)
VALUES
    ('John', 'Doe', 'john.doe@email.com', '12345678', '123 Main St', 1990, 'Player'),
    ('Jane', 'Smith', 'jane.smith@email.com', '98765432', '456 Oak St', 1995, 'Captain'),
    ('Alice', 'Johnson', 'alice.johnson@email.com', '11122233', '789 Elm St', 1998, 'Player'),
    ('Bob', 'Williams', 'bob.williams@email.com', '44455566', '567 Pine St', 1993, 'Player'),
    ('Emily', 'Taylor', 'emily.taylor@email.com', '87654321', '890 Cedar St', 1992, 'Player'),
    ('David', 'Brown', 'david.brown@email.com', '65432198', '456 Birch St', 1997, 'Player'),
    ('Sophia', 'Clark', 'sophia.clark@email.com', '11223344', '789 Maple St', 1996, 'Player'),
    ('Michael', 'White', 'michael.white@email.com', '33445566', '234 Pine St', 1994, 'Captain'),
    ('Olivia', 'Wilson', 'olivia.wilson@email.com', '77889900', '678 Spruce St', 1991, 'Player'),
    ('Daniel', 'Miller', 'daniel.miller@email.com', '99001122', '123 Elm St', 1999, 'Player'),
    ('Jackson', 'Cooper', 'jackson.cooper@email.com', '77881122', '123 Maple St', 2002, 'Player'),
    ('Sophie', 'Baker', 'sophie.baker@email.com', '33445566', '456 Spruce St', 1999, 'Captain'),
    ('Lucas', 'Ross', 'lucas.ross@email.com', '99001122', '789 Cedar St', 1998, 'Player'),
    ('Aria', 'Ward', 'aria.ward@email.com', '11223344', '234 Oak St', 2000, 'Player'),
    ('Carter', 'Reed', 'carter.reed@email.com', '55667788', '567 Maple St', 1997, 'Player'),
    ('Grace', 'Cook', 'grace.cook@email.com', '22334455', '890 Pine St', 1995, 'Player'),
    ('Henry', 'Barnes', 'henry.barnes@email.com', '77889900', '123 Spruce St', 1994, 'Captain'),
    ('Ella', 'Sanders', 'ella.sanders@email.com', '11223355', '456 Cedar St', 2001, 'Player'),
    ('Sebastian', 'Harris', 'sebastian.harris@email.com', '99887766', '789 Birch St', 1996, 'Player'),
    ('Mila', 'Nelson', 'mila.nelson@email.com', '66778899', '234 Elm St', 1993, 'Player'),
    ('Emma', 'Harrison', 'emma.harrison@email.com', '11223399', '567 Oak St', 1992, 'Player'),
    ('Noah', 'Bennett', 'noah.bennett@email.com', '44556688', '890 Elm St', 1996, 'Player'),
    ('Avery', 'Foster', 'avery.foster@email.com', '66778855', '123 Pine St', 1998, 'Captain'),
    ('Evelyn', 'Cooper', 'evelyn.cooper@email.com', '99887744', '456 Cedar St', 1994, 'Player'),
    ('Liam', 'Ward', 'liam.ward@email.com', '22334477', '789 Spruce St', 1999, 'Player'),
    ('Scarlett', 'Hamilton', 'scarlett.hamilton@email.com', '99001188', '234 Birch St', 1995, 'Player'),
    ('Mason', 'Sullivan', 'mason.sullivan@email.com', '11223366', '890 Maple St', 1997, 'Player'),
    ('Amelia', 'Cruz', 'amelia.cruz@email.com', '44556699', '567 Spruce St', 2000, 'Captain'),
    ('Jackson', 'Gomez', 'jackson.gomez@email.com', '77889922', '123 Elm St', 1993, 'Player'),
    ('Aria', 'Pearson', 'aria.pearson@email.com', '11223311', '456 Oak St', 1991, 'Player');

INSERT INTO members.membership_history (memberId, joinDate, leaveDate, active)
VALUES
    (1, '2022-01-01', NULL, 1),
    (2, '2021-12-01', NULL, 1),
    (3, '2023-02-15', NULL, 1),
    (4, '2023-01-01', NULL, 1),
    (5, '2022-03-10', NULL, 1),
    (6, '2022-05-20', NULL, 1),
    (7, '2022-04-15', NULL, 1),
    (8, '2022-02-28', NULL, 1),
    (9, '2022-01-15', NULL, 1),
    (10, '2023-01-15', NULL, 1),
    (11, '2023-02-15', NULL, 1),
    (12, '2023-02-28', NULL, 1),
    (13, '2023-03-10', NULL, 1),
    (14, '2023-03-25', NULL, 1),
    (15, '2023-04-05', NULL, 1),
    (16, '2023-04-20', NULL, 1),
    (17, '2023-05-01', NULL, 1),
    (18, '2023-05-15', NULL, 1),
    (19, '2023-06-01', NULL, 1),
    (20, '2023-06-15', NULL, 1),
    (21, '2022-09-01', NULL, 1),
    (22, '2022-10-01', NULL, 1),
    (23, '2022-11-01', NULL, 1),
    (24, '2022-12-01', NULL, 1),
    (25, '2023-01-01', NULL, 1),
    (26, '2023-02-01', NULL, 1),
    (27, '2023-03-01', NULL, 1),
    (28, '2023-04-01', NULL, 1),
    (29, '2023-05-01', NULL, 1),
    (30, '2023-06-01', NULL, 1);

INSERT INTO teams.games (gameName)
VALUES
    ('Counterstrike'),
    ('Fortnite');

INSERT INTO teams.info (teamName, captainID, sponsor, gameID)
VALUES
    ('CS:GO Team A', 2, 'XYZ Gaming', 1),
	('CS:GO TEAM B', 12, 'Monster', 1),
	('CS:GO TEAM C', 17, 'Redbull', 1),
	('CS:GO TEAM D', 23, 'Elgiganten', 1),
    ('Fortnite Team X', 8, '123 Esports', 2),
	('Fortnite Team Z', 28, 'Bulk', 2);

INSERT INTO teams.players (teamID, playerID)
VALUES
	-- Counterstrike
	(1, 1),
	(1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
	(2, 11),
	(2, 12),
	(2, 13),
	(2, 14),
	(2, 15),
	(3, 16),
	(3, 17),
	(3, 18),
	(3, 19),
	(3, 20),
	(4, 21),
	(4, 22),
	(4, 23),
	(4, 24),
	(4, 25),
    -- Fortnite
	(5, 7),
	(5, 8),
	(5, 9),
	(5, 10),
	(6, 26),
	(6, 27),
	(6, 28),
	(6, 30);


INSERT INTO tournaments.tournament_info (tournamentName, startDate, endDate, location, winnerID)
VALUES
    ('CS:GO Championship', '2023-07-01', '2023-07-10', 'City Arena', 1),  -- Assuming Team 1 is the winner
    ('Fortnite League', '2023-08-01', '2023-08-15', 'Arena Center', NULL), -- No winner yet
    ('Summer Showdown', '2023-06-15', '2023-06-30', 'Stadium Hall', NULL),
    ('Elite Gaming Tournament', '2023-09-01', '2023-09-15', 'Convention Center', NULL);

INSERT INTO tournaments.tournament_teams (tournamentID, teamID)
VALUES
    (1, 1),
    (1, 2),  
    (1, 3),
    (1, 4),
    (2, 5),
    (2, 6);
CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(50) NOT NULL,
    team_id INTEGER REFERENCES Teams(team_id)
);


CREATE TABLE Matches (
    match_id INTEGER PRIMARY KEY,
    season VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    team1_id INTEGER REFERENCES Teams(team_id),
    team2_id INTEGER REFERENCES Teams(team_id),
    match_number INTEGER NOT NULL,
    venue VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    toss_winner VARCHAR(50) NOT NULL,
    toss_decision VARCHAR(10) NOT NULL,
    player_of_match INTEGER REFERENCES Players(player_id),
    umpire1 VARCHAR(50) NOT NULL,
    umpire2 VARCHAR(50) NOT NULL,
    reserve_umpire VARCHAR(50),
    match_referee VARCHAR(50) NOT NULL,
    winner_id INTEGER REFERENCES Teams(team_id),
    winner_runs INTEGER,
    winner_wickets INTEGER,
    match_type VARCHAR(20) NOT NULL
);


CREATE TABLE Innings (
    innings_id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES Matches(match_id),
    innings_number INTEGER NOT NULL,
    batting_team_id INTEGER REFERENCES Teams(team_id),
    bowling_team_id INTEGER REFERENCES Teams(team_id)
);


CREATE TABLE Ball_by_Ball (
    ball_id SERIAL PRIMARY KEY,
    innings_id INTEGER REFERENCES Innings(innings_id),
    ball_number INTEGER NOT NULL,
    striker_id INTEGER REFERENCES Players(player_id),
    non_striker_id INTEGER REFERENCES Players(player_id),
    bowler_id INTEGER REFERENCES Players(player_id),
    runs_off_bat INTEGER NOT NULL,
    extras INTEGER NOT NULL,
    wides INTEGER NOT NULL,
    noballs INTEGER NOT NULL,
    byes INTEGER NOT NULL,
    legbyes INTEGER NOT NULL,
    penalty INTEGER NOT NULL,
    wicket_type VARCHAR(20),
    player_dismissed INTEGER REFERENCES Players(player_id),
    other_wicket_type VARCHAR(20),
    other_player_dismissed INTEGER REFERENCES Players(player_id)
);
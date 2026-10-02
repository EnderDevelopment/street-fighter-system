CREATE TABLE IF NOT EXISTS street_fighter_players (
    identifier VARCHAR(60) PRIMARY KEY,
    xp INT DEFAULT 0,
    level INT DEFAULT 1,
    skill_points INT DEFAULT 0,
    cash INT DEFAULT 5000,
    rank VARCHAR(20) DEFAULT 'Novice'
);

CREATE TABLE IF NOT EXISTS street_fighter_inventory (
    identifier VARCHAR(60),
    item VARCHAR(50),
    quantity INT DEFAULT 1,
    PRIMARY KEY (identifier, item),
    FOREIGN KEY (identifier) REFERENCES street_fighter_players(identifier)
);

INSERT INTO street_fighter_players (identifier, xp, level, skill_points, cash, rank) VALUES ('char1', 0, 1, 0, 5000, 'Novice');
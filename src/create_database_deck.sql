CREATE TABLE Server (
id INT PRIMARY KEY,
claim_interval INT DEFAULT 180, --in minutes
time_to_claim INT DEFAULT 15, -- in seconds
rolls_per_hour INT DEFAULT 5
);

CREATE TABLE Member (
id INT PRIMARY KEY
);

-- Member information for a server
CREATE TABLE MemberInformation (
id_server INT,
id_member INT,
last_claim TEXT DEFAULT NULL, -- date %Y-%m-%d %H:%M:%S
nb_rolls INT DEFAULT 0,
last_roll TEXT DEFAULT NULL, -- date %Y-%m-%d %H:%M:%S
max_wish INT DEFAULT 5,
FOREIGN KEY (id_server) REFERENCES Server(id),
FOREIGN KEY (id_member) REFERENCES Member(id),
PRIMARY KEY (id_server, id_member)
);

CREATE TABLE Deck (
id_server INT,
id_idol INT,
id_member INT,
FOREIGN KEY (id_server) REFERENCES Server(id),
FOREIGN KEY (id_member) REFERENCES Member(id),
PRIMARY KEY (id_server, id_idol)
);

CREATE TABLE Wishlist (
id_server INT,
id_idol INT,
id_member INT,
FOREIGN KEY (id_server) REFERENCES Server(id),
FOREIGN KEY (id_member) REFERENCES Member(id),
PRIMARY KEY (id_server, id_idol, id_member)
)
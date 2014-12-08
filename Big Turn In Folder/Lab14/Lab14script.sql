use hlalljie;


###############################################

# STEP 1 #

###############################################

DROP TABLE IF EXISTS Account14;
CREATE TABLE Account14 (
	AccountID INT PRIMARY KEY AUTO_INCREMENT,
	Email VARCHAR(225) UNIQUE
);

DROP TABLE IF EXISTS Tweet14;
CREATE TABLE Tweet14 (
	TweetID INT PRIMARY KEY AUTO_INCREMENT,
	AccountID INT REFERENCES Account14(AccountID),
	Post VARCHAR(140),
	ReTweetCount INT DEFAULT 0
);

DROP TABLE IF EXISTS Followers14;
CREATE TABLE Followers14 (
	AccountID INT REFERENCES Account14(AccountID),
	FollowerID INT REFERENCES Account14(AccountID),
	PRIMARY KEY (AccountID, FollowerID)
);

###############################################

# STEP 2 #

###############################################

INSERT INTO Account14(Email) VALUES('hlalljie@gmail.com');
INSERT INTO Account14(Email) VALUES('mylittlejibronie@gmail.com');
INSERT INTO Account14(Email) VALUES('alphasigmarigmachigma@gmail.com');
INSERT INTO Account14(Email) VALUES('bob@gmail.com');
INSERT INTO Account14(Email) VALUES('mrman@gmail.com');
INSERT INTO Account14(Email) VALUES('i<3cs355@gmail.com');
INSERT INTO Account14(Email) VALUES('donnie@gmail.com');
INSERT INTO Account14(Email) VALUES('email@gmail.com');
INSERT INTO Account14(Email) VALUES('micky@gmail.com');
INSERT INTO Account14(Email) VALUES('kinglouie@gmail.com');
INSERT INTO Account14(Email) VALUES('bugsy@gmail.com');

INSERT INTO Tweet14(AccountID, Post) VALUES('1', 'Dat pre reTweet');
INSERT INTO Tweet14(AccountID, Post) VALUES('2', 'I<3 twitter its soo cool');
INSERT INTO Tweet14(AccountID, Post) VALUES('1', 'CS355 is my favorite class!');
INSERT INTO Tweet14(AccountID, Post) VALUES('3', 'We\'re all Alpha Sigma Rigma Chigmas');
INSERT INTO Tweet14(AccountID, Post) VALUES('1', 'Comment');
INSERT INTO Tweet14(AccountID, Post) VALUES('7', 'tweet');
INSERT INTO Tweet14(AccountID, Post) VALUES('7', 'Data');
INSERT INTO Tweet14(AccountID, Post) VALUES('10', 'Let\'s Gooo!');
INSERT INTO Tweet14(AccountID, Post) VALUES('4', 'ab14 is super fun');
INSERT INTO Tweet14(AccountID, Post) VALUES('1', 'Almost done making weets');
INSERT INTO Tweet14(AccountID, Post) VALUES('1', 'Last Tweet!');

INSERT INTO Followers14(AccountID, FollowerID) VALUES (1, 2);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (7, 3);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (1, 5);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (4, 2);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (6, 7);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (8, 9);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (10, 2);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (1, 6);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (5, 2);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (1, 3);
INSERT INTO Followers14(AccountID, FollowerID) VALUES (6, 8);

###############################################

# Exercises #

###############################################
#1

SELECT COUNT(TweetID) FROM Tweet14;

#2

SELECT COUNT(TweetID)*IFNULL(TweetID,1) FROM Tweet14;
#OR
SELECT IFNULL(COUNT(TweetID), 1) FROM Tweet14;

#3,  HAVING

SELECT SUM(ReTweetCount) FROM Tweet14 WHERE AccountID = 2;

#4

SELECT AVG(ReTweetCount)*IFNULL(ReTweetCount,0) FROM Tweet14 
WHERE AccountID = 1;

#5

SELECT AccountID, COUNT(TweetID) FROM Tweet14
GROUP BY AccountID;

#6

SELECT Account14.Email, COUNT(FollowerID) AS Follwers FROM Account14 LEFT JOIN
Followers14 ON Followers14.AccountID = Account14.AccountID
GROUP BY Account14.AccountID;

#7

SELECT Account14.Email FROM Account14 JOIN
Tweet14 ON Tweet14.AccountID = Account14.AccountID
HAVING COUNT(Tweet14.TweetID) > 2;

#8

#Selects all accounts who follow more than one account ordered by the top follower
SELECT Account14.AccountID, Account14.Email, COUNT(Followers14.AccountID) AS Following
FROM Account14 JOIN 
Followers14 ON Followers14.FollowerID = Account14.AccountID
GROUP BY Account14.AccountID
HAVING COUNT(Followers14.AccountID) > 1
ORDER BY COUNT(Followers14.AccountID) DESC;

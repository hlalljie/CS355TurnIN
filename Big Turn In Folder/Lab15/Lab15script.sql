use hlalljie;

###############################################

# STEP 1 #

###############################################

SELECT Tweet14.AccountID, Tweet14.TweetID FROM Tweet14 WHERE EXISTS (
	SELECT TweetID FROM Tweet14);

###############################################

# STEP 2 #

###############################################

SELECT Account14.AccountID FROM Account14 WHERE NOT EXISTS (
	SELECT AccountID FROM Tweet14 WHERE Account14.AccountID = Tweet14.AccountID);

###############################################

# STEP 3 #

###############################################

SELECT Tweet14.Post, Account14.Email, Tweet14.AccountID
	FROM Account14 JOIN Tweet
	ON Account14.AccountID = Tweet14.AccountID

###############################################

# STEP 4 #

###############################################

SELECT * FROM(
	SELECT Tweet14.Post, Account14.Email, Tweet14.AccountID
	FROM Account14 JOIN Tweet14 
	ON Account14.AccountID = Tweet14.AccountID ) TweetAccount
	WHERE TweetAccount.AccountID = 1;

###############################################

# STEP 5 #

###############################################

CREATE VIEW AccountPost AS (
	SELECT Tweet14.Post, Account14.Email, Tweet14.AccountID
	FROM Account14 JOIN Tweet14
	ON Account14.AccountID = Tweet14.AccountID );

SELECT * FROM AccountPost WHERE AccountID = 1;

###############################################

# STEP 6 #

###############################################

CREATE VIEW EmailNumPosts AS
	SELECT Account14.Email, COUNT(Tweet14.Post) AS Posts
	FROM Account14
	JOIN Tweet14
	ON Account14.AccountID = Tweet14.AccountID
	GROUP BY Account14.AccountID;

SELECT * FROM EmailNumPosts;

###############################################

# STEP 7 #

###############################################

SELECT Email FROM Account14
	WHERE Account14.AccountID IN (SELECT Post FROM Tweet14 WHERE Post > 0);

###############################################

# STEP 8 #

#############################################

SELECT Email FROM Account Account14
	WHERE Account14.AccountID IN (SELECT Post FROM Tweet14 WHERE Post = 0);
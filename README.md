# SumOneChallenge

-Twiiter Crawler
The twitter crawler uses the twitter gem, this gem allows to connect to the Twitter stream and provides a funtion to filter
the received tweets by a set words, this is the basic functionality of the challenge.
The developed class has three methods
-> initialize: to create a crawler, this method create a twitter stream client using the keys seted in the .env.
-> craw: this method starts a thread that filter the key words seted in the .env file. The main reason to run the process in 
a threat, is the ablity to stop it with a class method and the ability to start multiple searchs.
-> end_craw_: this method kill the last started thread. An improvement would be use a thread pool.

When the file is executed it will start a client and a search using the .env file parameters and wait for a q command to stop.

-The rails server
It's a simple server with to routes:
-> tweets/list: that lists all the users in the system. Use mainly for development/debug.
-> tweet/create: that create or add a user and associate a text with the received user.

-The rake task
The task goes throught all the users in the db, checking how many texts each user and in what time each text was created.

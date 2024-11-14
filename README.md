# Wordle
Similar to Wordle (NYT) but a bit of a twist.

Algorithm:

User 1 is prompted with request for word 

Answer Word is stored and is compared with the database of 100,000 words to see if it is a real word or not (to ensure fairness in competition) 

User 2 is given the chance to get the correct answer 

As the user guesses, correct letters will be green. 

Incorrect letters will be red. 

Correct letters in the wrong place will be yellow or orange. 

If User 2 is unable to guess the correct word in 6 attempts, User 2 loses the first round. 

If User 2 is able to guess the word, the point goes to the user 2 in that case. 

User 1 gets the point for round 1 of n rounds.  

User 2 is now setting the word for the next round.  

Repeat steps 2-6 but inverse user 2 and user 1. 

The game ends when the word “ENDED” is entered (for obvious reasons, this is a word that will be specified at the start to make sure that the users do not put this in. 

The comparison of rounds won will be given and an overall winner will be determined. 

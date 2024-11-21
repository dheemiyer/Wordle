function [success, attempts] = playWordleRound(targetWord, sprites, RED, YELLOW, GREEN)
    % make the targetword lowercase so that it adjusts it and compares the
    % string values equally. i've coded too much in java.
    targetWord = lower(targetWord);
    
    % the actual round rules: 6 attempts and if they get the word then good
    maxAttempts = 6;
    attempts = 0;
    success = false;
    
    while attempts < maxAttempts
        % guesses (if they were smart they'd get it ez) (keep gambling)
        guess = input('Enter your guess: ', 's');
        
        % make the guess also lowercase lol bc ppl be typing random stuff
        guess = lower(guess);
        
        attempts = attempts + 1;
        
        % see if they ended the game
        if strcmpi(guess, 'ENDED')
            success = false;
            return;
        end
        
        % verify and see what parts of the guess are right/wrong
        feedback = checkWordGuess(targetWord, guess);
        displayFeedback(feedback, sprites, RED, YELLOW, GREEN, targetWord, guess);
        
        % see if the word is right
        if strcmp(guess, targetWord)
            success = true;
            return;
        end
    end
end
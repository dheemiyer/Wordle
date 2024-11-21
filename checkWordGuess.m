function feedback = checkWordGuess(targetWord, guess)
    targetWord = lower(targetWord);
    guess = lower(guess);
    
    feedback = zeros(1, length(targetWord)); 
    
    % Store which positions in targetWord have been "used" for yellow or green checks
    usedInTarget = false(1, length(targetWord));

    % see if the guess is correct, and set it to the green value if it's
    % correct location and correct letter.
    for i = 1:length(targetWord)
        if guess(i) == targetWord(i)
            feedback(i) = 1;  
            usedInTarget(i) = true;  %mark that value of i as used
        end
    end

    % check for the yellow feedback.
    for i = 1:length(targetWord)
        if feedback(i) == 0  
            if ismember(guess(i), targetWord) && guess(i) ~= targetWord(i) 
                % make sure it hasn't been used elsewhere
                targetIndices = find(targetWord == guess(i));
                targetIndices = targetIndices(~usedInTarget(targetIndices)); % don't include alr used matches
                if ~isempty(targetIndices) 
                    feedback(i) = 2; %match it
                    usedInTarget(targetIndices(1)) = true; % mark it as used
                end
            end
        end
    end

    % if it's not marked with either yellow or green, red (incorrect
    % location, incorrect letter
    feedback(feedback == 0) = 3;  % Red
end

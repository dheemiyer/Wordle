function [targetWord, definition] = selectRandomWord(wordList, definitions)
    % get a rand word 
    idx = randi(length(wordList));
    targetWord = wordList{idx};
    definition = definitions{idx};
end

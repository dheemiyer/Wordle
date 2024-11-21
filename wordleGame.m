% main
clear;
clc;

% list out the words and definitions. this prob took too much time. 
% make sure that it's same array values dheememmemememmememee
wordList = {'Array', 'Batch', 'Cache', 'Debug', 'Entry', 'Field', 'Fetch', 'Frame', ...
            'Guard', 'Index', 'Input', 'Label', 'Logic', 'Macro', 'Patch', 'Pivot', ...
            'Query', 'Queue', 'Stack', 'Token', 'Trace', 'Turbo', 'Unzip', 'Value', 'Virus'};
definitions = {'A collection of elements, identified by index.', ...
               'A group of jobs executed together.', ...
               'Temporary storage for quick data access.', ...
               'The process of identifying and fixing software bugs.', ...
               'A single record in a data set.', ...
               'A single piece of data in a record.', ...
               'To retrieve data from memory.', ...
               'A data packet structure used in networking.', ...
               'A condition that controls access in programming.', ...
               'An ordered list to facilitate search operations.', ...
               'Data provided to a system for processing.', ...
               'A marker used to identify a data element.', ...
               'A set of rules used in computation.', ...
               'A sequence of instructions that automates tasks.', ...
               'A software update that fixes bugs or vulnerabilities.', ...
               'A data summarization method used in spreadsheets.', ...
               'A request for information from a database.', ...
               'A collection where elements are added at one end and removed from the other.', ...
               'A collection where elements are added and removed from the same end.', ...
               'A single element in programming, such as a keyword or operator.', ...
               'To follow the execution path of a program.', ...
               'A term often used to denote high-speed processing.', ...
               'To extract files from a compressed format.', ...
               'The data held in a variable or constant.', ...
               'Malicious software that replicates itself to spread to other computers.'};

sprites = simpleGameEngine('image.png', 85, 85, 5, [255, 255, 255]);

redSprite = 1;
greenSprite = 2;
yellowSprite = 3;


% assign the sprite locations/sides (will be used in function files)
RED = redSprite;  
YELLOW = yellowSprite;
GREEN = greenSprite;

% main variables
gameOver = false;
user1Score = 0;
user2Score = 0;

fprintf('Welcome to Wordle 2.0! Type "ENDED" at any point to quit.\n');

while ~gameOver
    % get a word randomly and pair it with its definition
    [targetWord, definition] = selectRandomWord(wordList, definitions);
    
    % user 1 turn first
    fprintf('Player 1''s turn:\n');
    [success1, attempts1] = playWordleRound(targetWord, sprites, RED, YELLOW, GREEN);

    if success1
        user1Score = user1Score + 1;
        fprintf('Player 1 guessed the word in %d attempts!\n', attempts1);
    else
        fprintf('Player 1 couldn''t guess the word. No points awarded.\n');
    end
    fprintf('Definition: %s\n\n', definition);

    fprintf('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
    %have to clear so make sure the user 2 can't see what's going on.
    
    % user 2 turn
    fprintf('Player 2''s turn:\n');
    [success2, attempts2] = playWordleRound(targetWord, sprites, RED, YELLOW, GREEN);
    if success2
        user2Score = user2Score + 1;
        fprintf('Player 2 guessed the word in %d attempts!\n', attempts2);
    else
        fprintf('Player 2 couldn''t guess the word. No points awarded.\n');
    end
    fprintf('Definition: %s\n\n', definition);
    
    % check to see if they want to end the game (winners don't quit)
    prompt = 'Enter "ENDED" to quit or press Enter to continue. ';
    userInput = input(prompt, 's');
    if strcmpi(userInput, 'ENDED')
        gameOver = true;
    end
end

% give the users the final scores if they quit
fprintf('Final Scores:\nPlayer 1: %d\nPlayer 2: %d\n', user1Score, user2Score);
if user1Score > user2Score
    fprintf('Player 1 wins!\n');
elseif user2Score > user1Score
    fprintf('Player 2 wins!\n');
else
    fprintf('It''s a tie!\n');
end

fprintf('Thank you for playing Wordle 2.0!\n');

function displayFeedback(feedback, sprites, RED, YELLOW, GREEN, ~, ~)
    
% literally just the function for the value point
    
    board = zeros(1, length(feedback)); 
    for i = 1:length(feedback)
        if feedback(i) == 1 
            board(i) = GREEN;
        elseif feedback(i) == 2 
            board(i) = YELLOW;
        else 
            board(i) = RED;
        end
    end
    % actual display feedback
    disp(['Feedback Board: ', num2str(board)]);
    
    drawScene(sprites, board);  
end
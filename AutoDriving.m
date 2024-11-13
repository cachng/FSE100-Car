% TODO: make a function that can implement


% Source: https://medium.com/@minikiraniamayadharmasiri/micromouse-from-scratch-algorithm-maze-traversal-shortest-path-floodfill-741242e8510
% Makes 2D arrays of distance away from end & of maze wall configurations
rows = 3;
cols = 6;
distance = zeros(rows, cols);
maze = zeros(rows, cols);

% Global variables and arrays
timeBuffer = 0.5; % Time between ultrasonic updates
distFromEnd = 0; % the amount of blocks the position is away from the maze
orient = [0, 1, 2, 3]; % car orient 0 = up, 1 = right, 2 = down, 3 = left
% 15 different maze configurations
% (11 is an error, suppose to be like 12,13, & 14; config 15 is 0; 16 not needed)
config = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

% updates distance away from the end 
function floodFill(row, col)
    
    % Checks if it is out of bounds
    if row < 1 || row > rows || col < 1 || col > cols || distance(row, col) ~= 0
        return;
    end

    % Updates the distance from the end
    distance(row, col) = distFromEnd;
    distFromEnd = distFromEnd + 1;

    % Recursively fills out adjacent elements from up, down, left, & right
    % based on configuration of walls in a switch case
    % https://miro.medium.com/v2/resize:fit:1100/format:webp/1*dhFlf8CtoDKifTVqS3-zqg.jpeg
    switch configuration(row, col) % row and col is the current position of the car
        case 0
            floodFill(row - 1, col);
            floodFill(row + 1, col);
            floodfill(row, col - 1);
            floodFill(row, col + 1);
        case 1
            floodFill(row - 1, col);
            floodFill(row + 1, col);
            floodFill(row, col + 1);
        case 2
            floodFill(row + 1, col);
            floodFill(row, col - 1);
            floodFill(row, col + 1);
        case 3
            floodFill(row - 1, col);
            floodFill(row + 1, col);
            floodFill(row, col - 1);
        case 4
            floodFill(row - 1, col);
            floodFill(row, col - 1);
            floodFill(row, col + 1);
        case 5
            floodFill(row - 1, col);
            floodFill(row, col + 1);
        case 6
            floodFill(row - 1, col);
            floodFill(row, col - 1);
        case 7
            floodFill(row + 1, col);
            floodFill(row, col - 1);
        case 8
            floodFill(row + 1, col);
            floodFill(row, col + 1);
        case 9
            floodFill(row - 1, col);
            floodFill(row + 1, col);
        case 10
            floodFill(row, col - 1);
            floodFill(row, col + 1);
        case 11
            floodFill(row - 1, col);
        case 12
            floodFill(row, col - 1);
        case 13
            floodFill(row + 1, col);
        case 14 
            floodFill(row, col + 1);
    end
end
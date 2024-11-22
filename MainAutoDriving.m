
% Main File for autonomous driving

% Global variables and arrays
distance = zeros(3, 6); % array that contains distance away from destination
walls = zeros(3, 6); % array representation of maze, contains config # of walls
position = [1, 1]; % position of robot in maze, has placeholders
destination = [1, 1]; % destination of robot in maze, has placeholders
orientation = 0; % way robot faces: up = 0, right = 1, down = 2, left = 3


% CREATE CHART OF ALL POSSIBLE POSITIONS SO WE CAN INPUT POSITIONS

rows = 3; % amount of rows in the maze
cols = 6; % amount of columns in the maze
distance = zeros(rows, cols); % contains the amount of cells away from destination
visited = false(rows, cols); % true or false if already filled
distFromEnd = 0; % the amount of blocks the position is away from the maze
config = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]; % Configs of mazes

while ~isequal(distance(position(1), position(2)), 0) % loops until reached destination not sure if matlab uses 0 as the first value rows im pretty sure it doesnt
    % Have Ultrasonic sensors detect walls and update maze config of the
    % current position of the robot
    

    % Solve the Maze by floodfilling
    distance = SolveMaze(destination(0), destination(1), walls);

    % Move robot based on descending order of distance there are two
    
    % adjacent cells with the same distance, make robot prefer going
    % straight, otherwise 50/50 left right, update position
    if distance(position(0), positon(1))

end
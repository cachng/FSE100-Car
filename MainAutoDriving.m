
% Main File for autonomous driving

% Global variables and arrays
distance = zeros(3, 6); % array that contains distance away from destination
%% [NOT USED, WALL IS HARD CODED RN] walls = zeros(3, 6); % array representation of maze, contains config # of walls


%% Wall Diagram: 
%% Wall Matrix is coded with Exit Sign in top left and battery station to the right (see diagram ^)

wall = [ ]

position = [1, 1]; % position of robot in maze, has placeholders
destination = [1, 1]; % destination of robot in maze, has placeholders
orientation = 0; % way robot faces: up = 0, right = 1, down = 2, left = 3
thresholdx = 25; % needs adjusting, in cm 
thresholdy = 25; % ^^

% CREATE CHART OF ALL POSSIBLE POSITIONS SO WE CAN INPUT POSITIONS

rows = 3; % amount of rows in the maze
cols = 6; % amount of columns in the maze
distance = zeros(rows, cols); % contains the amount of cells away from destination
visited = false(rows, cols); % true or false if already filled
distFromEnd = 0; % the amount of blocks the position is away from the maze
config = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]; % Configs of mazes



int i = 0 
while ~isequal(distance(position(1), position(2)), 0) % loops until reached destination not sure if matlab uses 0 as the first value rows im pretty sure it doesnt
    % Have Ultrasonic sensors detect walls and update maze config of the
    % current position of the robot
    % Function that reads the walls of the maze and edits the wall matrix
    % Source: https://medium.com/@minikiraniamayadharmasiri/micromouse-from-scratch-algorithm-maze-traversal-shortest-path-floodfill-741242e8510
    %Wall matrix edits and illustrates the configuration of the walls
    % https://miro.medium.com/v2/resize:fit:1100/format:webp/1*dhFlf8CtoDKifTVqS3-zqg.jpeg
    % (11 is an error, suppose to be like 12,13, & 14; config 15 is 0; 16 not needed)
    % Orientation ?

    %recall current position 

    %read walls

    %if not first interation, use past front wall as backwall
    if i ~= 0
    
    end
    %edit wall config 




    % Solve the Maze by floodfilling
    distance = SolveMaze(destination(1), destination(2), walls);

    % Move robot based on descending order of distance there are two

    % adjacent cells with the same distance, make robot prefer going
    % straight, otherwise 50/50 left right, update position
    %call oritentation
    
    if distance(position(1), positon(2)) - 1 == distance(position(1) - 1, position(2)) % checks if there is a possible path up
        while orientation ~= 0
            brick.MoveMotorAngleRel('A', 20, -90, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            orientation = orientation + 1;
            orientation = orientation % 4;
        end
    end

    if distance(position(1), positon(2)) - 1 == distance(position(1), position(2) - 1) % checks if there is a possible path right
        while orientation ~= 1
            brick.MoveMotorAngleRel('A', 20, -90, 'Coast');
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            orientation = orientation + 1;
            orientation = orientation % 4;
        end
    end

    if distance(position(1), positon(2)) - 1 == distance(position(1) + 1, position(2)) % checks if there is a possible path down
        while orientation ~= 2
            brick.MoveMotorAngleRel('A', 20, -90, 'Coast');
            brick.WaitForMotor('A'); % Wait for motor to complete motion 
            orientation = orientation + 1;
            orientation = orientation % 4;
        end
    end

    if distance(position(1), positon(2)) - 1 == distance(position(1), position(2) + 1) % checks if there is a possible path left
        while orientation ~= 3
            brick.MoveMotorAngleRel('A', 20, -90, 'Coast'); 
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            orientation = orientation + 1;
            orientation = orientation % 4;
        end
    end
end
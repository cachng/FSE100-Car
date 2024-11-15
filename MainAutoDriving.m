
% Main File for autonomous driving

% Global variables and arrays
distance = zeros(3, 6); % array that contains distance away from destination
walls = zeros(3, 6); % array representation of maze, contains config # of walls
position = [1, 1]; % position of robot in maze
endRow = 1; % row of destination
endCol = 1; % col of destination
while ~isequal(distance(position(1), position(2)), 0) % loops until reached destination
    % Have Ultrasonic sensors detect walls and update maze config of the
    % current position of the robot
    % TODO: figure out how to make ultrasonic sensors work make it a
    % function if possible **The orientation of the robot matters
    

    % Solve the Maze by floodfilling
    SolveMaze(endRow, endCol, distance, walls);

    % Move robot based on descending order of distance and walls (if there are two
    % adjacent cells with the same distance, make robot prefer going
    % straight, otherwise 50/50 left right
    %TODO make function? idk

    % Update robot's position
    % TODO make shit
    position(1) = row;
    position(2) = col;
end
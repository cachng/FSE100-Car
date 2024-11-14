
% Main File for autonomous driving

% Global variables and arrays
distance = zeros(3, 6); % array that contains distance away from destination
maze = zeros(3, 6); % array representation of maze, contains config # of maze
position = [1, 1]; % position of robot in maze
endRow % row of destination
endCol % col of destination
while 1
    % Check if robot is on the destination square
    if isequal(distance(position(1), position(2)), 0)
        break;
    end

    % Have Ultrasonic sensors detect walls and update maze

    % Solve the Maze by floodfilling
    SolveMaze(endRow, endCol, distance, maze);

    % Move robot based on descending order of distance (if there are two
    % adjacent cells with the same distance, make robot prefer going
    % straight, otherwise 50/50 left right

    % Update robot's position
    position(1) = row;
    position(2) = col;
end
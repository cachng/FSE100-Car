
% Main File for autonomous driving

% Global variables and arrays
distance = zeros(3, 6);
maze = zeros(3, 6);
position = [row, col]

while 1
    % Check if robot is on the destination square
    if isequal(distance(position(0), position(1)), 0)
        break;
    end

    % Have Ultrasonic sensors detect walls and update maze

    % Solve the Maze by floodfilling
    SolveMaze(endRow, endCol, distance, maze);

    % Move robot based on descending order of distance (if there are two
    % adjacent cells with the same distance, make robot prefer going
    % straight, otherwise 50/50 left right

    % Update robot's position
    
end
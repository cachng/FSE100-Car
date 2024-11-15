function pathFound = FloodfillFunction(maze, startPoint, endPoint)
    % Input:
    %   maze - a 2D array representing the maze (1 for path, 0 for wall)
    %   startPoint - [row, col] of the starting position (on the first or last row)
    %   endPoint - [row, col] of the ending position (on the row opposite of the start)
    % Output:
    %   pathFound - a logical value indicating whether a path exists from start to end

    % Get the size of the maze
    [rows, cols] = size(maze);

    % Create a visited matrix initialized to false
    visited = false(rows, cols);

    % Initialize a flag for path found
    pathFound = false;

    % Nested function for the recursive flood fill
    function floodFill(row, col)
        % Check if out of bounds or already visited or is a wall
        if row < 1 || row > rows || col < 1 || col > cols || visited(row, col) || maze(row, col) == 0
            return;
        end

        % Mark the current cell as visited
        visited(row, col) = true;

        % Check if the current position is the end point
        if isequal([row, col], endPoint)
            pathFound = true;
            return;
        end

        % Recursively check adjacent cells (up, down, left, right)
        floodFill(row + 1, col); % down
        floodFill(row - 1, col); % up
        floodFill(row, col + 1); % right
        floodFill(row, col - 1); % left
    end

    % Start the flood fill from the given start point
    floodFill(startPoint(1), startPoint(2));
end
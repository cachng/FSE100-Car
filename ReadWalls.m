    % Function that reads the walls of the maze and edits the wall matrix
    % Source: https://medium.com/@minikiraniamayadharmasiri/micromouse-from-scratch-algorithm-maze-traversal-shortest-path-floodfill-741242e8510
    %Wall matrix edits and illustrates the configuration of the walls
    % https://miro.medium.com/v2/resize:fit:1100/format:webp/1*dhFlf8CtoDKifTVqS3-zqg.jpeg
    % (11 is an error, suppose to be like 12,13, & 14; config 15 is 0; 16 not needed)
    
    %Threshold Distances
    %Adjust Ass Needed 
    MinThresX =  33-5;
    MaxThresX =  33;
    MinThresY =  33-5
    MaxThresY =  33;


    ReadWall(endRow, endCol, walls);
    return;
    % updates distance away from the end 
        function floodFill(row, col, walls)
            
            % Checks if it is out of bounds or the cell has already been filled
         if row < 1 || row > rows || col < 1 || col > cols || visited == true
                return;
            end
        
            % Updates the distance from the end and updates visited array
            distance(row, col) = distFromEnd;
            distFromEnd = distFromEnd + 1;
            visited(row, col) = true;
        
            % Recursively fills out adjacent elements from up, down, left, & right
            % based on configuration of walls in a switch case
          
            switch config(walls(row, col)) % row and col is the current position of the car
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
    end
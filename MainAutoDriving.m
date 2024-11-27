
% Main File for autonomous driving

%adjust values
%Starting Matrix [start position = 1, 1st destination = 2, end destination = 3]
destinationMat = zeros(3, 6);
%now add values 
% ex) destinationMat(x,y) = #




% Global variables and arrays
distance = zeros(3, 6); % array that contains distance away from destination
%% [NOT USED, WALL IS HARD CODED RN] walls = zeros(3, 6); % array representation of maze, contains config # of walls


%% Wall Diagram: https://github.com/cachng/FSE100-Car/blob/main/Wall%20Hard%20Code%20Diagram.png
%% Wall Matrix is coded with Exit Sign in top left and battery station to the right (see diagram ^)

walls = [12, 12, 8, 10, 2, 7; 1, 6, 1, 13, 6, 4; 5, 10, 4, 11, 13, 6];
configAdjust = ones(3,6);
%subtract 1 from every element to make it the same as the config, 14 is not needed
walls = walls - configAdjust;

%colorMat does not account for red stop zones 
%starting value is at 1,1 (column, row)
%reminder matrix is counted top left to bottom right ie 1st column 1st row is top right nth row nth column bottom right
colorMat = zeros(3, 6);
colorMat(1,1) = 3;
colorMat(2,4) = 2;
colorMat(3,5) = 2;




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
endColor = 2; % 1 is 
%% Wall COnfig image: https://github.com/cachng/FSE100-Car/blob/main/Wall%20Type%20Diagram.png



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

    % Robot checks where it can move and orientates itself to go straight
    %
    %Make it so it detects color and reacts
    %
    
    if distance(position(1), positon(2)) - 1 == distance(position(1) - 1, position(2)) % checks if there is a possible path up
        while orientation ~= 0 % turns robot if needed
            brick.MoveMotorAngleRel('A', 20, -180, 'Coast');
            brick.MoveMotorAngleRel('D', 20, 180, 'Coast');
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            orientation = orientation + 1;
            orientation = mod(orientation, 4);
            position(1) = position(1) - 1;
        end
    elseif distance(position(1), positon(2)) - 1 == distance(position(1), position(2) + 1) % checks if there is a possible path right
        while orientation ~= 1 % turns robot if needed
            brick.MoveMotorAngleRel('A', 20, -180, 'Coast');
            brick.MoveMotorAngleRel('D', 20, 180, 'Coast');
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            orientation = orientation + 1;
            orientation = mod(orientation, 4);
            position(2) = position(2) + 1;
        end
    elseif distance(position(1), positon(2)) - 1 == distance(position(1) + 1, position(2)) % checks if there is a possible path down
        while orientation ~= 2 % turns robot if needed
            brick.MoveMotorAngleRel('A', 20, -180, 'Coast');
            brick.MoveMotorAngleRel('D', 20, 180, 'Coast');
            brick.WaitForMotor('A'); % Wait for motor to complete motion 
            orientation = orientation + 1;
            orientation = mod(orientation, 4);
            position(1) = position(1) + 1;
        end
    elseif distance(position(1), positon(2)) - 1 == distance(position(1), position(2) - 1) % checks if there is a possible path left
        while orientation ~= 3 % turns robot if needed
            brick.MoveMotorAngleRel('A', 20, -180, 'Coast'); 
            brick.MoveMotorAngleRel('D', 20, 180, 'Coast');
            brick.WaitForMotor('A'); % Wait for motor to complete motion
            orientation = orientation + 1;
            orientation = mod(orientation, 4);
            position(2) = position(2) - 1;
        end
    end
    brick.moveMotor('A', 41)
    brick.moveMotor('D', 40)
    wait(1); % whatever seconds enough time for the robot to travel from one cell to the next
end

brick.stopAllMotors(); % stops all motors when it reaches a destination

manualDriving()

function drive = ManualDriving()
    %Names: Omar Douglas Cardin Nguyen Shawn Walden Isiah Morris
    %terminate program by using control + c

    %Motor Ports:
    %Left Motor: A
    %Right Motor: D
    %Lift Motor: C

    %Controls:
    %Movement: WASD
    %Lift: I (lower), O (raise)w
    %Strength (Decrease, Increase)
    %Motor: Q, E
    %Lift : K, L

    %brick.playTone(100, 440, 100); %connect tone A=440hz
    global key 
    InitKeyboard();
    %speed control
    y=50; %lift strength
    x=50; %motor strength

    while 1
    pause (0.1);
    switch key
        
    %Strength Adjustment
        case 'q'
        x=x-10;
        x=abs(x);
        disp('motor speed down')
        case 'e'
        x=x+10;
        disp('motor speed up')
        
        case 'k'
        y=y-25;
        y=abs(y);
        disp('lift speed down')
        case 'l'
        y=y+25;
        disp('lift speed up')

    %Movement (may need to invert for future use)
        case 'w'
        brick.MoveMotor('A', x); % Motor A forward at x speed.
        brick.MoveMotor('D', x); % Motor A forward at x speed.
      
        case 's'
        brick.MoveMotor('A', -x); % Motor A forward at x speed.
        brick.MoveMotor('D', -x); % Motor A forward at x speed.
        
        case 'a'
        brick.MoveMotor('A', x); % Motor A forward at x speed.
        brick.MoveMotor('D', -x); % Motor A forward at x speed.
               
        case 'd'
        brick.MoveMotor('A', -x); % Motor A forward at x speed.
        brick.MoveMotor('D', x); % Motor A forward at x speed.
        
       
    %lift control
        case 'i'
        brick.MoveMotor('C', -y); % Lower Lift
        disp('lower claw')

        case 'o'
        brick.MoveMotor('C', y); % Raise.
        disp('lift claw')
        

    %other cases
        case 0 % No key is being pressed.
        brick.StopMotor('A', 'Coast'); % Motor A drift to Stop
        brick.StopMotor('D', 'Coast'); % Motor D drift to Stop

        case 'x' %Quit Program/Fail Safe
        %Motors
        brick.StopMotor('A', 'Coast'); % Motor A drift to Stop
        %brick.StopMotor('B', 'Coast'); % Motor B drift to Stop 
        %brick.StopMotor('C', 'Coast'); % Motor C drift to Stop (Lift probably shouldnt coast)
        brick.StopMotor('D', 'Coast'); % Motor D drift to Stop        
        break;
        end
    end
    CloseKeyboard ( ) ;

end
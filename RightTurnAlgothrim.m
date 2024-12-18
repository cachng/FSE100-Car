% Function to simulate following the right wall in a maze
endColor = 2;
%{
    Initialize EV3 sensors
    colorSensor = brick.SetColorMode(2,2);
    frontDistance = brick.UltrasonicDist(3);
    leftDistance = brick.UltrasonicDist(4);
    rightDistance = brick.UltrasonicDist(1);
%}
    % Set threshold for detecting walls (in cm)
    wallThreshold = 25; % Adjust based on your maze setup
    % Start moving in the maze

    color = 0;
    while (color ~= endColor)
        % Read distances from the ultrasonic sensors
    frontDistance = brick.UltrasonicDist(3);
    %leftDistance = brick.UltrasonicDist(4);
    rightDistance = brick.UltrasonicDist(1);
        
        % Right wall-following logic
        if rightDistance > wallThreshold
            % If there's space on the right, turn right and move forward
            turnRight;
            moveForward;
        elseif frontDistance > wallThreshold
            % If there's no wall in front, move forward
            moveForward;

        else
            % If there's a wall in front, turn left
            turnLeft;
        end

        % Read the color sensor for current position


        % Pause for a short time to allow sensor readings to update
        pause(0.2);


        brick.SetColorMode(2, 2); % Define Color Function, In Color Mode
        color = brick.ColorCode(2);
               
    end

    disp('Reached the endpoint!');

% Function to move the EV3 robot forward
function moveForward
    brick.MoveMotor('A', 25); % Motor A (right) forward at x speed.
    brick.MoveMotor('D', 25); % Motor D (left)  forward at x speed.
    pause(0.5); % Adjust for how long the robot should move forward
    brick.StopMotor('AD', 'Coast'); % Motor A drift to Stop

    
end

% Function to turn the EV3 robot right
function turnRight
    brick.MoveMotor('A', -25); % Motor A (right) forward at x speed.
    brick.MoveMotor('D', 25); % Motor D (left)  forward at x speed.
    pause(0.3); % Adjust for how long the robot should move forward
    brick.StopMotor('AD', 'Coast'); % Motor A drift to Stop
end

% Function to turn the EV3 robot left
function turnLeft
    brick.MoveMotor('A', 25); % Motor A (right) forward at x speed.
    brick.MoveMotor('D', -25); % Motor D (left)  forward at x speed.
    pause(0.3); % Adjust for how long the robot should move forward
    brick.StopMotor('A', 'Coast'); % Motor A drift to Stop
    brick.StopMotor('D', 'Coast'); % Motor A drift to Stop
end

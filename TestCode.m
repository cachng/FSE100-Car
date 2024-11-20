%{
ports:
ultrasonic: 1
color: 2
touch: 3
left motor:  A
right motor: D
%}


leftMotorFrontAmt = 40;   %D
rightMotorFrontAmt = 40; %A

leftMotorBackAmt = -15;
rightMotorBackAmt = -15;

thresholdRightWall = 50;
thresholdFrontWall = 25;

brick.SetColorMode(2, 2);

while 1
    %Move Forward
    brick.MoveMotor('A', leftMotorFrontAmt);
    brick.MoveMotor('D', rightMotorFrontAmt);
    
    %Get Sensor Readings
    frontWallDist = brick.UltrasonicDist(3);
    disp(frontWallDist);
    color = brick.ColorCode(2);
    rightWallDist = brick.UltrasonicDist(1);
    disp(rightWallDist);
    
    %Color Decisions
    % if color == 5                      %if color is red stop for 4 sec
    %     disp('red');
    %     brick.StopMotor('AD', 'Coast'); %Coast to prevent going off course
    %     pause(4); %wait 4 seconds
    %     brick.MoveMotor('A', leftMotorFrontAmt);
    %     brick.MoveMotor('D', rightMotorFrontAmt);
    %     pause(0.5);
    % elseif color == 2 || color == 3    %if color is blue or green, activate keyboard control
    %     disp('blue/green');
    %     disp('switch to manual control');
    %     brick.MoveMotor('A', leftMotorFrontAmt);
    %     brick.MoveMotor('D', rightMotorFrontAmt);
    %     break
    % end
    
    %Navigation
    if rightWallDist > thresholdRightWall                %if right wall falls away from right side
        disp('no right wall');
        pause(0.6); %wait to get past wall
        brick.StopMotor('AD', 'Coast');
        brick.MoveMotor('A', -20);
        pause(2.3); %turning time
        brick.StopMotor('A', 'Coast');
        brick.MoveMotor('A', leftMotorFrontAmt);
        brick.MoveMotor('D', rightMotorFrontAmt);
        pause(2);
    end
    if frontWallDist < thresholdFrontWall %if hit wall in front
        pause(1); %keep going forward for a short period of time in order to calibrate
        
        disp('touched');
        brick.StopMotor('AD');          %stop
        % dist = brick.UltrasonicDist(1); %get distance from right wall
        brick.MoveMotorAngleRel('A', leftMotorBackAmt, 180, "Coast");
        brick.MoveMotorAngleRel('D', -rightMotorBackAmt, 180, "Coast");
        % pause(4); %time to back up from wall
        brick.StopMotor('AD', 'Coast'); %stop
        
        %theoretically should never get here if previous method right
        if rightWallDist < thresholdRightWall %if there is no wall on the right
            brick.MoveMotor('D', -20);
            pause(3.2);
            brick.StopMotor('D', 'Coast');
            brick.MoveMotor('A', leftMotorFrontAmt);
            brick.MoveMotor('D', rightMotorFrontAmt);
            pause(2);
            disp("jaja")
        else %if there is a wall on the right
            brick.MoveMotor('A', -21);
            pause(2.5);
            brick.StopMotor('A', 'Coast');
            brick.MoveMotor('A', leftMotorFrontAmt);
            brick.MoveMotor('D', rightMotorFrontAmt);
            pause(2);
        end
    end
end
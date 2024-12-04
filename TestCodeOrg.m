%{
Mode 2 returns the following values
0 - unknown color
1 - black
2 - blue
3 - green
4 - yellow
5 - red
6 - white 
7 - brown
%}
i=0;
endColor = 2 %blue

leftMotorFrontAmt = 41;   %A
rightMotorFrontAmt = 40; %D

rightMotorBackAmt = -15;
leftMotorBackAmt = -16;

thresholdRightWall = 50;
thresholdFrontWall = 25;

brick.SetColorMode(2, 2);

while 1
    %Move Forward
    brick.MoveMotor('A', rightMotorFrontAmt);
    brick.MoveMotor('D', leftMotorFrontAmt);
    
    %Get Sensor Readings
    frontWallDist = brick.UltrasonicDist(3);
    color = brick.ColorCode(2);
    rightWallDist = brick.UltrasonicDist(1);
    pause(.1);

    %Color Decisions
    if color == 5                      %if color is red stop for 4 sec
        disp('red');
        brick.StopMotor('AD', 'Brake'); %Brake to prevent going off course
        pause(4); %wait 4 seconds
    end
    if color == endColor   %if color is blue or green, activate keyboard control
        disp('end color');
        disp('switch to manual control');
        brick.StopMotor('AD', 'Coast'); %stop
        break;

    end
    
    %Navigation
    if rightWallDist > thresholdRightWall                %if right wall falls away from right side
        disp('no right wall');
        pause(1.5); %wait to get past wall
        brick.StopMotor('AD', 'Brake');
        brick.MoveMotor('A', -25);
        pause(2.3); %turning time
        brick.StopMotor('A', 'Brake');
        brick.MoveMotor('A', rightMotorFrontAmt);
        brick.MoveMotor('D', leftMotorFrontAmt);
        pause(2);
    end
    if frontWallDist < thresholdFrontWall %if hit wall in front
        pause(1); %keep going forward for a short period of time in order to calibrate
        
        disp('touched');
        brick.StopMotor('AD');          %stop
        % dist = brick.UltrasonicDist(1); %get distance from right wall
        brick.MoveMotor('A', rightMotorBackAmt);
        brick.MoveMotor('D', leftMotorBackAmt);
        pause(3.5); %time to back up from wall
        brick.StopMotor('AD', 'Brake'); %stop
        
        %theoretically should never get here if previous method right
        if rightWallDist < thresholdRightWall || rightWallDist > 245 %if there is no wall on the right
            disp('got to this one lmao')
            if lefttWallDist< thresholdRightWall
            brick.StopMotor('AD', 'Brake');
            brick.MoveMotor('D', -25)
            pause(2.5);
            brick.StopMotor('D', 'Brake');
            brick.MoveMotor('A', rightMotorFrontAmt);
            brick.MoveMotor('D', leftMotorFrontAmt);
            pause(2);
            disp("turn left");
            else
            brick.StopMotor('AD', 'Brake');
            brick.MoveMotor('A', -25);
            pause(2.5);
            brick.StopMotor('D', 'Brake');
            brick.MoveMotor('A', rightMotorFrontAmt);
            brick.MoveMotor('D', leftMotorFrontAmt);
            pause(2);
            disp("turn right");
            
            
            end
            
          
        else %if there is a wall on the right
            disp("saw r wall")
            brick.StopMotor('A', 'Brake');
            brick.MoveMotor('A', -rightMotorFrontAmt);
            brick.MoveMotor('D', -leftMotorFrontAmt);
            brick.StopMotor('AD', 'Brake');
            brick.MoveMotor('D', -25)
            pause(2);

        end
    end
end
%{
ports:
ultrasonic: 1
color: 2
touch: 3
left motor:  A
right motor: D
%}


motorlf = -57;   %A
motorrf = -54.8; %D
motorlb = 20;
motorrb = 18.5;

thresholdRightWall = 50;
thresholdFrontWall = 25;

brick.SetColorMode(2, 2);

while 1
    %Move Forward
    brick.MoveMotor('A', motorlf);
    brick.MoveMotor('D', motorrf);
    
    %Get Sensor Readings
    frontWallDist = brick.UltrasonicDist(3);
    color = brick.ColorCode(2);
    rightWallDist = brick.UltrasonicDist(1);
    
    %Color Decisions
    if color == 5                      %if color is red stop for 4 sec
        disp('red');
        brick.StopMotor('AD', 'Brake'); %Brake to prevent going off course
        pause(4); %wait 4 seconds
        brick.MoveMotor('A', motorlf);
        brick.MoveMotor('D', motorrf);
        pause(0.5);
    elseif color == 2 || color == 3    %if color is blue or green, activate keyboard control
        disp('blue/green');
        disp('switch to manual control');
        brick.MoveMotor('A', motorlf);
        brick.MoveMotor('D', motorrf);
        pause(6);
    end
    
    %Navigation
    if rightWallDist > thresholdRightWall                %if right wall falls away from right side
        pause(0.6); %wait to get past wall
        brick.StopMotor('AD', 'Brake');
        brick.MoveMotor('A', -20);
        pause(2.3); %turning time
        brick.StopMotor('A', 'Brake');
        brick.MoveMotor('A', motorlf);
        brick.MoveMotor('D', motorrf);
        pause(2);
    end
    if frontWallDist < thresholdFrontWall %if hit wall in front
        pause(1); %keep going forward for a short period of time in order to calibrate
        
        disp('touched');
        brick.StopMotor('AD');          %stop
        % dist = brick.UltrasonicDist(1); %get distance from right wall
        brick.MoveMotor('A', motorlb);
        brick.MoveMotor('D', motorrb);
        pause(3.5); %time to back up from wall
        brick.StopMotor('AD', 'Brake'); %stop
        
        %theoretically should never get here if previous method right
        if rightWallDist < thresholdRightWall %if there is no wall on the right
            brick.MoveMotor('D', -18.5);
            pause(2.5);
            brick.StopMotor('D', 'Brake');
            brick.MoveMotor('A', motorlf);
            brick.MoveMotor('D', motorrf);
            pause(2);
        else %if there is a wall on the right
            brick.MoveMotor('A', -21);
            pause(2.5);
            brick.StopMotor('A', 'Brake');
            brick.MoveMotor('A', motorlf);
            brick.MoveMotor('D', motorrf);
            pause(2);
        end
    end
end
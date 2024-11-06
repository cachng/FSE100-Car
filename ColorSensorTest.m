%{
Test Color Sensor
    Requirements
    Your robot stops for one second when it sees red.
    Your robot stops and beeps two times when it sees blue.
    Your robot stops and beeps three times when it sees green.


%}
while 1 
    brick.SetColorMode(4, 2); % Define Color Function, In Color Mode
    color = brick.ColorCode(4);
    brick.MoveMotor('AD', 10);
    if (color == 2) % Test for blue color
        brick.StopAllMotors();
        for i=0:1
            brick.playTone(100, 440, 100);
            pause(1);
        end
    break; %End loop
    end
    
    if (color == 3) % Test for green color
        brick.StopAllMotors();
        for i=0:2
            brick.playTone(100, 440, 100);
            pause(1);
        end
    break; %End loop
    end
    if (color == 5) % Test for red color
        brick.StopAllMotors();
        pause(1);
        brick.MoveMotor('AD', 10);

    end
    if (color == 4) % Test for yellow color
        brick.StopAllMotors();
        pause(1);
        brick.MoveMotor('AD', 10);
    break; %End loop

    end

end
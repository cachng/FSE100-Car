%Test Color Sensor
while 1 
    brick.SetColorMode(4, 2); % Define Color Function, In Color Mode
    color = brick.ColorCode(4);
    brick.MoveMotor('AD', x);
    if (color == 2) % Test for blue color
        brick.StopAllMotors();
        for i=0:1
            brick.playTone(100, 440, 100);
            pause(1);
        end
    brick.playTone(100, 440, 100);  %Sound to A=440hz
    break; %End loop
    end
    if (color == 3) % Test for green color
        brick.StopAllMotors();
        for i=0:2
            brick.playTone(100, 440, 100);
            pause(1);
        end
    if (color == 5) % Test for blue color
        brick.StopAllMotors();
        pause(1);
        brick.MoveMotor('AD', x);
    end
    break; %End loop
    end
end
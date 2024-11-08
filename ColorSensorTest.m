%Test Color Sensor
while 1 
    color = brick.SetColorMode(2, 2); % Define Color Function, In Color Mode
    if (color == 1) % Test for black color
    brick.playTone(100, 440, 100);  %Sound to A=440hz
    break; %End loop
    end
end
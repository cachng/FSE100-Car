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
    if (color == 2) % Test for blue color
    disp("blue");  
    end
    if (color == 3) % Test for green color
    disp("green");   
    end
    if (color == 5) % Test for red color
    disp("red");
    end
    if (color == 4) % Test for yellow color
    disp("yellow");
    end
end
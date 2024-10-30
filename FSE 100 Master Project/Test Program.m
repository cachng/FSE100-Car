%Names: Omar Douglas Cardin Nguyen Shawn Walden Isiah Morris
brick = ConnectBrick('POOLA'); % Connects to the Brick, delete if already connected

%Test Tone
while 1 
    brick.playTone(100, 440, 100);  %Sound to A=440hz
    touch = brick.TouchPressed(1) % Define Touch
    if touch % Test for input
    break; %End loop
    end
end
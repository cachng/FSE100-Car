%{
documentation
https://canvas.asu.edu/courses/199417/pages/matlab-documentation-2?module_item_id=14453209
color sensor
https://canvas.asu.edu/courses/199417/pages/color-sensor
ultrasonic sensor
https://canvas.asu.edu/courses/199417/pages/ultrasonic-sensor

notes:

COLOR SENSOR ------
"brick.SetColorMode(SensorPort, Mode);"
May have to set Color Mode first
or use "color = brick.ColorCode(SensorPort);" instead
Color Sensor reports an integer, make sure that code doesn't check for a
string instead of an int
Color Mode 2 seems to be of the most use, detecting the yellow pickup
floor, etc
if mode 2 doesn't work well, we can use color_rgb but it will need to be
adjusted for ranges as it is likely not precise

Mode 2 returns the following values
0 - unknown color
1 - black
2 - blue
3 - green
4 - yellow
5 - red
6 - white 
7 - brown

ULTRASONIC SENSOR------
"distance = brick.UltrasonicDist(SensorPort);"
we might need more than 1 sensor, it only detects distance, not sure if
it's in multiple directions because it only gives one output ?? 
might be able to make it work if
we set a variable to determine the direction it has to turn (say it needs
to go right a few times on the way to the pick up zone) and then swap the
variable for the way back when it has to make only left turns
function could be something like "if distance is [a little over the turning
radius] then turn x (left or right) direction

Ultrasonic sensor only returns the distance of the nearest object in
centimeters
if it's too close or too far, it will return 255 (max distance)


dimensions
~16cmx21cm
%}

%test Ultrasonic Sensor
x = 25
while 1
    brick.MoveMotor('AD', x);
    distanceZ = brick.UltrasonicDist(3);
    distanceRight = brick.UltrasonicDist(4);
    distanceLeft  = brick.UltrasonicDist(1);
    if (distance == 45)
        brick.StopMotor('AD', 'Coast'); % Motor AD drift to Stop
        if (distanceLeft>=10) %turn right
        brick.MoveMotor('D', -x);
        brick.MoveMotor('A', x);
        pause(0.5);
        end
    else if (distanceRight>=10)
        brick.MoveMotor('D', x);
        brick.MoveMotor('A', -x);
        pause(0.5);    
        end
    end
end
brick.StopMotor('AD', 'Coast'); % Motor AD drift to Stop
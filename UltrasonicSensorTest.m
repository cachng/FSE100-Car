%test Ultrasonic Sensor
i = 1;
x=10;
while (i == 1)
    brick.MoveMotor('AD', x);
    distance = brick.UltrasonicDist(3);
    if (distance <= 10)
        brick.StopAllMotors();
        pause(3);
        brick.StopAllMotors();
        i = 0;
    end
end
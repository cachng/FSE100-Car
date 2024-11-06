%test Ultrasonic Sensor
i = 1;
while (i == 1)
    distance = brick.UltrasonicDist(2);
    if (distance == 5)
        brick.StopAllMotors();
        brick.MoveMotor('D', x);
        pause(3);
        brick.StopAllMotors();
        i = 0;
    end
end
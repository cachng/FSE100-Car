%{
Names: Omar Douglas Cardin Nguyen Shawn Walden Isiah Morris
terminate program by using control + c

Potential function for manual movement to be prompted when the sensor sees
yellow, it's just a brief wip don't know if it works)

yellow = 4
Motor Ports:
    %Left Motor: A
    %Right Motor: D
    %Lift Motor: C

Controls:
Movement: WASD
Lift: I (lower), O (raise)
Strength (Decrease, Increase)
    Motor: Q, E
    Lift : K, L
%}

function ManualControl()
     ManualControl = {
    
global key 
InitKeyboard();
%speed control
y=10; %lift strength
x=30; %motor strength

while 1
    pause (0.1);
    switch key

%Check for Color
    Color = brick.SetColorMode(4, 2);

%Strength Adjustment
    %motor
        case 'q'
        x=x-10;
        x=abs(x);
        disp('motor speed down')
        case 'e'
        x=x+10;
        disp('motor speed up')
    %lift        
        case 'k'
        y=y-2;
        y=abs(y);
        disp('lift speed down')
        case 'l'
        y=y+2;
        disp('lift speed up')

        
%Movement (may need to invert for future use)
        case 'w'
        brick.MoveMotor('AD', x); % Motor A and D forward at x speed 
      
        case 's'
        brick.MoveMotor('AD', -x); % Motor A and D backward at x speed.
  
        case 'a' %may want to update to "brick.MoveMotorAngleRel(MotorPort, Speed, Angle, BrakeType);"
        brick.MoveMotor('A', x); % Motor A forward at x speed.
        brick.MoveMotor('D', -x); % Motor A forward at x speed.
               
        case 'd'
        brick.MoveMotor('A', -x); % Motor A forward at x speed.
        brick.MoveMotor('D', x); % Motor A forward at x speed.
        
       
%lift control
        case 'i'
        brick.MoveMotor('C', -y); % Lower Lift
        disp('lower claw')

        case 'o'
        brick.MoveMotor('C', y); % Raise.
        disp('lift claw')
        

%other cases
        case 0 % No key is being pressed.
        brick.StopMotor('AD', 'Coast'); % Motor A and D motor to coast (turn off motor instead of a full break)
        
        case 'x' %Quit Program/Fail Safe
        %Motors
        brick.StopMotor('AD', 'Coast'); % Motor A drift to Stop
        %brick.StopMotor('B', 'Coast'); % Motor B drift to Stop 
        %brick.StopMotor('C', 'Coast'); % Motor C drift to Stop (Lift probably shouldn't coast)     
        break;
        
        case (Color==4) %Quit Program/Fail Safe (assigned to color, when it
        %does not detect color, it should quit)
        pause (1); %1 seconds before it shuts off (it probably won't accept movement input in the middle of it)
        % can probably solve with a for statement that handles input
        % temporarily, it won't be efficient but it may work
            if (Color==4)
            brick.StopMotor('AD', 'Coast'); % Motor A drift to Stop
            break;
            end
                
        end
    end
CloseKeyboard ( ) ;
}
end

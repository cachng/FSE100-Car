%Names: Omar Douglas Cardin Nguyen Shawn Walden Isiah Morris
%terminate program by using control + c

%Motor Ports:
    %Left Motor: A
    %Right Motor: D
    %Lift Motor: C

%Controls:
%Movement: WASD
%Lift: I (lower), O (raise)w
%Strength (Decrease, Increase)
    %Motor: Q, E
    %Lift : K, L

%brick.playTone(100, 440, 100); %connect tone A=440hz
global key 
InitKeyboard();
%speed control
y=10; %lift strength
x=50; %motor strength

while 1
    pause (0.1);
    switch key
        
%Strength Adjustment
        case'q'
        x=x-10;
        x=abs(x);
        disp('motor speed down')
        case 'e'
        x=x+10;
        disp('motor speed up')
        
        case 'k'
        y=y-25;
        y=abs(y);
        disp('lift speed down')
        case 'l'
        y=y+25;
        disp('lift speed up')

%Movement (may need to invert for future use)
        case 'w'
        brick.MoveMotor('A', x); % Motor A forward at x speed.
        brick.MoveMotor('D', x); % Motor A forward at x speed.
      
        case 's'
        brick.MoveMotor('A', -x); % Motor A forward at x speed.
        brick.MoveMotor('D', -x); % Motor A forward at x speed.
        
        case 'a'
        brick.MoveMotor('A', x); % Motor A forward at x speed.
        brick.MoveMotor('D', -x); % Motor A forward at x speed.
               
        case 'd'
        brick.MoveMotor('A', -x); % Motor A forward at x speed.
        brick.MoveMotor('D', x); % Motor A forward at x speed.
        
       
%lift control
        case 'i'
        brick.MoveMotor('C', -y); % Lower Lift
        pause(.1)
        brick.StopMotor('C', 'Coast'); % Motor A drift to Stop
        disp('lower claw')

        case 'o'
        brick.MoveMotor('C', y); % Raise.
        pause(.1)
        disp('lift claw')
        brick.StopMotor('C', 'Coast'); % Motor A drift to Stop

%other cases
        case 0 % No key is being pressed.
        brick.StopMotor('A', 'Coast'); % Motor A drift to Stop
        brick.StopMotor('D', 'Coast'); % Motor D drift to Stop

        case 'x' %Quit Program/Fail Safe
        %Motors
        brick.StopMotor('A', 'Coast'); % Motor A drift to Stop
        %brick.StopMotor('B', 'Coast'); % Motor B drift to Stop 
        %brick.StopMotor('C', 'Coast'); % Motor C drift to Stop (Lift probably shouldn't coast)
        brick.StopMotor('D', 'Coast'); % Motor D drift to Stop        
        break;
    end
end
CloseKeyboard ( ) ;

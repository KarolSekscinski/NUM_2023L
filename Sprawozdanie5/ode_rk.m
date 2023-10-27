% rk - Runge-Kutta method for solving ODEs
% 
% Usage: [x,y] = rk(f,y0,range,h,order)

% Input: f - function of (x,y)
% y0 - initial value of y
% range - [x0,x1]
% h - step size
% order - order of the method (1,2,3,4)

function [x,y] = ode_rk(f,y0,range,h,order)
arguments
    f (1,1) function_handle
    y0 (1,1) double
    range (1,2) double
    h (1,1) double
    order (1,1) double {mustBeInteger,mustBePositive}
end

x = range(1):h:range(2);
y = zeros(1,length(x));
y(1) = y0;

switch order
    case 1
        for i = 1:length(x)-1
            y(i+1) = y(i) + h*f(x(i),y(i));
        end
    case 2
        for i = 1:length(x)-1
            k1 = f(x(i),y(i));
            k2 = f(x(i)+h,y(i)+h*k1);
            y(i+1) = y(i) + h/2*(k1+k2);
        end
    case 3
        for i = 1:length(x)-1
            k1 = f(x(i),y(i));
            k2 = f(x(i)+h/2,y(i)+h/2*k1);
            k3 = f(x(i)+h,y(i)-h*k1+2*h*k2);
            y(i+1) = y(i) + h/6*(k1+4*k2+k3);
        end
    case 4
        for i = 1:length(x)-1
            k1 = f(x(i),y(i));
            k2 = f(x(i)+h/2,y(i)+h/2*k1);
            k3 = f(x(i)+h/2,y(i)+h/2*k2);
            k4 = f(x(i)+h,y(i)+h*k3);
            y(i+1) = y(i) + h/6*(k1+2*k2+2*k3+k4);
        end
    otherwise
        error('Order must be 1,2,3 or 4')
end

end

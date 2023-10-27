% ode_am - Adams-Moulton method for solving ODEs
% 
% Usage: [x,y] = rk(f,y0,range,h,order)

% Input: f - function of (x,y)
% y0 - initial value of y
% range - [x0,x1]
% h - step size
% order - order of the method (1,2,3,4)

function [x,y] = ode_am(f,y0,range,h,order)
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
    [~,y_st] = ode_ab(f,y0,[range(1), range(2)],h, 4);
    switch order
        case 1
            for i = 2:length(x) 
                y(i) = y(i-1) + h*(f(x(i),y_st(i)));
            end
        case 2
            
            for i = 2:length(x) 
                if i <= order
                    [~,y_sta] = ode_am(f,y0,[range(1), range(2)],h, order - 1);
                    y(i) = y_sta(i);
                else 
                     y(i) = y(i-1) + h/2*(f(x(i),y_st(i)) + f(x(i-1),y(i-1)));
                end
                
            end
        case 3
            for i = 2:length(x) 
                if i <= order
                    [~,y_sta] = ode_am(f,y0,[range(1), range(2)],h, order - 1);
                    y(i) = y_sta(i);
                else  
                    y(i) = y(i-1) + h/12*(5*f(x(i),y_st(i)) + 8*f(x(i-1),y(i-1)) - f(x(i-2),y(i-2)));
                end
            end
        case 4
            for i = 2:length(x) 
                if i <= order
                    [~,y_sta] = ode_am(f,y0,[range(1), range(2)],h, order - 1);
                    y(i) = y_sta(i);
                else  
                    y(i) = y(i-1) + h/24*(9*f(x(i),y_st(i)) + 19*f(x(i-1),y(i-1)) - 5*f(x(i-2),y(i-2)) + f(x(i-3),y(i-3)));
                end
            end
        otherwise
            error('Order must be 1, 2, 3 or 4')
    end


end

function [x_new,y_new] = NACA_Airfoil(m,p,t,c,N)
    x = linspace(0,c,N); % Iterate an array for x along the chord
    
    % Initial Declarations:
    y_t = zeros(1,length(x)); % y_t
    y_c = zeros(1,length(x)); % y_c
    XU = zeros(1,length(x)); XL = zeros(1,length(x));
    YU = zeros(1,length(x)); YL = zeros(1,length(x));
    x_new = zeros(1,length(x)-1); y_new = zeros(1,length(x)-1);
    
    for i=1:length(x)
        % Calculate y_t of the airfoil
        y_t(i) = (t/0.2*c)*((0.2969*sqrt(x(i)/c)-0.1260*(x(i)/c)-0.3516*(x(i)/c).^2+0.2843*(x(i)/c).^3-0.1036*(x(i)/c).^4)); % Function for y_t
        
        if x(i) >= 0 && x(i) < p*c
            y_c(i) = m.*(x(i)/p^2)*(2*p - x(i)/c);
        else if x(i) >= p*c && x(i) <= c
                y_c(i) = m*(c-x(i))/(1-p)^2 * (1+ x(i)/c - 2*p);
            end
        end
        
        % Calculate XU, XL, YU, and YL for thr airfoil
        %zeta = atan((deltay)/(c/N))% Angle zeta: atan(dy_c/dx)
        if i == 1
            zeta(i) = atan((y_c(i))/(2*c/N));
        else
            zeta(i) = atan((y_c(i) - y_c(i-1))/(2*c*N));
        end
        XU(i) = x(i)-y_t(i)*sin(zeta(i)); % X locations for the upper surface
        YU(i) = y_c(i)+y_t(i)*cos(zeta(i)); % Y locations for the upper surface
        XL(i) = x(i)+y_t(i)*sin(zeta(i)); % X locations for the lower surface
        YL(i) = y_c(i) - y_t(i)*cos(zeta(i)); % Y locations for the lower surface
    end
    
    % Assign the lower and upper surface values to x,y
    XL = fliplr(XL);
    YL = fliplr(YL);
    for i=1:length(XU)
        x_new(i) = XL(i);
        y_new(i) = YL(i);
    end
    x_new = [x_new(1:N-1) XU];
    y_new = [y_new(1:N-1) YU];
end
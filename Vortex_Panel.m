function [c_l] = Vortex_Panel(Xb,Yb,V_inf,alpha)
    Mp = length(Xb); % Make sure there is the same number of x and y data values
    M = Mp-1; % Next iteration of M
    alpha = alpha*pi/180; % Convert to degrees

% Coordinates (x,y) of control point and panel length S are 
% computed for each of the vortex panels
    for i = 1:M 
        ip = i+1; % Next i
        x(i) = 0.5*(Xb(i)+Xb(ip));
        y(i) = 0.5*(Yb(i)+Yb(ip));
        s(i) = sqrt((Xb(ip)-Xb(i))^2 + (Yb(ip)-Yb(i))^2); 

        theta(i) = atan2((Yb(ip)-Yb(i)),(Xb(ip)-Xb(i))); % Calculate theta
        sine(i) = sin(theta(i)); %Calculate sine(theta)
        cosine(i) = cos(theta(i)); % Calculate cosine(theta)
        RHS(i) = sin(theta(i)-alpha); % RHS represents the right-hand side of Eq. (5.47)
    end

    for i = 1:M
        for j = 1:M
            if (i == j)
                CN1(i,j) = -1.0;
                CN2(i,j) = 1.0;
                CT1(i,j) = 0.5*pi;
                CT2(i,j) = 0.5*pi;
            else
                % Calculate the geometric constnats (check with Evans' email)
                A = -(x(i)-Xb(j))*cosine(j) - (y(i)-Yb(j))*sine(j); % Correct
                B = (x(i)-Xb(j))^2 + (y(i)-Yb(j))^2; % Correct
                C = sin(theta(i)-theta(j)); % Correct (*-1)
                D = cos(theta(i)-theta(j)); % Correct
                E = ((x(i)-Xb(j))*sine(j) - (y(i)-Yb(j))*cosine(j)); % Correct
                F = log(1.0+s(j)*(s(j)+2.*A)/B); % 
                
                G = atan2(E*s(j), B+A*s(j)); % Correct
                P = ((x(i)-Xb(j))*sin(theta(i)-2.*theta(j)) + (y(i)-Yb(j))*cos(theta(i)-2.*theta(j))); % Correct
                Q = (x(i)-Xb(j))*cos(theta(i)-2.*theta(j)) - (y(i)-Yb(j))*sin(theta(i)-2.*theta(j)); % Correct
                CN2(i,j) = D + .5*Q*F/(s(j)) - (A*C+D*E)*G/(s(j));
                CN1(i,j) = .5*D*F + C*G - CN2(i,j);
                CT2(i,j) = C + 0.5*P*F/(s(j)) + (A*D-C*E)*G/(s(j));
                CT1(i,j) = .5*C*F - D*G - CT2(i,j);
            end
        end
    end
    
    %% Compute Influence Coefficients in Eq (5.47) and (5.49)    
    for i = 1:M
       AN(i,1)  = CN1(i,1);
       AN(i,Mp) = CN2(i,M);
       AT(i,1)  = CT1(i,1);
       AT(i,Mp) = CT2(i,M);
       for j=2:M
          AN(i,j) = CN1(i,j) + CN2(i,j-1);
          AT(i,j) = CT1(i,j) + CT2(i,j-1);
       end
    end
    AN(Mp,1) = 1.0;
    AN(Mp,Mp) = 1.0;
    for j=2:M
       AN(Mp,j) = 0.0;
    end
    RHS(Mp) = 0.0;

    %% Solve the Linear System
    Gama = inv(AN)*(RHS'); % Same as multiplying by the inverse (X = inv(A)*B)
    
    for i=1:M
        V(i) = cos(theta(i)-alpha); % Tangential velocity
        for j=1:Mp
           V(i) = V(i) + AT(i,j)*Gama(j); % Calculate the Velocity ratio (V/Vinf) or tangential velocity
           CP(i) = 1.0 - V(i)^2; % Calculate the coeff. of pressure
        end
    end
    
    %% Calculate the Circulation
    Circ = sum(V.*s);% Sum the Circulation of the flow
    
    %% Calculate the Sectional Coefficient of Lift
    c = abs(max(x)-min(x)); % Estimate the chord, based on x
    c_l = 2*Circ/(V_inf*c); % Calculate the secitonal coefficient of lift
    
    %% Plot Everything    
    % Plot the coefficient of pressure Graph for the airfoil
    figure;
    plot(x./c,-CP)
    xlabel('x/c')
    ylabel('C_{p}')


end
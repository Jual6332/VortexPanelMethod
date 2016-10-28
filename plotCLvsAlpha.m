function [alpha_vary,CL] = plotCLvsAlpha(m,p,t,c,N,Vinf)

    % Obtain Airfoil Geometry for given airfoil
    [Xb,Yb] = NACA_Airfoil(m,p,t,c,N); % NACA Airfoil
    alpha_vary = linspace(-5,10); % Vary alpha with linearly space locations
    
    % Calculate cl for the airfoil at every alpha
    for i=1:length(alpha_vary)
        [c_l] = Vortex_Panel(Xb,Yb,Vinf,alpha_vary(i)); % Call Vortex_Panel function
        CL(i) = c_l; % Store this value for c_l
    end


end
function problem3(bool,N,Vinf,m,p,t,c)
    if bool
        % Calculate cl for NACA 0012
        [alpha,CL] = plotCLvsAlpha(m,p,t,c,N,Vinf); % NACA 0012
    
        % Calculate ao (dcl/dalpha)
        dcl_da = (CL(end) - CL(1)) / (pi*alpha(end)/100 - pi*alpha(1)/100); % Calculate dcl/dalpha
        al_o = 0;
        indx = find(CL>0);
        a = alpha(indx(1));
        
        % Print Results for this airfoil
        fprintf('Lift Slope for NACA 0012 is %0.2f \n',dcl_da)
        fprintf('Zero-lift angle of attack for NACA 0012 is %0.2f \n',a)
        fprintf('Thin Airfoil Theory for zero-lift angle of attack is %0.2f \n',al_o)
        fprintf('\n')
        
        % Plot cl vs alpha for NACA 0012
        subplot(2,2,1)
        plot(alpha,CL,'k--','Linewidth',2)
        title('NACA 0012: cl vs \alpha')
        xlabel('\alpha')
        ylabel('c_{l}')


        
        % NACA 2212 Airfoil
        m = 2.0/100.00;p = 2.0/10.0;t = 12.0/100.0;
        % Call function to calculate geometry, and cl
        [alpha,CL] = plotCLvsAlpha(m,p,t,c,N,Vinf); % NACA 2212
        
        % Calculate ao (dcl/dalpha)
        dcl_da = (CL(end) - CL(1)) / (pi*alpha(end)/100 - pi*alpha(1)/100); % Calculate dcl/dalpha
        al_o = alpha(1) - CL(1)/(2*pi); % Zero-lift aoa for thin airfoil theory
        indx = find(CL>0);
        a = alpha(indx(1));
        
        % Print Results for this airfoil
        fprintf('Lift Slope for NACA 2212 is %0.2f \n',dcl_da)
        fprintf('Zero-lift angle of attack for NACA 2212 is %0.2f \n',a)
        fprintf('Thin Airfoil Theory for zero-lift angle of attack is %0.2f \n',al_o)
        fprintf('\n')

        % Plot cl vs alpha for NACA 2212
        subplot(2,2,2)
        plot(alpha,CL,'b--','Linewidth',2)
        title('NACA 2212: cl vs \alpha')
        xlabel('\alpha')
        ylabel('c_{l}')

        

        % NACA 4412 Airfoil
        m = 4.0/100.00;p = 4.0/10.0;t = 12.0/100.0;
        % Call function to calculate geometry, and cl
        [alpha,CL] = plotCLvsAlpha(m,p,t,c,N,Vinf); % NACA 4412
        
        % Calculate ao (dcl/dalpha)
        dcl_da = (CL(end) - CL(1)) / (pi*alpha(end)/100 - pi*alpha(1)/100); % Calculate dcl/dalpha
        al_o = alpha(1) - CL(1)/(2*pi); % Zero-lift aoa for thin airfoil theory
        indx = find(CL>0);
        a = alpha(indx(1));
        
        % Print Results for this airfoil
        fprintf('Lift Slope for NACA 4412 is %0.2f \n',dcl_da)
        fprintf('Zero-lift angle of attack for NACA 4412 is %0.2f \n',a)
        fprintf('Thin Airfoil Theory for zero-lift angle of attack is %0.2f \n',al_o)
        fprintf('\n')
        
        % Plot cl vs alpha for NACA 4412
        subplot(2,2,3)
        plot(alpha,CL,'r--','Linewidth',2)
        title('NACA 4412: cl vs \alpha')
        xlabel('\alpha')
        ylabel('c_{l}')

        
        
        % NACA 2430 Airfoil
        m = 2.0/100.00;p = 4.0/10.0;t = 30.0/100.0;
        % Call function to calculate geometry, and cl
        [alpha,CL] = plotCLvsAlpha(m,p,t,c,N,Vinf); % NACA 2430
        
        % Calculate ao (dcl/dalpha)
        dcl_da = (CL(end) - CL(1)) / (pi*alpha(end)/100 - alpha(1)*pi/100); % Calculate dcl/dalpha
        al_o = alpha(1) - CL(1)/(2*pi); % Zero-lift aoa for thin airfoil theory
        indx = find(CL>0);
        a = alpha(indx(1));
        
        % Print Results for this airfoil
        fprintf('Lift Slope for NACA 2430 is %0.2f \n',dcl_da)
        fprintf('Zero-lift angle of attack for NACA 2430 is %0.2f \n',a)
        fprintf('Thin Airfoil Theory for zero-lift angle of attack is %0.2f \n',al_o)
        fprintf('\n')

        % Plot cl vs alpha for NACA 2430
        subplot(2,2,4)
        plot(alpha,CL,'g--','Linewidth',2)
        title('NACA 2430: cl vs \alpha')
        xlabel('\alpha')
        ylabel('c_{l}')
        
    end

end
%% Justin Alvey
% ASEN 3111 - Comp Lab 4
% Date Created: 10/7/16
% Date Last Modified: 10/27/16

%% Clear Everything
clc; clear; close all;

%% Initial Declarations
% Define all constants
N = 1500;  % Number of panels in Vortex Panel Method
Vinf = 25; % Freestream velocity condition
alpha = 0; % Angle of Attack
c = 1.0;   % Chord length 

% Define variables for the geometry of NACA 0012 airfoil
m = 0.0/100.00; % Max camber
p = 0.0/10.0; % Location of max camber
t = 12.0/100; % Thickness

%% Capture Example Airfoil Data from Fortran code
% Airfoil mid-point coordinates from Fortran code
% Used as experimental verification of code early on
exXb = [1.0 0.933 0.750 0.500 0.250 0.067 0.0 0.067 0.250 0.500 0.750 0.933 1.0]; % X-coordinate midpoints for Vpanel Method
exYb = [0.0 -0.005 -0.017 -0.033 -0.042 -0.033 0.0 0.045 0.076 0.072 0.044 0.013 0.0]; % Y-coordinate midpoints for Vpanel Method

%% Problem #1
%cl = Vortex_Panel(exXb,exYb,25,8); % Call Vortex_Panel function to test given aifoil data

%% Problem #2
% Call function to get X,Y locations for the airfoil
[Xb,Yb] = NACA_Airfoil(m,p,t,c,N); % NACA 0012 Airfoil

% Plot the airfoil geometry based on the data
%figure;
plot(Xb, Yb) % Plot airfoil based on the data
xlabel('Xb')
ylabel('Yb')

% Determine cl for NACA 0012 with varying angles of attack (Nominal: N = 10000)
alpha_vary = [-5.0 0.0 5.0 10.0];
for i=1:length(alpha_vary)
    [c_l] = Vortex_Panel(Xb,Yb,Vinf,alpha_vary(i)); % Call Vortex_Panel function
    CL(i) = c_l; % Store this value for c_l
    AirfoilName = strcat(' NACA',num2str(m*100),num2str(10*p),num2str(t*100));
    printLift = strcat('cl for ',AirfoilName,' (',num2str(alpha_vary(i)), ' deg) is %0.4f\n');
    fprintf(printLift,c_l);
end
%dcl_da = (CL(end) - CL(1)) / (pi*(alpha_vary(end) - alpha_vary(1))/100); % Calculate dcl/dalpha

% Plot cl vs alpha for [-5 0 5 10]
plot(alpha_vary,CL,'Linewidth',2)
hold on
plot(alpha_vary,CL,'ko','Linewidth',2)
title('NACA 0012: Sectional Coefficient of Lift vs \alpha')
xlabel('\alpha')
ylabel('c_{l}')

%% Problem #3
% Determine cl vs alpha for a number of airfoils)
alpha_vary = linspace(-5,10);
for i=1:length(alpha_vary)
    [c_l] = Vortex_Panel(Xb,Yb,Vinf,alpha_vary(i)); % Call Vortex_Panel function
    CL(i) = c_l; % Store this value for c_l
end

% Plot cl vs alpha for linearly space range of alpha
plot(alpha_vary,CL,'Linewidth',2)
hold on
plot(alpha_vary,CL,'ko','Linewidth',2)
title('NACA 0012: Coefficient of Lift vs \alpha')
xlabel('\alpha')
ylabel('c_{l}')


%% problem #4
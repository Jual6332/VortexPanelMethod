%% Justin Alvey
% ASEN 3111 - Comp Lab 4
% Date Created: 10/7/16
% Date Last Modified: 10/17/16

%% Clear Everything
clc; clear all; close all;

%% Initial Declarations
% Define all constants
N = 1000;  % Number of panels in Vortex Panel Method
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
%cl = Vortex_Panel(exXb,exYb,25,8); % Call Vortex_Panel function to test
%given aifoil data

%% Problem #2
tic;

% Call function to get X,Y locations for the airfoil
[Xb,Yb] = NACA_Airfoil(m,p,t,c,N); % NACA 0012 Airfoil
% Plot the airfoil geometry based on the data
figure;
plot(Xb, Yb) % Plot airfoil based on the data
xlabel('Xb')
ylabel('Yb')

% Determine cl for NACA 0012 with different numbers of panels
% Calculate cl for N = 1000
[Xb,Yb] = NACA_Airfoil(m,p,t,c,N); % Call airfoil function again with new
[c_l] = Vortex_Panel(Xb,Yb,Vinf,alpha) % Call Vortex_Panel function


% Determine cl for NACA 0012 with varying angles of attack (Nominal: N = 10000)
%alpha = [-5 0 5 10];
%for i=1:length(alpha)
%    [c_l,AN,x,CP,RHS,Gama,theta] = Vortex_Panel(Xb,Yb,25,alpha); % Call Vortex_Panel function
%     CL(i) = c_l; % Store this value for c_l
%end

%% Problem #3
toc;
%% problem #4
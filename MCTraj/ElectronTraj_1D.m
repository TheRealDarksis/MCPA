clear all

set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',14)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);
t = zeros(1,100);  % Time
v = zeros(2,100);  % Velocity
x = zeros(2,100);  % Position
F = 1;             % Force
m = 1;             % Electron mass
a = 1;             % Acceleration

for k = 2:100
    t(k) = t(k-1)+1;
    v(:,k) = v(:, k-1) + 1;
    x(:,k) = x(:,k-1) + v(:,k-1) + 1*0.5;   % F/m*dt^2 = 1/1*1^2 = 1
    
    scatter = rand();
    scatter1 = rand();
    if scatter < 0.05
        v(1,k) = 0;
    end
    if scatter1 < 0.1   %Note: for the second particle, I set the probability of scatter to 0.1
       v(2,k) = 0; 
    end
    drift = mean(v(1,:),2);
    
    subplot(3,1,1)
    plot(t,v(1,:),'g',t,v(2,:),'b')
    title(sprintf('drift velocity for electron 1 = %f', drift))
    ylabel('velocity')
    xlabel('time')
    subplot(3,1,2)
    plot(x(1,:),v(1,:),'g',x(2,:),v(2,:),'b')
    ylabel('velocity')
    xlabel('position')
    subplot(3,1,3)
    plot(t,x(1,:),'g',t,x(2,:),'b')
    ylabel('position')
    xlabel('time')
    
    drawnow
end



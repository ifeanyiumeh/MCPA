function MonteC(numE, timeStep)

%electron spec(adjust force and mass to adjust drift velocity)
force = 2E-31; %kg*m/s^2 
delT = 1E-6; %time change
T = 0;  %total time
mass  = 1.109E-31; %kg

%initial position and velocity are zero
x = zeros(1,numE);
v = zeros(1,numE);
driftv = zeros(1,numE);
acc = force/mass;

%initial plot
figure(1);
xplot = subplot(2,1,1);
plot(xplot, x, T);
xPlotTitle = title('Position vs. Time of Randomly Scattering Electron');
xXLabel = xlabel('Time (s)');
xYLabel = ylabel('Position (m)');

hold on;

vplot = subplot(2,1,2);
plot(v, T);
vPlotTitle = title('Velocity vs. Time of Randomly Scattering Electron');
vXLabel = xlabel('Time (s)');
vYLabel = ylabel('velocity (m/s)');

hold on;

%updating position and velocity using force
for i = 1:timeStep
    for j = 1:numE
        T = T + delT;
        
        x(j) = x(j) + v(j).* delT;
        v(j) = v(j) + acc.* delT;
        
         if(j == 1)
            plot(xplot, T, x(1), 'r.');
            hold on
            plot(vplot, T, v(1), 'g.');
            hold on
         
            title(['Velocity vs. Time of Randomly Scattering Electron, v =' num2str(mean(x(1)/T))]);
         end
            
             if (rand()<0.05)
                 v(j)=0;
             end

    end
    
    
    pause(0.01); %show scattering movie
end
    for i=1:numE
        driftv(i) = x(i)/T;
    end
    
    title(['Velocity vs. Time of Randomly Scattering Electron, v =' num2str(mean(driftv))]);
    
      
end
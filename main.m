function Soil_Condition = TEST
% TEST.m
% Real-time soil moisture monitoring and irrigation control using Arduino
% Reads voltage from A0, applies threshold classification,
% controls pump on D2, and plots live moisture trends.

% Initialize Arduino connection
a = arduino("COM5",'uno');

% Threshold states (in volts)
enough = 1.6;
alittlebitmore = 1.7;
dry = 1.9;

% Start live graph
figure(1)
h = animatedline;
ax = gca;
ax.YGrid = 'on';
ax.YLim = [-0.1 5];
ylabel('Voltage [volts]');
xlabel('Time [seconds]');
title('Voltage Moisture Sensor vs Time (Live)');
startTime = datetime('now');
stop = 0;

while ~stop
    
    % Read voltage from analog pin A0
    voltage = readVoltage(a,'A0');
    
    % Linear calibration transformation (y = mx + b)
    newy = (-0.666 * voltage) + 1.332;
    
    % Compute elapsed time
    t = datetime('now') - startTime;
    
    % Plot real-time data
    addpoints(h, datenum(t), newy)
    datetick('x','keeplimits')
    drawnow
    
    % Threshold-based control logic
    
    % Soil very dry — water more
    if (voltage >= dry)
        Soil_Condition = 'A LOT MORE';
        disp('A LOT MORE')
        writeDigitalPin(a,'D2',1);
        pause(2);
        writeDigitalPin(a,'D2',0);
    
    % Soil moderately dry — water slightly
    elseif (voltage <= alittlebitmore) && (voltage > enough)
        Soil_Condition = 'A LITTLE MORE';
        disp('A LITTLE MORE')
        writeDigitalPin(a,'D2',1);
        pause(2);
        writeDigitalPin(a,'D2',0);
    
    % Soil sufficiently moist — no watering
    elseif (voltage < enough)
        Soil_Condition = 'ENOUGH';
        disp('ENOUGH')
        writeDigitalPin(a,'D2',0);
        
        % Optional stop condition via digital pin D6
        stop = readDigitalPin(a,'D6');
    end
    
end
end

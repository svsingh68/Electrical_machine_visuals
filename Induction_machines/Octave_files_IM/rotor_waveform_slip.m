clc;clear;

theta = 0:pi*1e-2:2*pi;

cx = 0.1*cos(theta);
cy = 0.1*sin(theta);

sxo = 10*cos(theta);
syo = 10*sin(theta);

sxi = 8*cos(theta);
syi = 8*sin(theta);

sx1 = 0.8*cos(theta);
sy1 = 0.8*sin(theta)+9;

sx2 = 0.8*cos(theta);
sy2 = 0.8*sin(theta) - 9;

sx3 = 0.8*cos(theta) + 9*cosd(30);
sy3 = 0.8*sin(theta) + 9*sind(30);

sx4 = 0.8*cos(theta) - 9*cosd(30);
sy4 = 0.8*sin(theta) - 9*sind(30);

sx5 = 0.8*cos(theta) + 9*cosd(30);
sy5 = 0.8*sin(theta) - 9*sind(30);

sx6 = 0.8*cos(theta) - 9*cosd(30);
sy6 = 0.8*sin(theta) + 9*sind(30);


% ------------------
rxo = 7*cos(theta);
ryo = 7*sin(theta);

% ------------------
t = 0:2e-3:0.5;

% theta_r = linspace(0,(1-slip)*720,100);
% stator_rotation = 7200; %degrees

theta_s = linspace(0,7200,length(t));
% slip = linspace(1,0.05,length(t));
% slip = 1*exp(-5*t);
% slip = 1*ones(1,length(theta_s));

% slip = 1*(theta_s<=720) + 0.5*((theta_s>720)&(theta_s<720*2)) + ...
%     0.25*((theta_s>=720*2)&(theta_s<720*4)) + ...
%     0.05*((theta_s>=720*4)&(theta_s<720*6)) + ...
%     0*(theta_s>=720*6);
slip = 1*(t<=0.1) + 0.5*((t>0.1)&(t<0.2)) + ...
    0.25*((t>=0.2)&(t<0.3)) + ...
    0.05*((t>=0.3)&(t<=0.5));

% nslip = 0*slip;
% nslip(1) = slip(1);
% 
% Tc = 0.005;
% h = t(2) -t(1);
% for k = 1:1:(length(t)-1)
%     nslip(k+1) = nslip(k) + h/Tc*(slip(k)-nslip(k));
% end
% 
% slip = nslip;
% plot(slip)
% return
% t = 0:1e-3:(stator_rotation/360)*20e-3;
isa = 1*sin(2*pi*50*t);
isb = 1*sin(2*pi*50*t-2*pi/3);
isc = 1*sin(2*pi*50*t+2*pi/3);

for k = 1:1:length(t)

ira(k) = 0.3*slip(k)*exp(slip(k))*sin(2*pi*50*slip(k)*t(k));
irb(k) = 0.3*slip(k)*exp(slip(k))*sin(2*pi*50*slip(k)*t(k)-2*pi/3);
irc(k) = 0.3*slip(k)*exp(slip(k))*sin(2*pi*50*slip(k)*t(k)+2*pi/3);

% ira(k) = 0.3*exp(2*slip(k))*sin(2*pi*50*slip(k)*t(k));
% irb(k) = 0.3*exp(2*slip(k))*sin(2*pi*50*slip(k)*t(k)-2*pi/3);
% irc(k) = 0.3*exp(2*slip(k))*sin(2*pi*50*slip(k)*t(k)+2*pi/3);


theta_r = (1-slip(k))*theta_s(k);

rdel = -theta_r;
sdel = -theta_s(k);

rx1 = 0.6*cos(theta) + 6.4*cosd(rdel);
ry1 = 0.6*sin(theta) + 6.4*sind(rdel);

rx2 = 0.6*cos(theta) - 6.4*cosd(rdel);
ry2 = 0.6*sin(theta) - 6.4*sind(rdel);

rx3 = 0.6*cos(theta) + 6.4*cosd(rdel-60);
ry3 = 0.6*sin(theta) + 6.4*sind(rdel-60);

rx4 = 0.6*cos(theta) + 6.4*cosd(rdel+60);
ry4 = 0.6*sin(theta) + 6.4*sind(rdel+60);

rx5 = 0.6*cos(theta) - 6.4*cosd(rdel+60);
ry5 = 0.6*sin(theta) - 6.4*sind(rdel+60);

rx6 = 0.6*cos(theta) - 6.4*cosd(rdel-60);
ry6 = 0.6*sin(theta) - 6.4*sind(rdel-60);

% ----------------------------------
% ----------------------------------

rxarr = [-6.5*cosd(rdel) 6.5*cosd(rdel)];
ryarr = [-6.5*sind(rdel) 6.5*sind(rdel)];

sxarr = [-8.2*cosd(sdel) 8.2*cosd(sdel)];
syarr = [-8.2*sind(sdel) 8.2*sind(sdel)];

figure(1)
subplot(4,2,[1 3])
plot(cx,cy,'k','linewidth',2)
hold on



% stator frames
plot(sxo,syo,'k','linewidth',2)
plot(sxi,syi,'k','linewidth',2)
% patch(sxo, syo, 'black', 'FaceColor', 'black', 'FaceAlpha', 0.1);
% patch(rxo, ryo, 'black', 'FaceColor', 'red', 'FaceAlpha', 0.1);
% patch(sxi, syi, 'blue', 'FaceColor', 'white', 'FaceAlpha', 0.5);
% patch(sxo, syo, 'black', 'FaceColor', 'black', 'FaceAlpha', 0.1);
% stator winding slots
plot(sx1,sy1,'r','linewidth',2)
plot(sx2,sy2,'r','linewidth',2)
plot(sx3,sy3,'k','linewidth',2)
plot(sx4,sy4,'k','linewidth',2)
plot(sx5,sy5,'b','linewidth',2)
plot(sx6,sy6,'b','linewidth',2)

% rotor frame
plot(rxo,ryo,'k','linewidth',2)

% rotor winding slots
plot(rx1,ry1,'r','linewidth',2)
plot(rx2,ry2,'r','linewidth',2)
plot(rx3,ry3,'k','linewidth',2)
plot(rx4,ry4,'b','linewidth',2)
plot(rx5,ry5,'b','linewidth',2)
plot(rx6,ry6,'k','linewidth',2)
% arrow
plot(rxarr,ryarr,'-k','linewidth',3)
plot(sxarr,syarr,'-oc','linewidth',4)

axis equal
axis off
hold off

subplot(4,2,[5 6])

plot(t,isa,'r','linewidth',2,t,isb,'b','linewidth',2,t,isc,'k','linewidth',2);
grid on;
set(gca,'FontSize',14)
ylabel({'Stator', 'currents'})

subplot(4,2,[7 8])

plot(t(1:k),ira(1:k),'r','linewidth',2,...
     t(1:k),irb(1:k),'b','linewidth',2,...
     t(1:k),irc(1:k),'k','linewidth',2);
grid on;
ylim([-1 1])
xlim([min(t) max(t)]);
ylabel({'Rotor', 'currents'})
set(gca,'FontSize',14)


subplot(4,2,[2 4])
plot(t(1:k), slip(1:k),'k','linewidth',1)
hold on
% stem(t(k), slip(k),'oc','linewidth',2)
plot([0 t(k)], [slip(k) slip(k)],'-m','linewidth',2)
set(gca,'FontSize',14)
xlim([min(t) max(t)])
ylim([0 1.01])
title('slip')
grid on
hold off
drawnow


% pause(0.1)
saveas(gcf,'casea.png');

B = imread('casea.png');

imwrite(B,strcat('Case_file',num2str(k),'.png'));
end

% ----------------------------------


% subplot(3,1,2)
% 
% subplot(3,1,3)


clear all
close all
clc

%% Specify INPUTS 
file1='tycan_coarse/postProcessing/forces1/0/force.dat'
file2='tycan_medium/postProcessing/forces1/0/force.dat'
file3='tycan_fine/postProcessing/forces1/0/force.dat'
file4='tycan_better/postProcessing/forces1/0/force.dat'
%file='../postProcessing/forces/100/force.dat'

%force.dat file is a little more complex. Need to use some tricks to open
%it properly ...


%% Main Code 
fid = fopen(file1);          % open the file

for line=1:4                % first 4 lines are basic headlines
    line = fgetl(fid);      % do nothing with that data 
end

ind = 0;
while ~feof(fid)                % read until End Of File (EOF)
    line = fgetl(fid);
    newStr = split(line,' ')   % split the line by ' ' character
        ind = ind + 1;              % index update
        newStr = flip(newStr)
        time1(ind,1) = str2num(newStr{end});
        F_tot1(ind,1) = str2num(newStr{9});
        F_tot1(ind,2) = str2num(newStr{8});
        F_tot1(ind,3) = str2num(newStr{7});
end
fclose(fid)

fid = fopen(file2);          % open the file

for line=1:4                % first 4 lines are basic headlines
    line = fgetl(fid);      % do nothing with that data 
end

ind = 0;
while ~feof(fid)                % read until End Of File (EOF)
    line = fgetl(fid);
    newStr = split(line,' ')   % split the line by ' ' character
        ind = ind + 1;              % index update
        newStr = flip(newStr)
        time2(ind,1) = str2num(newStr{end});
        F_tot2(ind,1) = str2num(newStr{9});
        F_tot2(ind,2) = str2num(newStr{8});
        F_tot2(ind,3) = str2num(newStr{7});
end
fclose(fid)

fid = fopen(file3);          % open the file

for line=1:4                % first 4 lines are basic headlines
    line = fgetl(fid);      % do nothing with that data 
end

ind = 0;
while ~feof(fid)                % read until End Of File (EOF)
    line = fgetl(fid);
    newStr = split(line,' ')   % split the line by ' ' character
        ind = ind + 1;              % index update
        newStr = flip(newStr)
        time3(ind,1) = str2num(newStr{end});
        F_tot3(ind,1) = str2num(newStr{9});
        F_tot3(ind,2) = str2num(newStr{8});
        F_tot3(ind,3) = str2num(newStr{7});    
end
fclose(fid)

fid = fopen(file4);          % open the file

for line=1:4                % first 4 lines are basic headlines
    line = fgetl(fid);      % do nothing with that data 
end

ind = 0;
while ~feof(fid)                % read until End Of File (EOF)
    line = fgetl(fid);
    newStr = split(line,' ')   % split the line by ' ' character
        ind = ind + 1;              % index update
        newStr = flip(newStr)
        time4(ind,1) = str2num(newStr{end});
        F_tot4(ind,1) = str2num(newStr{9});
        F_tot4(ind,2) = str2num(newStr{8});
        F_tot4(ind,3) = str2num(newStr{7});
    end
fclose(fid)


%% Plot the Forces
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
figure
s = 10;     % set to 1 to use all data, set to N to ignore first N points
subplot(4,1,1)
plot(time1(s:end,1),F_tot1(s:end,1),'Color',[0.5,0.91,0.90],'LineWidth',1.1)
title('$\mathrm{Drag}, F_x$ for coarse mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('Force [N]','Interpreter','latex')
subplot(4,1,2)
plot(time2(s:end,1),F_tot2(s:end,1),'Color',[0.65,0.71,0.89],'LineWidth',1.1)
title('$\mathrm{Drag}, F_x$ for medium 1 mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('Force [N]','Interpreter','latex')
subplot(4,1,3)
plot(time3(s:end,1),F_tot3(s:end,1),'Color',[0.22,0.60,0.73],'LineWidth',1.1)
title('$\mathrm{Drag}, F_x$ for medium 2 mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('Force [N]','Interpreter','latex')
subplot(4,1,4)
plot(time4(s:end,1),F_tot4(s:end,1),'Color',[0,0.3,0.5],'LineWidth',1.1)
title('$\mathrm{Drag}, F_x$ for fine mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('Force [N] ','Interpreter','latex')
% subplot(2,1,2)
% plot(time(s:end,1),F_tot(s:end,2),'-g','LineWidth',1.1)
% title('$\mathrm{Lift}, F_y$ for 2nd','Interpreter','latex')
% xlabel('Iteration','Interpreter','latex')
% ylabel('Force [N]','Interpreter','latex')
%print(gcf,'exportDataPlot.png','-dpng','-r300');

%% Final results for STEADY CASE
% simply take the latest results 
% fprintf('Force vector is %f, %f \n',F_tot(end,1:2))
% F = F_tot(end,1:2)
% F_mag = sqrt(dot(F,F))
%% 
cd1 = (2*F_tot1)/(1.225*20*20*2.33)
cd2 = (2*F_tot2)/(1.225*20*20*2.33)
cd3 = (2*F_tot3)/(1.225*20*20*2.33)
cd4 = (2*F_tot4)/(1.225*20*20*2.33)
%% 
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
figure
s = 10;     % set to 1 to use all data, set to N to ignore first N points
subplot(4,1,1)
plot(time1(s:end,1),cd1(s:end,1),'Color',[0.5,0.91,0.90],'LineWidth',1.1)
title('$c_d$ for coarse mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('$c_d$ ','Interpreter','latex')
subplot(4,1,2)
plot(time2(s:end,1),cd2(s:end,1),'Color',[0.65,0.71,0.89],'LineWidth',1.1)
title('$c_d$ for medium 1 mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('$c_d$ ','Interpreter','latex')
subplot(4,1,3)
plot(time3(s:end,1),cd3(s:end,1),'Color',[0.22,0.60,0.73],'LineWidth',1.1)
title('$c_d$ for medium 2 mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('$c_d$ ','Interpreter','latex')
subplot(4,1,4)
plot(time4(s:end,1),cd4(s:end,1),'Color',[0,0.3,0.5],'LineWidth',1.1)
title('$c_d$ for fine mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('$c_d$  ','Interpreter','latex')
%% set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
figure
s = 10;     % set to 1 to use all data, set to N to ignore first N points
hold on 
plot(time1(s:end,1),cd1(s:end,1),'Color',[0.5,0.91,0.90],'LineWidth',1.1)
hold on
plot(time2(s:end,1),cd2(s:end,1),'Color',[0.65,0.71,0.89],'LineWidth',1.1)
hold on
plot(time3(s:end,1),cd3(s:end,1),'Color',[0.22,0.60,0.73],'LineWidth',1.1)
hold on
plot(time4(s:end,1),cd4(s:end,1),'Color',[0,0.3,0.5],'LineWidth',1.1)
title('$c_d$ for coarse mesh','Interpreter','latex')
xlabel('iteration','Interpreter','latex')
ylabel('Force [N]','Interpreter','latex')
legend('coarse mesh','medium 1 mesh','medium 2 mesh','fine mesh')

%% 
cd_avg1 = []
f1 = 1/20
m =floor(1000*f1/5)
N = floor(length(cd1)/m)
sum = 0 
count = 0
for i = 1:m
    for j = 1:N
        temp = cd1(i*j,1)
        sum = sum +temp
    end
    avg = sum/N
    cd_avg1(i) = avg
    sum = 0
end
timen1 = linspace(0,1000,m)
cd_avg2 = []
f2 = 1/20
m =floor(1000*f2/5)
N = floor(length(cd2)/m)
sum = 0 
count = 0
for i = 1:m
    for j = 1:N
        temp = cd2(i*j,1)
        sum = sum +temp
    end
    avg = sum/N
    cd_avg2(i) = avg
    sum = 0
end
timen2 = linspace(0,1000,m)
cd_avg3 = []
f3 = 1/20
m =floor(1000*f3/5)
N = floor(length(cd3)/m)
sum = 0 
count = 0
for i = 1:m
    for j = 1:N
        temp = cd3(i*j,1)
        sum = sum +temp
    end
    avg = sum/N
    cd_avg3(i) = avg
    sum = 0
end
timen3 = linspace(0,1000,m)
cd_avg4 = []
f4 = 1/20
m =floor(1000*f4/5)
N = floor(length(cd4)/m)
sum = 0 
count = 0
for i = 1:m
    for j = 1:N
        temp = cd4(i*j,1)
        sum = sum +temp
    end
    avg = sum/N
    cd_avg4(i) = avg
    sum = 0
end
timen4 = linspace(0,1000,m)
figure(4)
plot(timen1,cd_avg1,'Color',[0.5,0.91,0.90],'LineWidth',1.5)
hold on
plot(timen2,cd_avg2,'Color',[0.65,0.71,0.89],'LineWidth',1.5)
hold on 
plot(timen3,cd_avg3,'Color',[0.22,0.60,0.73],'LineWidth',1.5)
hold on 
plot(timen4,cd_avg4,'Color',[0,0.3,0.5],'LineWidth',1.5)
title('$\bar{c_d}$ for different mesh','Interpreter','latex')
xlabel('iteration ')
ylabel('$\bar{c_d}$','Interpreter','latex')
legend('coarse mesh','medium 1 mesh','medium 2 mesh','fine mesh')
    



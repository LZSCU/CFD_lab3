clear all
close all
clc

%% Specify INPUTS
file='tycan_better/log.log'


%% Main Code

fid = fopen(file);          % open the file
T = [];                     % initialized time
P=[]; U=[]; V=[]; W=[];     % initialized residual array
nut = [];                   % initialized Turb field


p_cnt = 0; U_cnt=0; nut_cnt=0;
stop=0;
while stop==0;                       % simple check for End of File
    line = fgetl(fid);
    % counter for the time step section (determine how many p U iters.
    if length(line) > 6;
        if line(1:6) == 'Time ='
            while stop==0;
                line2 = fgetl(fid);
                k = strfind(line2,'Solving for p');
                if length(k) > 0;
                    p_cnt = p_cnt + 1;
                end
                k = strfind(line2,'Solving for Ux');
                if length(k) > 0;
                    U_cnt = U_cnt + 1;
                end
                k = strfind(line2,'Solving for k');
                if length(k) > 0;
                    nut_cnt = nut_cnt + 1;
                end
                
                if length(line2) > 6;
                    if line2(1:6) == 'Time ='
                        stop = 1;
                    end
                end
                
            end
            
        end
    end
end
frewind(fid);                           % rewind back to the start



while ~feof(fid)                        % simple check for End of File
    line = fgetl(fid);
    
    % Pressure
    k = strfind(line,'Solving for p');
    if length(k) > 0;
        %fprintf('%s \n',line);              % uncomment to debug
        newStr = split(line,',');           % Split with ","
        keyCell = newStr{2};                % Focus on initial residual
        newStr = split(keyCell,' ');        % Split with " "
        P = [P str2double(newStr{end})];    % Append to master array
    end
    
    % Ux Velocity
    k = strfind(line,'Solving for Ux');
    if length(k) > 0;
        %fprintf('%s \n',line);              % uncomment to debug
        newStr = split(line,',');           % Split with ","
        keyCell = newStr{2};                % Focus on initial residual
        newStr = split(keyCell,' ');        % Split with " "
        U = [U str2double(newStr{end})];    % Append to master array
    end
    
    % Uy Velocity
    k = strfind(line,'Solving for Uy');
    if length(k) > 0;
        %fprintf('%s \n',line);              % uncomment to debug
        newStr = split(line,',');           % Split with ","
        keyCell = newStr{2};                % Focus on initial residual
        newStr = split(keyCell,' ');        % Split with " "
        V = [V str2double(newStr{end})];    % Append to master array
    end
    
    % Uz Velocity
    k = strfind(line,'Solving for Uz');
    if length(k) > 0;
        %fprintf('%s \n',line);              % uncomment to debug
        newStr = split(line,',');           % Split with ","
        keyCell = newStr{2};                % Focus on initial residual
        newStr = split(keyCell,' ');        % Split with " "
        W = [W str2double(newStr{end})];    % Append to master array
    end
    
    % nuTilda
    k = strfind(line,'Solving for k');
    if length(k) > 0;
        %fprintf('%s \n',line);              % uncomment to debug
        newStr = split(line,',');           % Split with ","
        keyCell = newStr{2};                % Focus on initial residual
        newStr = split(keyCell,' ');        % Split with " "
        nut = [nut str2double(newStr{end})];    % Append to master array
    end
    
end
fclose(fid); %close the file

%% Plot the residuals
figure
semilogy(linspace(0,length(P)/p_cnt,length(P)),P,'Color',[0.5,0.5,0.5])
hold on
semilogy(linspace(0,length(U)/U_cnt,length(U)),U,'-r',LineWidth=1)
semilogy(linspace(0,length(U)/U_cnt,length(U)),V,'-g',LineWidth=1)
semilogy(linspace(0,length(U)/U_cnt,length(U)),W,'Color',[0.3,0.7,0.8],LineWidth=1)
semilogy(linspace(0,length(nut)/nut_cnt,length(nut)),nut,'--b',LineWidth=1)
hold off
title('Residual Plot')
xlabel('Iteration')
ylabel('Residual')
legend('p','u','v','w','$k$','Interpreter','latex')





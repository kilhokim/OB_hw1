function y = MEMORY_CONSTRUCTION()
%tic
h = waitbar(0, 'Constructing memory. Please wait...');
num_iteration = 100000; % 10만개
links = xlsread('link.xlsx');
links_length = length(links);

num_registered_posture = 0;
num_two_leg_posture = 0;
num_posture_maxtrix = zeros(22, 24);
torque = 0;

for i=-60:10:150
    for j=0:10:230
        cell_name = ['CELL_X' num2str(i) 'Y' num2str(j)];
        cell_name = strrep(cell_name, '-', 'N');
        eval([cell_name ' = load(' ''''  fullfile('CELL', cell_name)  '''' ');']);
    end;
end;

while num_registered_posture <= num_iteration
    random_index = randi([1, links_length]);
    link = links(random_index, :);
    L = link(1:6)/10;
    user_id = link(7);
    W = link(8:12)/(10*2); % 지름/2
    
    P = RANDOM_POSTURE;
    COM_LOC = COM_LOCATION(L,P);
    HAND_LOC = HAND_LOCATION(L,P);
    SHOULDER_LOC = SHOULDER_LOCATION(L,P);
    H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);
    
    while ((COM_LOC(1)>15) || (COM_LOC(1)<-5) || (HAND_LOC(1)<5) || (H_S_DIST < 20) || (HAND_LOC(2)<=0) || (HAND_LOC(1)>140))
        
        if((COM_LOC(1)>=-5) & (HAND_LOC(1)>=5) & (H_S_DIST>=20) & (HAND_LOC(2)>0) & (HAND_LOC(1)<=140) & ((num_two_leg_posture/num_registered_posture)<0.2)) % 앞다리 생성 조건
            
            P = ONE_MORE_LEG(L,P); % 앞다리 만들기
            COM_LOC = COM_LOCATION(L,P); % 다리 두 개일 때 COM 계산
            
            if ((P(6)~=0) & (P(7)~=0) & (COM_LOC(1)<=COM_LOC(3)+15) & (COM_LOC(1)>=-5))
                num_two_leg_posture = num_two_leg_posture + 1;
                break;
            else
                P = RANDOM_POSTURE;
                COM_LOC = COM_LOCATION(L,P);
                HAND_LOC = HAND_LOCATION(L,P);
                SHOULDER_LOC = SHOULDER_LOCATION(L,P);
                H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);
            end
            
        else
            P = RANDOM_POSTURE;
            COM_LOC = COM_LOCATION(L,P);
            HAND_LOC = HAND_LOCATION(L,P);
            SHOULDER_LOC = SHOULDER_LOCATION(L,P);
            H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);
        end
        
    end;  
    
    XX = num2str(floor(HAND_LOC(1)/10)*10);
    YY = num2str(floor(HAND_LOC(2)/10)*10);
    
    cell_name = ['CELL_X' XX 'Y' YY];
    cell_name = strrep(cell_name, '-', 'N');
    
    eval([cell_name ' = [' cell_name ' ; ' num2str(P) ' ' num2str(HAND_LOC) ' ' num2str(L) ' ' num2str(W) ' ' num2str(user_id) ' ' num2str(sum(abs(JOINT_TORQUE(L,P)))) ' ];']);
    num_registered_posture = num_registered_posture + 1;
    
    if mod(num_registered_posture, 100)==0;
        waitbar(num_registered_posture/num_iteration)
    end
    
    XX2 = floor(HAND_LOC(1)/10)+7;
    YY2 = floor(HAND_LOC(2)/10)+1;
    num_posture_maxtrix(XX2, YY2) =  num_posture_maxtrix(XX2, YY2)+1;
    
end

for i=-60:10:150
    for j=0:10:230
        
        cell_name = ['CELL_X' num2str(i) 'Y' num2str(j)];
        cell_name = strrep(cell_name, '-', 'N');
        cell_path = fullfile('CELL', cell_name);
        haha = fopen(cell_path,'w');
        eval(['a = ' cell_name ';']);
        temp_length = size(a);
        
        for k=1:temp_length(1)
            fprintf(haha, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n', a(k,1), a(k,2), a(k,3), a(k,4), a(k,5), a(k,6), a(k,7), a(k, 8), a(k, 9), a(k, 10), a(k, 11), a(k, 12), a(k, 13), a(k, 14), a(k, 15), a(k, 16), a(k, 17), a(k, 18), a(k, 19), a(k, 20), a(k, 21), a(k, 22));
        end
        
        fclose(haha);
        
    end;
end;

%toc
% cell당 등록된 posture 갯수를 담은 matrix를 엑셀로 저장
xlswrite('cell_posture.xlsx', num_posture_maxtrix);

% % cell당 등록된 posture간의 거리 평균 및 표준편차 matrix를 엑셀에 저장
CELL_POSTURE_ANALYSIS();

close(h);




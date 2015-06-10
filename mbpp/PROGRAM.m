%close all;
clear all;

num_of_target_touch = 0;
% ��ü ���� ��������
p1_L = 45; p1_U = 90; p2_L = 0; p2_U = 160; p3_L = -160; p3_U = 0; p4_L = -180; p4_U = -20; p5_L = 30; p5_U = 180; 

%% ��� ����
% ��� 1 ->
% input = ���� ���� id, output = torque�� ���� ���� �ڼ�
% ��� 2 ->
% input = �ټ��� ���� id, output = ����� torque�� ���� �ڼ�
mode = input('mode(1(single), 2(multiple) = ');

user_id = [];
if mode == 1
    temp_id = input('one user_id(1~5195) = ');
    user_id = [user_id; temp_id];    
elseif mode == 2
    while 1
        temp_id = input('one user_id(1~5195), �׸��Է��Ͻ÷��� -1 �Է� = ');
        if temp_id == -1
           break; 
        end
        user_id = [user_id; temp_id];    
    end
end


%% ��ֹ� ����    >>>>> Ŭ���� ���� �ٲ����
boundary = input('boundary [1 : 6] = ');
switch boundary
    case 1 %'a'
        B = [];
    case 2 %'b'
        B = [20 0 70 90];
    case 3 %'c'
        B = [20 0 20 100; 20 140 20 50];
    case 4 %'d'
        B = [20 0 70 90; 20 100 70 90];
    case 5 %'e'
        B = [0 90 30 10; 40 0 30 80; 40 110 30 80];
    case 6 %'f'
        B = [-60 100 160 90; 50 0 50 70];
    case 7 %'f'
        B = [40 110 10 10];
end

C = [];


%% Target ���� >> Ŭ���� ���� �ٲ����
X_tar = 50;
Y_tar = 90;
T = [X_tar Y_tar];
T_center = [X_tar+5 Y_tar+5];

%% Target Load ����  >> ���� �ʿ�
load_tar = 0;


%% Loading the relevant cell
XX = num2str(floor(X_tar/10)*10);
YY = num2str(floor(Y_tar/10)*10);

cell_name = ['CELL_X' XX 'Y' YY];
cell_name = strrep(cell_name, '-', 'N');

postures = load(cell_name);
temp = size(postures);
numP = temp(1);

% postures�� torque ������������ ����
[A_sorted sorted_index] = sort(postures, 1);
for i=1:21
    A_sorted(:,i) = postures(sorted_index(:,22), i);
end
postures = A_sorted;


% Draw World
figure (boundary);

% Draw obstacle and target
axis([-60 140 0 190]);

set(gca, 'Xtick', -60:10:160);
set(gca, 'Ytick', 0:10:190);

grid on;
hold on;
axis square;

% Draw Target
TPLOT(T);

% Draw Obstacle Configuration
BPLOT(B,1);

% ���� ��� ����
adjustment_methods = [2 3 4 5];

% �޸� ������ ��
links = xlsread('link.xlsx');
links_length = length(links);


%% ���౸��
for user=user_id
    test_data = links(user_id, :);
    test_L = test_data(1:6)/10;
    test_R = test_data(8:12)/20;       
    
    result_postures = [];
    
    num_of_target_touch = 0;
    start_time = clock;
    
    is_over = -1;
    for i=1:numP
        if is_over == 0
            break;
        end
        
        %% �˻� �ܰ�
        training_posture = postures(i,1:7); % theta 6,7 �߰�
        training_w = postures(i, 16:20);
        training_length = postures(i, 10:15);
        
        % potential ����(�˻� �� ��Ź��� ������ �������� ����)
        potential = POTENTIAL2(training_length, training_posture, B, C, training_w);
        if potential ~= 0
            continue;
        end
        
        %% ���� �ܰ�(����)
        for adjustment_method = adjustment_methods
            result_posture = [postures(i, :) test_L zeros(1,13)];
            result_posture(29) = adjustment_method;
            
            switch adjustment_method
                case 2
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 2);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
                case 3
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 3);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
                case 4
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 4);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
                case 5
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 5);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
            end
            %% ���� �ܰ�(���� ���� �ľ�; ��ֹ� ����, BOS ����, ���� ����)
            
            % �� ���� ����
            neck = NECK(test_L, posture, T_center);
            if neck == -1000
                result_posture(30) = 0;
                result_postures = [result_postures; result_posture];
                continue
            else
                posture(8) = neck;
            end
            
            % ��ֹ��� ����� �ľ�
            potential = POTENTIAL2(test_L, posture, B, C, test_R);
            if (potential == 0)
                result_posture(30) = 1;
            else
                result_posture(30) = 0;
                result_postures = [result_postures; result_posture];
                continue
            end
            
            % BOS ����
            COM_LOC = COM_LOCATION(test_L,posture);
            HAND_LOC = HAND_LOCATION(test_L,posture);
            SHOULDER_LOC = SHOULDER_LOCATION(test_L,posture);
            H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);
            
            
            % �ٸ� �߰��Ǿ��� �� BOS��� �߰�
            if posture(6) ~=0 && posture(7) ~=0
                if COM_LOC(3) == 0 || (COM_LOC(1) > COM_LOC(3)+15) || (COM_LOC(1) < -5) || (H_S_DIST < 20) || (HAND_LOC(2)<=0)
                    result_posture(30) = 0;
                    result_postures = [result_postures; result_posture];
                else
                    result_posture(30) = 1;
                end
                
            else
                if ((COM_LOC(1)>15) || (COM_LOC(1)<-5) || (HAND_LOC(1)<5) || (H_S_DIST < 20) || (HAND_LOC(2)<=0))
                    result_posture(30) = 0;
                    result_postures = [result_postures; result_posture];
                    continue
                else
                    result_posture(30) = 1;
                end
            end
            
            % ���� ����
            if (posture(1)>p1_L && posture(1)<p1_U && posture(2)>p2_L && posture(2)<p2_U && posture(3)>p3_L && posture(3)<p3_U && posture(4)>p4_L && posture(4)<p4_U && posture(5)>p5_L && posture(5)<p5_U)
                result_posture(30) = 1;
            else
                result_posture(30) = 0;
                result_postures = [result_postures; result_posture];
                continue
            end
            result_posture(31:38) = posture;
            
            
            %% ���� ���� �߰� (39)
            reba_score = REBA(test_L, posture, Y_tar, load_tar);
            result_posture(39) = reba_score;
            
            %% ��ũ ���� (40)
            torq = sum(abs(JOINT_TORQUE(test_L,posture)));
            result_posture(40) = torq;
            
            %% visibility �߰� (41)
            vs_pt = VISIBILITY(test_L, posture, test_R, B, T_center, C);
            if vs_pt > 0
                visibility = 0
            elseif vs_pt == 0
                visibility = 1
            end
            result_posture(41) = visibility;
                        
            result_postures = [result_postures; result_posture]; 
            
            VISUALIZE(1, test_L, posture, test_R);

            num_of_target_touch = num_of_target_touch+1;
            
            is_over = 0;
            break;
            
        end
        
    end
    
    execution_time = etime(clock, start_time);
    title_str=[num2str(num_of_target_touch), ' postures, ', num2str(execution_time), ' s'];
    title(title_str);
    
    % exel�� ����
    %     filename = ['result_stature_', num2str(user_id), '_boundary_', num2str(boundary)];
    %     xlswrite(filename, result_postures);
end
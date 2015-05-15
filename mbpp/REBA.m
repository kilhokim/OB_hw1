function r = REBA( L, P, Y_tar, load_tar )
% Calculate REBA score for given posture

    % Knee angle
    t2 = 180 - P(2);
    % Waist angle
    t3 = -P(3);
    % Upper arm angle
    t4 = 180 + P(4);
    % Lower arm angle
    t5 = P(5);
    
    s = LOCATE_WOVOL(L, P);
    num_s = 41;
    eye_x = s(num_s+7, 1);
    eye_y = s(num_s+7, 2);
    % Neck angle - calculated with eye location
    t6 = asin(abs(eye_y - Y_tar));
    REBA_A = 0;
    REBA_load = 0;
    REBA_B = 0;
    
    REBA_TABLE = [1 1 1 2 3 3 4 5 6 7 7 7;
                  1 2 2 3 4 4 5 6 6 7 7 8;
                  2 3 3 3 4 5 6 7 7 8 8 8;
                  3 4 4 4 5 6 7 8 8 9 9 9;
                  4 4 4 5 6 7 8 8 9 9 9 9;
                  6 6 6 7 8 8 9 9 10 10 10 10;
                  7 7 7 8 9 9 9 10 10 11 11 11;
                  8 8 8 9 10 10 10 10 10 11 11 11;
                  9 9 9 10 10 10 11 11 11 12 12 12;
                  10 10 10 11 11 11 11 12 12 12 12 12;
                  11 11 11 11 12 12 12 12 12 12 12 12;
                  12 12 12 12 12 12 12 12 12 12 12 12];
    
    
    %% Calculate REBA_A
    % Neck +1:
    if t6 >= 0 && t6 < 20
        % Waist +1:
        if t3 == 0
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 1;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 2;
            % Knee +3:        
            else
                REBA_A = REBA_A + 3;
            end
        % Waist +2:
        elseif t3 > 0 && t3 < 20
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 2;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 3;
            % Knee +3:        
            else
                REBA_A = REBA_A + 4;
            end
        % Waist +3:
        elseif t3 >= 20 && t3 < 60
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 2;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 4;
            % Knee +3:        
            else
                REBA_A = REBA_A + 5;
            end
        % Waist +4:
        else % t3 >= 60
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 3;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 5;
            % Knee +3:        
            else
                REBA_A = REBA_A + 6;
            end
        end
    % Neck +2:
    else % else
        % Waist +1:
        if t3 == 0
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 1;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 2;
            % Knee +3:        
            else
                REBA_A = REBA_A + 3;
            end
        % Waist +2:
        elseif t3 > 0 && t3 < 20
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 3;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 4;
            % Knee +3:        
            else
                REBA_A = REBA_A + 5;
            end
        % Waist +3:
        elseif t3 >= 20 && t3 < 60
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 4;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 5;
            % Knee +3:        
            else
                REBA_A = REBA_A + 6;
            end
        % Waist +4:
        else % t3 >= 60
            % Knee +1:
            if t2 < 30
                REBA_A = REBA_A + 5;
            % Knee +2:
            elseif t2 >= 30 && t2 < 60
                REBA_A = REBA_A + 6;
            % Knee +3:        
            else
                REBA_A = REBA_A + 7;
            end
        end
    end
    
    % Calculate REBA_load
    % Load weight +0:
    if load_tar < 5
        REBA_load = REBA_load + 0;
    % Load weight +1:
    elseif load_tar >= 5 && load_tar < 10
        REBA_load = REBA_load + 1;
    % Load weight +2:
    else % load_tar >= 10
        REBA_load = REBA_load + 2;
    end
    
    % Calculate final REBA_A:
    REBA_A = REBA_A + REBA_load;
    
    
    %% Calculate REBA_B
    % Lower arm +1:
    if t5 > 60 && t5 < 100
        % Upper arm +1:
        if t4 > -20 && t4 < 20
            REBA_B = REBA_B + 1;
        % Upper arm +2:
        elseif t4 >= 20 && t4 < 45
            REBA_B = REBA_B + 1;
        % Upper arm +3:
        elseif t4 >= 45 && t4 < 90
            REBA_B = REBA_B + 3;
        % Upper arm +4:
        else % t4 >= 90
            REBA_B = REBA_B + 4;
        end
    % Lower arm +2:
    else % t5 <= 60
        % Upper arm +1:
        if t4 > -20 && t4 < 20
            REBA_B = REBA_B + 1;
        % Upper arm +2:
        elseif t4 >= 20 && t4 < 45
            REBA_B = REBA_B + 2;
        % Upper arm +3:
        elseif t4 >= 45 && t4 < 90
            REBA_B = REBA_B + 4;
        % Upper arm +4:
        else % t4 >= 90
            REBA_B = REBA_B + 5;
        end
    end
    
    r = REBA_TABLE(REBA_A, REBA_B);

end

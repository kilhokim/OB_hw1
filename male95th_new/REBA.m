function r = REBA( P, load_tar )
% Calculate REBA score for the input posture
    
    t2 = 180 - P(2);
    t3 = P(3);
    REBA_A = 0;
    
    % TODO: Add conditions for neck posture
    if t2 < 30
        if t3 == 0
            %REBA_A = 
        elseif t3 > 0 && t3 < 20
        elseif t3 >= 20 && t3 < 60
        else
        end
    elseif t2 >= 30 && t2 < 60
            
    else
            
    end

end

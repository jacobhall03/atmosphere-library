function localtemp = alt2tempGRAD(metalt, metalt_1, lapse_rate, temp_1)
%ALT2TEMPGRAD Calculates temperature using altitude and lapse rate
    arguments
        metalt (1, :) double {mustBeFinite}
        metalt_1 (1, 1) double {mustBeFinite}
        lapse_rate (1, 1) double {mustBeFinite}
        temp_1 (1, 1) double {mustBeFinite}
    end
    potaltdiff = met2pot(metalt) - met2pot(metalt_1);
    localtemp = temp_1 + lapse_rate .* potaltdiff;
end
function localtemp = alt2tempTOUS(metalt)
%ALT2TEMPTOUS Calculates local temperature using Toussaint's temperature approximation formula
%This formula is a very accurate approximation for temperature up to ~11 km
    arguments
        metalt (1, :) double {mustBeFinite}
    end
    localtemp = 273.15 + (15 - (0.0065 .* metalt));
end
function geopotalt = met2pot(geometalt, r_0)
% MET2POT converts geometric altitude to geopotential altitude
% optional parameter is radius of the planet, default is Earth's
    arguments
        geometalt (1, :) double {mustBeFinite}
        r_0 (1, 1) double {mustBeFinite} = ConstantsSI.radiusE
    end
    geopotalt = (r_0 ./ (r_0 + geometalt)) .* geometalt;
end
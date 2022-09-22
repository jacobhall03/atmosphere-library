function geometalt = pot2met(geopotalt, r_0)
% POT2MET converts geopotential altitude to geometric altitude
% optional parameter is radius of the planet, default is Earth's
    arguments
        geopotalt (1, :) double {mustBeFinite}
        r_0 (1, 1) double {mustBeFinite} = ConstantsSI.radiusE
    end
    geometalt = (r_0 .* geopotalt) ./ (r_0 - geopotalt);
end
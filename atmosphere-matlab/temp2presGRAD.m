function localpres = temp2presGRAD(temp, temp_1, pres_1, temp_grad, g_0, Rgas)
%TEMP2PRESGRAD Calculates local air pressure in gradient atmosphere
%regions using local temperature
    arguments
        temp (1, :) double {mustBeFinite}
        temp_1 (1, 1) double {mustBeFinite, mustBePositive}
        pres_1 (1, 1) double {mustBeFinite}
        temp_grad (1, 1) double {mustBeFinite}
        g_0 (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.gE0
        Rgas (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.Rair
    end
    localpres = pres_1 .* (temp ./ temp_1).^(-g_0 / (temp_grad * Rgas));
end
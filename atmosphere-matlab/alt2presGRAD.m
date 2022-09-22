function localpres = alt2presGRAD(metalt, metalt_1, pres_1, temp_1, temp_grad, g_0, Rgas)
%ALT2PRESGRAD Calculates local air pressure in gradient atmosphere
%regions using geometric altitude
    arguments
        metalt (1, :) double {mustBeFinite}
        metalt_1 (1, 1) double {mustBeFinite}
        pres_1 (1, 1) double {mustBeFinite}
        temp_1 (1, 1) double {mustBeFinite, mustBePositive}
        temp_grad (1, 1) double {mustBeFinite}
        g_0 (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.gE0
        Rgas (1, 1) double {mustBeFinite, mustBePositive} = ConstantsSI.Rair
    end
    temp = alt2tempGRAD(metalt, metalt_1, temp_grad, temp_1);
    localpres = temp2presGRAD(temp, temp_1, pres_1, temp_grad, g_0, Rgas);
end
classdef StandardAtmospheres
    properties (Constant)
        %https://en.wikipedia.org/wiki/International_Standard_Atmosphere
        ISA1976 = AtmosModel("International Standard Atmosphere 1976", ...
            [AtmosLayer(-610, -6.5e-3, 292.15, 108900, 1.2985), ...
            AtmosLayer(11000, 0.0, 216.65, 22632, 0.3639), ...
            AtmosLayer(20000, 1.0e-3, 216.65, 5474.9, 0.0880), ...
            AtmosLayer(32000, 2.8e-3, 228.65, 868.02, 0.0132), ...
            AtmosLayer(47000, 0.0, 270.65, 110.91, 0.0020), ...
            AtmosLayer(51000, -2.8e-3, 270.65, 66.939, 0.0), ...
            AtmosLayer(71000, -2.0e-3, 214.65, 3.9564, 0.0), ...
            AtmosLayer(84852, 0.0, 186.95, 0.3734, 0.0), ...
            AtmosLayer(90000, 4.0e-3, 186.95, 0.0, 0.0)], ...
            ConstantsSI.radiusE, ConstantsSI.gE0, ConstantsSI.Rair)

        %https://en.wikipedia.org/wiki/U.S._Standard_Atmosphere
        US1976 = AtmosModel("U.S. Standard Atmosphere 1976", ...
            [AtmosLayer(0, -6.5e-3, 288.15, 101325, 1.225), ...
            AtmosLayer(11000, 0.0, 216.65, 22632.1, 0.3639), ...
            AtmosLayer(20000, 1.0e-3, 216.65, 5474.89, 0.0880), ...
            AtmosLayer(32000, 2.8e-3, 228.65, 868.019, 0.0132), ...
            AtmosLayer(47000, 0.0, 270.65, 110.91, 0.0020), ...
            AtmosLayer(51000, -2.8e-3, 270.65, 66.939, 0.0), ...
            AtmosLayer(71000, -2.0e-3, 214.65, 3.9564, 0.0), ...
            AtmosLayer(84852, 0.0, 187.15, 0.3734, 0.0)], ...
            ConstantsSI.radiusE, ConstantsSI.gE0, ConstantsSI.Rair)
    end
end
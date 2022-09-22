classdef ConstantsSI
    properties (Constant)
        radiusE = 6378.137e3 % approx Earth Radius, mean sea level at equator (m)
        gE0 = 9.80665 % Earth Gravitational acceleration at sea level (m/s^2)
        Rair = 287.052874 % Specific Gas constant for air
        airpresE0 = 1.01325e5 % Air pressure at Earth's sea level (N/m^2)
        airdensE0 = 1.225 % Air density at Earth's sea level (kg/m^3)
        tempE0 = 288.15 % Air Temperature at Earth's sea level (Kelvin)
    end
end

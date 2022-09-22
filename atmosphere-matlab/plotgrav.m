function plotgrav(metaltvals, yplotlims)
% PLOTGRAV plots the gravational acceleration as a function of geometric
% altitude
    arguments
        metaltvals (1, :) double {mustBeFinite}
        yplotlims (1, 2) double {mustBeFinite} = [0.0 10.0]
    end
    import ConstantsSI.*
    glocal = alt2grav(metaltvals);
    altskm = metaltvals ./ 1000;
    plot(altskm, glocal)
    hold on
    plot(altskm, ConstantsSI.gE0 * ones(size(altskm)))
    title("Gravitational Acceleration vs. Altitude")
    xlabel("Geometric Altitude (km)")
    ylabel("Gravitational Acceleration (m/s^2)")
    ylim(yplotlims)
    legend("Local", "Sea Level")
    grid()
    hold off
end
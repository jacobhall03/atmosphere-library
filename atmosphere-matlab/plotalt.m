function plotalt(metaltvals, yplotlim, r_0)
    arguments
        metaltvals (1, :) double {mustBeFinite}
        yplotlim (1, 2) double {mustBeFinite} = [(metaltvals(1) / 1000) (metaltvals(end) / 1000)]
        r_0 (1, 1) double {mustBeFinite} = ConstantsSI.radiusE
    end
    metalt_km = metaltvals ./ 1000;
    potalt_km = met2pot(metaltvals, r_0) ./ 1000;
    plot(metalt_km, metalt_km)
    hold on
    plot(metalt_km, potalt_km)
    title("Geometric/potential Altitude vs. geometric Altitude")
    ylim(yplotlim)
    xlabel("Geometric Altitude (km)")
    ylabel("Altitude (km)")
    legend("Geometric", "Geopotential")
    hold off
end
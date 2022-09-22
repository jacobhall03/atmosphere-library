#include <math.h>
#include <stdlib.h>

float *fastalt2state(float alt){
    // Calculates gas state variables using partial US Standard Atmosphere to 20 km
    // INPUT: (Geopotential) Altitude (m)
    // OUTPUT: [Temperature (K), Pressure (N/m^2), Density (kg/m^3)]

    float temp;
    float pres;
    float dens;
    if (alt < 11000){
        temp = 288.15 - 6.5E-3 * alt;
        pres =  101325 * pow(temp / 288.15, 3418366.214);
    }
    else{
        temp = 216.65;
        pres = 22632.1 * exp(-102.5588756 * (alt - 11000));
    }

    dens = pres / (287.052874 * temp);
    float *state = (float *) memcpy(malloc(sizeof(float) * 3), (float[3]) {temp, pres, dens}, sizeof(float) * 3);
    return state;
}
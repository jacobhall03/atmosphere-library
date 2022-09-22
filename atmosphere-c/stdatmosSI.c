#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// US Standard Atmosphere 1976
// Correct to 86 km. Only approximate thereafter. 

//CONSTANTS
float REARTH = 6378.137E3;  //Radius of Earth at Mean Sea Level (m)
float RAIR = 287.052874;    //Specific Gas Constant for Air up to ~85 km
float G0 = 9.80665;         //Gravitational Acceleration at Mean Sea Level (m/s^2)
float MU1 = 3418366.214; // -G0 / (lrate_1 * R_air)
float MU2 = -102.5588756; // -G0 / (R_air * temp_2)

// LAYER ARRAYS
int layerlen = 8; // Length of Arrays
float layeralt[] = {0.0, 11000.0, 20000.0, 32000.0, 47000.0, 51000.0, 71000.0, 84.852}; //Base Geopotential Altitudes (m)
float layertemp[] = {288.15, 216.65, 216.65, 228.65, 270.65, 270.65, 214.65, 187.15}; //Base Temperature (K)
float layerrate[] = {-6.5E-3, 0.0, 1.0E-3, 2.8E-3, 0.0, -2.8E-3, -2.0E-3, 0.0}; //Base Lapse Rate (K/m)
float layerpres[] = {101325, 22632.1, 5474.89, 868.019, 110.91, 66.939, 3.9564, 0.3734}; //Base Pressure (N/m^2)

//FUNCTIONS
float met2pot(float metalt){
    float potalt = (REARTH / (REARTH + metalt)) * metalt;
    return potalt;
}

float state2dens(float temp, float pres){
    // Calculates density using equation of state for a perfect gas
    // INPUT: Temperature (K), Pressure (N/m^2)
    // OUTPUT: Density (kg/m^3)
    float dens = pres / (RAIR * temp);
    return dens;
}

float alt2layer(float potalt){
    // Performs Binary Search for corresponding Atmosphere Layer
    // INPUT: Geopotential Altitude (m)
    // OUTPUT: Layer Array Index

    int i = 0;
    int j = layerlen;
    while (j > i+1){
        int k = (i + j) / 2;
        if (potalt < layeralt[k]){
            j = k;
        }
        else{
            i = k;
        }
    }
    return i;
}

float *alt2state(float metalt){
    // Calculates gas state variables using complete US Standard Atmosphere
    // INPUT: Geometric Altitude (m)
    // OUTPUT: [Temperature (K), Pressure (N/m^2), Density (kg/m^3)]

    float potalt = met2pot(metalt);
    int i = alt2layer(potalt);
    int altdiff = potalt - layeralt[i];
    float alpha = layerrate[i];
    float temp_1 = layertemp[i];
    float pres_1 = layerpres[i];

    float temp = temp_1 + alpha * (altdiff);
    float pres;
    float dens;

    if (-layerrate[i] < 1E-5){
        pres = pres_1 * exp(-(G0 / (RAIR * temp)) * altdiff); 
    }else{
        pres = pres_1 * pow(temp / temp_1, -G0 / (alpha * RAIR));
    }
    
    dens = state2dens(temp, pres);

    float *state = memcpy(malloc(sizeof(float) * 3), (float[3]) {temp, pres, dens}, sizeof(float) * 3);
    return state;
}
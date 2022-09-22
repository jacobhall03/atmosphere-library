#ifndef __STDATMOS_H
#define __STDATMOS_H

//CONSTANTS
float REARTH = 6378.137E3;  //Radius of Earth at Mean Sea Level (m)
float RAIR = 287.052874;    //Specific Gas Constant for Air up to ~85 km
float G0 = 9.80665;         //Gravitational Acceleration at Mean Sea Level (m/s^2)

// LAYER ARRAYS
int layerlen = 8; // Length of Arrays
float layeralt[] = {0.0, 11000.0, 20000.0, 32000.0, 47000.0, 51000.0, 71000.0, 84.852}; //Base Geopotential Altitudes (m)
float layertemp[] = {288.15, 216.65, 216.65, 228.65, 270.65, 270.65, 214.65, 187.15}; //Base Temperature (K)
float layerrate[] = {-6.5E-3, 0.0, 1.0E-3, 2.8E-3, 0.0, -2.8E-3, -2.0E-3, 0.0}; //Base Lapse Rate (K/m)
float layerpres[] = {101325, 22632.1, 5474.89, 868.019, 110.91, 66.939, 3.9564, 0.3734}; //Base Pressure (N/m^2)

//FUNCTIONS
float met2pot(float metalt);
float state2dens(float temp, float pres);
float alt2layer(float potalt);
float *alt2state(float metalt);

#endif
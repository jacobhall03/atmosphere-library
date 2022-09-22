#ifndef __STDATMOS_H
#define __STDATMOS_H

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

float met2pot(float metalt);
float state2dens(float temp, float pres);
float alt2layer(float potalt);
float *alt2state(float metalt);

#endif
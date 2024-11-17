## Copyright (c) 2024 by Harris Sinclair
## 
## Permission is hereby granted, free of charge, to any person obtaining a copy 
## of this software and associated documentation files (the "Software"), to 
## deal in the Software without restriction, including without limitation the 
## rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
## sell copies of the Software, and to permit persons to whom the Software is 
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in 
## all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
##
################################################################################
##
##      File: EasingFunction.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Collection of Static Easing Functions 
##            for the ChronoActions system.
##
################################################################################
##
## Shout Out to Andrey Sitnik and Ivan Solovev at https://easings.net/
## Most all of these functions are based on the math found there.
##
## An Easing Function is a Mathematical Function which describes a behavior
## over a certain amount of time. 
##
## Consider dropping a ball. When you drop a ball, it leaves your hand at some 
## initial time we'll call 0. At some later time, it comes to a stop at time 1. 
## But in between leaving your hand at time 0 and hitting the ground at time 1 
## the ball falls through the air, hits the ground, bounces back up, and hits 
## the ground again a few more times before coming to a stop at time 1.
## 
## You can describe that path with a mathematical function. A number of them
## are provided for you here, including the default of linear.

@tool
class_name EasingFunction

## Linear
static func Linear(PercentComplete : float)->float:
    return PercentComplete

################################################################################

## https://easings.net/#easeInSine
static func In_Sine(PercentComplete : float)->float:
    return 1 - cos((PercentComplete*PI) / 2)

## https://easings.net/#easeOutSine
static func Out_Sine(PercentComplete : float)->float:
    return 1 - sin((PercentComplete*PI) / 2)

## https://easings.net/#easeInOutSine
static func In_Out_Sine(PercentComplete : float)->float:
    return -(cos(PI*PercentComplete) - 1) / 2

################################################################################

## https://easings.net/#easeInQuad
static func In_Quadratic(PercentComplete : float)->float:
    return PercentComplete * PercentComplete

## https://easings.net/#easeOutQuad
static func Out_Quadratic(PercentComplete : float)->float:
    return 1- ((1 - PercentComplete) * (1 - PercentComplete))

## https://easings.net/#easeInOutQuad
static func In_Out_Quadratic(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return 2*PercentComplete*PercentComplete
    else:
        return 1 - (pow(-2 * PercentComplete + 2, 2) / 2)

################################################################################

## https://easings.net/#easeInCubic
static func In_Cubic(PercentComplete : float)->float:
    return PercentComplete * PercentComplete * PercentComplete

## https://easings.net/#easeOutCubic
static func Out_Cubic(PercentComplete : float)->float:
    return 1- (pow(1-PercentComplete,3))

## https://easings.net/#easeInOutCubic
static func In_Out_Cubic(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return 4*PercentComplete*PercentComplete*PercentComplete
    else:
        return 1 - (pow(-2 * PercentComplete + 2, 3) / 2)

################################################################################

## https://easings.net/#easeInQuart
static func In_Quartic(PercentComplete : float)->float:
    return PercentComplete * PercentComplete * PercentComplete * PercentComplete

## https://easings.net/#easeOutQuart
static func Out_Quartic(PercentComplete : float)->float:
    return 1- (pow(1-PercentComplete,4))

## https://easings.net/#easeInOutQuart
static func In_Out_Quartic(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return 8*PercentComplete*PercentComplete*PercentComplete*PercentComplete
    else:
        return 1 - (pow(-2 * PercentComplete + 2, 4) / 2)

################################################################################

## https://easings.net/#easeInQuint
static func In_Quintic(PercentComplete : float)->float:
    return PercentComplete * PercentComplete * PercentComplete * PercentComplete\
            * PercentComplete

## https://easings.net/#easeOutQuint
static func Out_Quintic(PercentComplete : float)->float:
    return 1- (pow(1-PercentComplete,5))

## https://easings.net/#easeInOutQuint
static func In_Out_Quintic(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return 16*PercentComplete*PercentComplete*PercentComplete\
                    *PercentComplete*PercentComplete
    else:
        return 1 - (pow(-2 * PercentComplete + 2, 5) / 2)

################################################################################

## https://easings.net/#easeInExpo
static func In_Exponential(PercentComplete : float)->float:
    if PercentComplete == 0:
        return 0
    else:
        return pow(2, 10*PercentComplete - 10)

## https://easings.net/#easeOutExpo
static func Out_Exponential(PercentComplete : float)->float:
    if PercentComplete == 1:
        return 1
    else:
        return 1 - pow(2, -10*PercentComplete)

## https://easings.net/#easeInOutExpo
static func In_Out_Exponential(PercentComplete : float)->float:
    if PercentComplete == 0:
        return 0
    elif PercentComplete == 1:
        return 1
    else:
        if PercentComplete < 0.5:
            return pow(2, 20*PercentComplete - 10) / 2
        else:
            return (2-pow(2,-20*PercentComplete+10)) / 2

################################################################################

## https://easings.net/#easeInCirc
static func In_Circular(PercentComplete : float)->float:
    return 1 - sqrt(1 - pow(PercentComplete, 2))

## https://easings.net/#easeOutCirc
static func Out_Circular(PercentComplete : float)->float:
    return sqrt(1 - pow(PercentComplete - 1, 2))

## https://easings.net/#easeInOutCirc
static func In_Out_Circular(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return (1 - sqrt(1 - pow(2 * PercentComplete, 2))) / 2
    else:
        return (1 + sqrt(1 - pow(-2 * PercentComplete + 2, 2))) / 2

################################################################################
const c1 = 1.70158
const c2 = c1 + 1

## https://easings.net/#easeInBack
static func In_Backtrack(PercentComplete : float)->float:
    return (c2 * PercentComplete * PercentComplete * PercentComplete)\
            - (c1 * PercentComplete * PercentComplete)

## https://easings.net/#easeOutBack
static func Out_Backtrack(PercentComplete : float)->float:
    return 1 + (c2*pow(PercentComplete - 1, 3))\
             + (c1*pow(PercentComplete - 1, 2))

## https://easings.net/#easeInOutBack
static func In_Out_Backtrack(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return (pow(2*PercentComplete, 2) * \
               ((c2 + 1) * 2 * PercentComplete - c2)) / 2
    else:
        return (pow(2 * PercentComplete - 2, 2) *\
                ((c2 + 1) * (PercentComplete * 2 - 2) + c2) + 2) / 2

################################################################################
const c3 = (2*PI) / 3
const c4 = (2*PI) / 4.5

## https://easings.net/#easeInElastic
static func In_Elastic(PercentComplete : float)->float:
    if PercentComplete == 0:
        return 0
    elif PercentComplete == 1:
        return 1
    else:
        return -pow(2, 10*PercentComplete - 10) * \
                sin((PercentComplete*10 - 10.75) * c3)

## https://easings.net/#easeOutElastic
static func Out_Elastic(PercentComplete : float)->float:
    if PercentComplete == 0:
        return 0
    elif PercentComplete == 1:
        return 1
    else:
        return  pow(2, 10*PercentComplete - 10) * \
                sin((PercentComplete*10 - 0.75) * c3) + 1

## https://easings.net/#easeInOutElastic
static func In_Out_Elastic(PercentComplete : float)->float:
    if PercentComplete == 0:
        return 0
    elif PercentComplete == 1:
        return 1
    else:
        if PercentComplete < 0.5:
            return -(pow(2, 20*PercentComplete - 10) \
            * sin(20*PercentComplete-11.125) *c4) / 2
        else:
            return 1 + (pow(2, -20*PercentComplete - 10) \
            * sin(20*PercentComplete-11.125) *c4) / 2

################################################################################

## https://easings.net/#easeInBounce
static func In_Bounce(PercentComplete : float)->float:
    return 1 - Out_Bounce(1 - PercentComplete)

## https://easings.net/#easeOutBounce
static func Out_Bounce(PercentComplete : float)->float:
    const n1 = 7.5625
    const d1 = 2.75
    
    if PercentComplete < (1 / d1):
        return n1 * PercentComplete * PercentComplete
    elif PercentComplete < (2 / d1):
        var adjusted = PercentComplete - (1.5 / d1)
        return n1 * (adjusted) * adjusted + 0.75
    elif PercentComplete < (2.5 / d1):
        var adjusted = PercentComplete - (2.25 / d1)
        return n1 * (adjusted) * adjusted + 0.9375
    else:
        var adjusted = PercentComplete - (2.625 / d1)
        return n1 * (adjusted) * adjusted + 0.984375

## https://easings.net/#easeInOutBounce
static func In_Out_Bounce(PercentComplete : float)->float:
    if PercentComplete < 0.5:
        return (1 - Out_Bounce(1 - 2 * PercentComplete)) / 2
    else:
        return (1 + Out_Bounce(2 * PercentComplete - 1)) / 2

################################################################################

static func In_Ease(PercentComplete : float)->float:
    return sqrt(PercentComplete)

static func Out_Ease(PercentComplete : float)->float:
    return pow(PercentComplete, 2.0)

## NOTE: Fast is a descriptor of the behavior, not the Big O Complexity
static func In_Fast(PercentComplete : float)->float:
    return sqrt(sqrt(PercentComplete))

static func Out_Fast(PercentComplete : float)->float:
    return pow(PercentComplete, 4.0)
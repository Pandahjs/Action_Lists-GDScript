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
##      File: BaseAction.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Base Action for the ChronoActions system

@tool
class_name BaseAction

# How long an Action will last for (in Seconds)
var Duration        : float    = 0

# How much time has passed for the Action (in Seconds)
var TimeElapsed     : float    = 0

# What percentage of the Action has completed.
var PercentComplete : float    = 0

# The Name of the Action
var Name            : String   = ""

# Which Easing Function the Action uses. 
## For More Information, see "./Actions/Other/EasingFunction.gd"
var EaseFunction    : Callable = EasingFunction.Linear

# Basic Initialization Function
func _init(duration_ : float, name_ : String) -> void:
    Duration = duration_
    Name = name_

# Act
#
# Base Action Functionality. Inherited Actions Should Call this Function before
# performing their tasks, and pass out it's result.
#
# TimeStep: The amount of time that has passed since last the action was called.
## This is typically DeltaTime, but could be different if you want the Actions
## to complete at a different rate (Ex. Bullet Time, Rewind, etc)
#
# Return bool: Indicator of if the Action has finished.
func Act(TimeStep : float) -> bool:
    # Early Exit, don't divide by zero.
    if Duration == 0:
        return true # Returning True Indicates the Action is Finished.
    
    TimeElapsed += TimeStep
    PercentComplete = EaseFunction.call(TimeElapsed/Duration)

    if TimeElapsed >= Duration:
        return true
    
    return false # Returning False Indication the Action is Still Running

# Base GetString Function
## If an action doesn't overload this, it just returns Name and % Completed
func GetString() -> String:
    return Name + " %.f"%(PercentComplete * 100)    
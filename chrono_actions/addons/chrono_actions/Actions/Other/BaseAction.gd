##
## The Base Action for the ChronoActions system. New Actions should Inherit from this Action 
##
##      File: BaseAction.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Base Action for the ChronoActions system

@tool
# This is some sample text
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
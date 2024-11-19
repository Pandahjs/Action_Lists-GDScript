######################################################################################
##
##      File: BaseAction.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Base Action for the ChronoActions system
##
######################################################################################
@tool
class_name BaseAction

# How long an Action will last for (in Seconds)
var Duration : float = 0

# How much time has passed for the Action (in Seconds)
var TimeElapsed : float = 0

# What percentage of the Action has completed.
var PercentComplete : float = 0

# The Name of the Action
var Name : String   = ""

# Which Easing Function the Action uses. 
## For More Information, see "./Actions/Other/EasingFunction.gd"
var EaseFunction : Callable = EasingFunction.Linear

# What Groups this Action is a part of
## This allows you to interact with only specific groups of Actions.
## For example, you might want to block logical actions while you wait for an animation
## Or you might want have all visual actions undergo bullet time.
## 
## You can be a part of a group and/or block a group as an action.
##
## Inititally, there is just the "default" group that everything is a part of and which (almost) nothing blocks.
## 
var Groups : Dictionary = {
#     Name    |  Member, Blocking
    "default" : [ true ,  false],

# Some Other Potential Groups:
##  "logical"   : [false, false],
##  "kinematic" : [false, false],
##  "visual"    : [false, false],
##  "enemies"   : [false, false],
##  "items"     : [false, false],
##  "ui"        : [false, false]
}

# Base Initialization Function
func _init(duration_ : float, name_ : String, ease_ : Callable = EasingFunction.Linear) -> void:
    Duration = duration_
    Name = name_
    EaseFunction = ease_

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

# Allows you to set the Ease Function for any action.
func SetEaseFunction(ease_func_ : Callable):
    EaseFunction = ease_func_
    pass

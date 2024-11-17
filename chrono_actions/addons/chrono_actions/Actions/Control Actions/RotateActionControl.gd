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
##      File: RotateActionControl.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Rotate Action in 2D for the ChronoActions system
@tool
extends BaseAction

class_name RotateActionControl

var Start   :float= 0 
var End     :float= 0
var Current :float= 0

var Target    : Control = null
var isGlobal  : bool   = false 
var isDegrees : bool   = true

# Initialization Function
#
# Target_    : What Control inherited object is being rotated
# Duration_  : How long it should take to Rotate (In Seconds)
# Start_     : Where the Rotate should Start  
# End_       : Where the Rotation should End Up
# isGlobal_  : Whether this is a Global or Local Rotation Change
# isDegrees_ : Whether the passed values are in Degrees (True) or Radians (False)
#
func _init(Target_ : Control, Duration_ : float, Start_ : float, End_ : float, \
            isGlobal_:bool = false, isDegrees_ : bool = true):
    super._init(Duration_, "RotateAction2D")
    Target    = Target_
    Start     = Start_
    Current   = Start_
    End       = End_
    isGlobal  = isGlobal_
    isDegrees = isDegrees_

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    # Because Easing is Handled by the Base Action, we can (almost) always 
    # write a simple linear interpolation and let easing handle edge cases.
    Current = Start + ((End - Start) * PercentComplete)

    if Target != null:
        if isGlobal:
            if isDegrees:
                Target.global_rotation_degrees = Current
            else:
                Target.global_rotation = Current
        else:
            if isDegrees:
                Target.rotation_degrees = Current
            else:
                Target.rotation = Current

    return AmDone
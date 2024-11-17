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
##      File: ScaleAction3D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Scale Action in 2D for the ChronoActions system

extends BaseAction

class_name ScaleAction3D

var Start   := Vector3(0,0,0)
var End     := Vector3(0,0,0)
var Current := Vector3(0,0,0)

var Target   : Node3D = null

# Initialization Function
#
# Target_   : What Node3D inherited object is being scaled
# Duration_ : How long it should take to Scale (In Seconds)
# Start_    : What size the Scale should Start  
# End_      : How big the Scale should End Up
#
func _init(Target_ : Node3D, Duration_ : float, Start_ : Vector3, End_ : Vector3):
    super._init(Duration_, "ScaleAction3D")
    Target   = Target_
    Start    = Start_
    Current  = Start_
    End      = End_

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
        Target.scale = Current

    return AmDone
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
##      File: MoveAction2D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Move Action in 2D for the ChronoActions system

extends BaseAction

class_name MoveAction2D

var Start   := Vector2(0,0)
var End     := Vector2(0,0)
var Current := Vector2(0,0)

var Target   : Node2D = null
var isGlobal : bool = false 

# Initialization Function
#
# Target_   : What Node2D inherited object is being moved
# Duration_ : How long it should take to Move (In Seconds)
# Start_    : Where the Move should Start From 
# End_      : Where the Move should End Up
# isGlobal_ : Whether this is a Global or Local Position Change
#
func _init(Target_ : Node2D, Duration_ : float, Start_ : Vector2, End_ : Vector2, isGlobal_:bool = false):
    super._init(Duration_, "MoveAction2D")
    Target   = Target_
    Start    = Start_
    Current  = Start_
    End      = End_
    isGlobal = isGlobal_

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
            Target.global_position = Current
        else:
            Target.position = Current

    return AmDone
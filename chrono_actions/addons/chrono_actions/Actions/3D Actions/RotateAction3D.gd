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
##      File: RotateAction3D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Rotate Action in 2D for the ChronoActions system
@tool
extends BaseAction

class_name RotateAction3D

var Start   : Quaternion 
var End     : Quaternion
var Current : Quaternion

var Target    : Node3D = null
var isGlobal  : bool   = false 
var isDegrees : bool   = true

# Initialization Function
#
# Target_    : What Node2D inherited object is being rotated
# Duration_  : How long it should take to Rotate (In Seconds)
# Start_     : Where the Rotate should Start  
# End_       : Where the Rotation should End Up
# isGlobal_  : Whether this is a Global or Local Rotation Change
# isDegrees_ : Whether the passed values are in Degrees (True) or Radians (False)
#
func _init(Target_ : Node3D, Duration_ : float, Start_ : float, End_ : float, Axis_:int, isDegrees_ : bool = true):
    super._init(Duration_, "RotateAction3D")
    Target    = Target_
    isDegrees = isDegrees_

    # I will freely admit, I have no idea why I do this.
    # What I do know is that in order to be scaled appropriately for Quaternions
    # We have to do this Arcane Ritual
    # -----------------------------------
    # IF YOU KNOW *why* this math makes things work, please write in!
    var OldScale = 360
    var NewScale = 4
    var NewStartValue = ((Start_)*NewScale)/OldScale
    var NewEndValue   = ((End_)*NewScale)/OldScale

    match Axis_:
        0:
            if isDegrees:
                Start = Quaternion(Basis(Vector3(1,0,0),deg_to_rad(NewStartValue)).orthonormalized())
                End = Quaternion(Basis(Vector3(1,0,0),deg_to_rad(NewEndValue)).orthonormalized())
            else:
                Start = Quaternion(Basis(Vector3(1,0,0),(NewStartValue)).orthonormalized())
                End = Quaternion(Basis(Vector3(1,0,0),(NewEndValue)).orthonormalized())
        1:
            if isDegrees:
                Start = Quaternion(Basis(Vector3(0,1,0),deg_to_rad(NewStartValue)).orthonormalized())
                End = Quaternion(Basis(Vector3(0,1,0),deg_to_rad(NewEndValue)).orthonormalized())
            else:
                Start = Quaternion(Basis(Vector3(0,1,0),(NewStartValue)).orthonormalized())
                End = Quaternion(Basis(Vector3(0,1,0),(NewEndValue)).orthonormalized())

        2:
            if isDegrees:
                Start = Quaternion(Basis(Vector3(0,0,1),deg_to_rad(NewStartValue)).orthonormalized())
                End = Quaternion(Basis(Vector3(0,0,1),deg_to_rad(NewEndValue)).orthonormalized())
            else:
                Start = Quaternion(Basis(Vector3(0,0,1),(NewStartValue)).orthonormalized())
                End = Quaternion(Basis(Vector3(0,0,1),(NewEndValue)).orthonormalized())

    Current = Start

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    # This is one of the exceptions to our usual Linear Interpolation
    # Because Rotation in 3D is....complicated....
    Current = Start.slerp(End,PercentComplete)

    if Target != null:
        Target.transform.basis *= Basis(Current)

    return AmDone
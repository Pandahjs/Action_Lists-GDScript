using Godot;
using System;
using System.Collections.Generic;

public partial class BaseAction : GodotObject
{
    // How long an Action will last for (in Seconds)
    private float Duration = 0.0f;

    // How much time has passed for the Action (in Seconds)
    private float TimeElapsed = 0.0f;
    
    // The Easing Function the Action Uses
    /// For more details, see "addons/ActionMisc/EasingFunctions.cs"
    private Func<float,float> EaseFunction = null;

    // Which Groups this Action is a part of
    /// This allows you to interact with only specific groups of Actions.
    /// For example, you might want to block logical actions while you wait for an animation.
    /// Or you might want to have all visual actions undergo bullet time.
    ///
    /// You can be a part of a group and/or block a group as an action.
    private Dictionary<string,List<bool>> Groups = new Dictionary<string, List<bool>>();

    // What percentage of this Action is complete (0 to 1 scale)
    protected float PercentComplete = 0.0f;
    
    // What this action's name is, used in GetString.
    protected string Name = "";

    // BaseAction Initialization
    //
    // If you don't pass an EaseFunc to this, it defaults to Linear.
    // A selection of other easing function types are provided for you in the EasingFunctions static.
    //
    public void _init(float duration, string name, Func<float,float> EaseFunc = null)
    {
        Duration = duration;
        Name = name;
        EaseFunction = EaseFunc ?? EasingFunctions.Linear;

        // Default Group, everything is a part of it.
        Groups.Add("default",new List<bool>{true, false});
        // Other Potential Groups:
        // "Logical"   : [false, false]
        // "Kinematic" : [false, false]
        // "Visual"    : [false, false]
        // "Enemies"   : [false, false]
        // "Items"     : [false, false] 
        // "UI"        : [false, false]
        // "Cameras"   : [false, false]
    }

    // Act
    //
    // Base Action Functionality. Inherited Actions Should Call this Function before
    // performing their own logic, and then should pass out it's result.
    //
    // TimeStep: The amount of time that has passed since last the action was updated.
    // This is typically DeltaTime, but could be different for different FX like
    // Bullet Time, Rewind, Time Dialation, ETC
    //
    // Return: On Completion, return true. Else return false to indicate still working.
    public bool Act(float TimeStep)
    {
        // Early Exit so we don't divide by zero
        if(Duration == 0)
        {
            return true;
        }

        TimeElapsed += TimeStep;

        // This is where we perform easing.
        // This ensures that we always finish on time
        // While still mucking about with how fast and far we get.
        PercentComplete = EaseFunction(TimeElapsed / Duration);

        if(TimeElapsed >= Duration)
        {
            return true;
        }

        //Indicate Action Still Processing
        return false;
    }

    // This is largely a debug feature.
    public string GetString()
    {
        return Name + " " + GD.VarToStr(PercentComplete * 100) + "%";
    }

    // Set Ease Function: Sets the Easing Function
    //
    // Expecting to receive a function that accepts a float and returns a float.
    //
    // Returns this Action. The expectation is that you call this as part of
    // Action Construction before you pass it to the ChronoList
    public BaseAction SetEaseFunction(Func<float, float> EaseFunc)
    {
        EaseFunction = EaseFunc;
        return this;
    }

    // AddGroup: Adds a New Group to the Action
    //
    // Returns this Action. The expectation is that you call this as part of
    // Action Construction before you pass it to the ChronoList
    public BaseAction AddGroup(string group_name, List<bool> states)
    {
        Groups.Add(group_name,states);
        return this;
    }

    // GetGroup
    //
    // If the Action knows of that group, returns it's states.
    // Else it returns null.
    public List<bool> GetGroup(string group_name)
    {
        if(Groups.ContainsKey(group_name))
            return Groups[group_name];
        
        return null;
    }

    // IsInGroup
    // If this action is in a Group, returns true.
    // Else False.
    public bool IsInGroup(string group_name)
    {
        if(!Groups.ContainsKey(group_name))
            return false;
        
        List<bool> states = Groups[group_name];

        return states[0];
    }

    // IsBlockingGroup
    // If this action Blocks a Group, returns true.
    // Else False.
    public bool IsBlockingGroup(string group_name)
    {
        if(!Groups.ContainsKey(group_name))
            return false;
        
        List<bool> states = Groups[group_name];

        return states[1];
    }
    
}

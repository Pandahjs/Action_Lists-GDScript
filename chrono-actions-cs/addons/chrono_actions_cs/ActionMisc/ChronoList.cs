//####################################################################################
// 
//      File: ChronoList.gd
//    Author: Harris Sinclair
//     Brief: This file defines the behavior of the ChronoList Node
//            The Brain of the ChronoActions System, This Executes the Actions.
//
//####################################################################################
#if TOOLS
using Godot;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Threading.Tasks.Dataflow;

public partial class ChronoList : Node
{
	private Godot.Collections.Array<BaseAction> actionList = null;
	private List<string> blockedGroups = null; 

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		actionList = new Godot.Collections.Array<BaseAction>();
		blockedGroups = new List<string>();
	}

	public void AddAction(BaseAction action)
	{
		actionList.Add(action);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		blockedGroups.Clear();
	
		// For all actions (that we're going to execute)
		foreach(BaseAction action in actionList)
		{
			// Check if we're in a blocked group
			bool isBlocked = false;	
			foreach(string group in blockedGroups)
			{
				if(action.IsInGroup(group))
					isBlocked = true;
			}

			if(!isBlocked)
			{
				// Run the Action Forward
				bool result = action.Act((float)delta);
				GD.Print(action.GetString());

				// if it's done, delete it
				if(result == true)
					actionList.Remove(action);
			
				// Wait Action Check
				if(result != true)
				{
					// Add it's blocked groups to the list (if any)
					foreach(var group in action.Groups.Keys)
					{
						if(action.IsBlockingGroup(group))
						{
							blockedGroups.Add(group);
						}
					}
				}
			}
		}
	}
}
#endif
#if TOOLS
using Godot;
using System;

[Tool]
public partial class ChronoActions_CS : EditorPlugin
{
	public override void _EnterTree()
	{
		// Initialization of the plugin goes here.
		var script = GD.Load<Script>("res://addons/chrono_actions_cs/ActionMisc/ChronoList.cs");
		var texture = GD.Load<Texture2D>("res://addons/ChronoList_Node_Icon.png");

		AddCustomType("Chrono List","Node",script,texture);
	}

	public override void _ExitTree()
	{
		// Clean-up of the plugin goes here.
		RemoveCustomType("Chrono List");
	}
}
#endif

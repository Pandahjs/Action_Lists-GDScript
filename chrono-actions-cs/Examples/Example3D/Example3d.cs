using Godot;
using System;

public partial class Example3d : Node3D
{
	ChronoList controller;
	MeshInstance3D exampleBox;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		controller = GetNode<ChronoList>("./Chrono List");
		exampleBox = GetNode<MeshInstance3D>("./Box");
	
		controller.AddAction(new Rotate3D(exampleBox,5,new Vector3(1,1,1),360));
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{

	}
}

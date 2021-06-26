//=============================================================================
// FleshFragment.
//=============================================================================
class BigFleshFragment expands DeusExFragment;

auto state Flying
{
	function BeginState()
	{
		Super.BeginState();

		Velocity = VRand() * 300;
		DrawScale = FRand() + 1.5;
	}
}

function Tick(float deltaTime)
{
	Super.Tick(deltaTime);
	
	if (!IsInState('Dying'))
		if (FRand() < 0.5)
			Spawn(class'BloodDrop',,, Location);
}

defaultproperties
{
     Fragments(0)=LodMesh'DeusExItems.FleshFragment1'
     Fragments(1)=LodMesh'DeusExItems.FleshFragment2'
     Fragments(2)=LodMesh'DeusExItems.FleshFragment3'
     Fragments(3)=LodMesh'DeusExItems.FleshFragment4'
     numFragmentTypes=4
     ImpactSound=Sound'DeusExSounds.Generic.FleshHit1'
     MiscSound=Sound'DeusExSounds.Generic.FleshHit2'
     Mesh=LodMesh'DeusExItems.FleshFragment1'
     DrawScale=2.000000
     CollisionRadius=4.000000
     Mass=10.000000
     Buoyancy=11.000000
     bVisionImportant=True
}

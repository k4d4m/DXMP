//=============================================================================
// Basketball.
//=============================================================================
class ball extends DeusExDecoration;

event HitWall(vector HitNormal, actor HitWall)
{
	local float speed;

	Velocity = 0.8*((Velocity dot HitNormal) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
	speed = VSize(Velocity);
	bFixedRotationDir = True;
	RotationRate = RotRand(False);
	if ((speed > 0) && (speed < 30) && (HitNormal.Z > 0.7))
	{
		SetPhysics(PHYS_None, HitWall);
		if (Physics == PHYS_None)
			bFixedRotationDir = False;
	}
	else if (speed > 30)
	{
		PlaySound(sound'BasketballBounce', SLOT_None);
		AISendEvent('LoudNoise', EAITYPE_Audio);
	}
}

defaultproperties
{
     HitPoints=100
     ItemName="Basketball"
     Mesh=LodMesh'DeusExDeco.Basketball'
     DrawScale=10.000000
     CollisionRadius=100.000000
     CollisionHeight=100.000000
     bBounce=True
     Mass=8
     Buoyancy=10.000000
}

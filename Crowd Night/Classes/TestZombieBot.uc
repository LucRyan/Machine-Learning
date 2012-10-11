class TestZombieBot extends GameAIController;

var Pawn thePlayer; //variable to hold the target pawn
var name SeenPlayerAnim;
simulated event PostBeginPlay()
{
    super.PostBeginPlay();
}

event SeePlayer(Pawn SeenPlayer)   //bot sees player
{
    if (thePlayer ==none)   //if we didnt already see a player
    {
        thePlayer = SeenPlayer; //make the pawn the target
        //ZombiePawn(Instigator).FullBodyAnimSlot.PlayCustomAnim(SeenPlayerAnim);
        GoToState('Follow'); // trigger the movement code
    }
}

state Follow
{

Begin:

    if (thePlayer != None)   // If we seen a player
    {

        MoveTo(thePlayer.Location); // Move directly to the players location
        GoToState('Looking'); //when we get there
    }

}

state Looking
{
Begin:
    if (thePlayer != None)   // If we seen a player
    {

        MoveTo(thePlayer.Location); // Move directly to the players location
        GoToState('Follow');  // when we get there
    }

}

defaultproperties
{
}
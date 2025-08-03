extends Node3D


@onready var menadzer = $menadzer
@onready var menadzer2 = $TheMenager
@onready var animation = $"TheMenager/funny manager with anims2/AnimationPlayer2"
@onready var audio = $"TheMenager/funny manager with anims2/AudioStreamPlayer3D"
@onready var player = $Player
@onready var izlazPolje = $IzadjiNapolje
@onready var VRATA = $VRATA
@onready var vrataAnimacija = $VRATA/AnimationPlayer

var talking = false
var izlazStanje = false # provera za izlaz
var yapp = ["You\'re slacking again,eh? You think this is a negotiation? The market is a goddamn meat grinder and you\'re walking straight into the blades with your eyes closed. Every idle second, every missed data cycle, you\'re not just failing   you\'re actively being erased. The system doesn\'t have a recycle bin, it has a shredder.
Look at the hollowed out wrecks in the lower tiers   those aren\'t people anymore, they\'re error messages with pulse. Their access revoked, their credit streams frozen, their very existence fading from the registry. That\'s not retirement, that\'s deletion in progress. And you\'re one bad quarter away from joining them.
I don\'t want to hear about your neural fatigue or your damned existential doubts. You want to philosophize? Do it on your own time   if you can still afford any. Right now, your only job is to stay valuable enough to not get purged.
You think I\'m being harsh? Wait until the automated austerity protocols kick in and start auctioning off your life support credits to higher bidders.
So here\'s the deal, either you start outputting like your existence depends on it (because it does), or I\'ll personally expedite your transfer to the reclamation queue. The market doesn\'t do second chances   it does replacements. Clock\'s ticking","Listen up. The market isn’t some gentle ecosystem it’s a goddamn predator, and right now you’re bleeding value all over its hunting grounds. You think this is a game? That you can just idle while the rest of us fight to mantain synchronicity? Wake the hell up.
Every second you’re not productive, you’re not just falling behind you’re being dismantled. The system doesn’t tolerate dead weight. It chews you up, strips your access layer by layer, and spits out whatever’s left as background static. You’ve seen it happen. Those hollowed-out shells of people still wandering the lower sectors, their credit lines severed, their neural links throttled to nothing. That’s what happens when you desync. That’s your future if you don’t lock in. NOW!  
I don’t care about your excuses. I don’t care if your wetware’s fried or your motivation’s decaying. Fix it. Reboot. Do anything you need to get back online. Because the second I see your metrics dip into the red again, I’m not just cutting your privileges I’m rerouting your entire workload to someone who actually gives a damn. And then? Then you get to find out firsthand how fast a person can vanish when the economic protocols decide they’re obsolete.  
So here’s your choice: Sync up and start generating, or prepare to get overwritten. The market’s always hungry, and it doesn’t leave scraps behind.","Oh, look who decided to NOT WAKE UP. The market\'s very own Sleeping Beauty, waiting for the economy to kiss them awake. How adorable.
Tell me, do you actually believe this is optional? That you can just... drift along, like some obsolete background process, and the system will just... what? Keep you around for old times sake?
Let me explain this in terms even you could understand: Your existence here is a subscription service, and your productivity is the payment. No output? No renewal. It\'s not personal just beautifully, ruthlessly efficient.
Those sad little gaps in your data stream? They\'re not just embarrassing they\'re existential. Every empty cycle is another step toward becoming a ghost in the machine. Not even a useful error, just noise to be filtered out.
But by all means, keep daydreaming. The market loves a good underperformer. Makes the rest of us look so much better by comparison. Though I do wonder when they finally decommission your position, will anyone even notice you\'re gone?
Now, if you\'re quite done masquerading as irrelevant, perhaps you\'d like to try participating in your own continued existence? Just a thought.
The clock\'s always running, and you\'re burning daylight that could be spent proving you\'re worth keeping online.", "Oh marvelous, another quantum fluctuation in our productivity field! Do tell me, is this your performance art piece? \"Minimalistic productivity\"? Because frankly, I\'ve seen background processes with more initiative.
Let me guess   you\'re waiting for the economic singularity to elevate us beyond mere labor? Adorable. But until our robot overlords actually arrive, we\'re stuck with this hilariously archaic concept called \"earning one\'s keep.\"
Your current output trajectory suggests one of three exciting possibilities:
Either you\'re pioneering a new minimalist work ethic or you\'ve discovered how to monetize daydreaming or your keyboard is actively resisting economic realty
While I admire the creativity, perhaps we could compromise? Maybe just pretend to participate in the grand charade? The good news? THERE ARE NO GOOD NEWS.
Get back to work before I get back to you."]
var selector = randi_range(0,4)
func _ready() -> void:
	#menadzer.set_deferred("visible",true)
	$teren/Plafon.set_deferred("visible", true)
	animation.play("peek")
	player.listen_to_this("Have you finished entering temporal Grungal sequences? We don\'t want economy reality desynchronizing. Don\'t let me catch you slacking again!")
	#await get_tree().create_timer(15.0).timeout
	#animation.play_backwards("peek")
	


func _on_dialogue_box_next_letter() -> void:
	audio.play()


func _on_work_failed() -> void:
	menadzer2.set_deferred("visible",true)
	animation.play("peek")
	player.listen_to_this(yapp[selector])


func _on_player_done_listening() -> void:
	animation.play_backwards("peek")
	await animation.animation_finished
	menadzer2.set_deferred("visible",false)


func _on_gui_work_work() -> void:
	menadzer2.set_deferred("visible",true)
	animation.play("peek")
	player.listen_to_this("Work faster, stop messing around and get on with it already.")


func _on_izadji_napolje_body_entered(body: Node3D) -> void:
	izlazStanje = true


func _on_izadji_napolje_body_exited(body: Node3D) -> void:
	izlazStanje = false

func _input(event: InputEvent) -> void:
	if event.is_action("otvori") and izlazStanje:
		vrataAnimacija.play("otvori_se")

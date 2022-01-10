# Miller's Quest!
(archived site could be found at https://web.archive.org/web/20160306021319/http://www.beastwithin.org/users/wwwwolf/games/millerquest/)

Miller's Quest! is a role-playing simulator game. It could also be described as a "fire-and-forget role-playing game". In other words, it is not a role-playing game in the most traditional sense, because there is absolutely no player interaction. The emphasis on this game is the simulation of role-playing.

So, it is a completely non-interactive computer role-playing game. "I guess it's not fun then", I can hear you say. Wrong! Miller's Quest! is, in fact, very much fun. It has all of the excitement of traditional MMORPGs with none of the effort to be put in mindless treadmilling. You can watch your character grow more potent and more powerful, and you don't need to bore yourself with details like "okay, attack the monster, I'm going to win anyway".

Miller's Quest! was largely inspired by its direct ancestor, Progress Quest. It is written in Ruby programming language and as such it was largely also inspired by Dwemthy's Array, without any of its clever metaprogramming stuff and general bore of having to use irb to play it. Players of Progress Quest should be right at home with Miller's Quest!. What tells MQ and PQ apart is the fact that MQ is not entirely progress-driven. In MQ, all monsters have actual stats. There's actual, stats- and probability-based fighting involved. Since dying in a continually running game is pretty damn boring, you get also revived and healed automatically if that occurs.

MQ owes a lot of its continued existence to Ruby Development Tools, the Ruby environment for the Eclipse Platform.

Want to help? Patches? Bug reports? Send email to wwwwolf@iki.fi. Please put "Miller's Quest" in the Subject line somewhere so they stand out from among the spam. Thanks.

News
Press mentions [12 January 2006, 5:59 pm]
Whoa! Miller's Quest! showed up in OSTG's radar, and I'm not talking about Freshmeat either. =) NewsForge and Linux.com talk about the game. Quite interesting, and thanks to everyone who emailed me feedback too. It's been quiet on the MQ development front over the past few months, but I expect to get something done soonish! Expect a new release in February, or even earlier. =)
Questions and Answers
Is it really that fun?
You bet! This is a nice simulation of RPGish combat and other such activities.

Is it a substitute for a real game then?
Well, yes and no. Most games are social. Sometimes, using a little bit of effort is a good thing too.

Is this thing actually a working release?
Well, the game itself works pretty well, but the combat system is really, really rudimentary. The messages it prints out are not really that complex either.

In other words, this is an "evolved beta". Good enough for messing around...

Wrong sense of humor!
I know! I started doing this with humor similar to PQ, but it didn't work that well. I have a sense of humor of my own, and somewhere middle of the thing I realized that I'm not really playing PQ or LotGD for their sense of humor, i.e., adding ho-ho-ho silly names of monsters and poking fun at some of the cliches. I hope I'll be able to make this more distinct!



<i>Miller's quest</i> developer documentation

The most important parts of the whole mess are as follows:

* The main loop, which resides in millerquest.rb.

* The adventuring, which is defined pretty well in the Adventure module
  (lib/adventure.rb). This defines most of the day-to-day life of our
  intrepid adventurer. This is tied pretty well to the task system
  described below.

* Equipment system (lib/equipment.rb) and the DamageType and Material
  systems (lib/typesandprops.rb).
* Task system (lib/task.rb) - Tasks are things that the player does.
  These are subclassed from the main Task class.
  For example, you can watch the plot unfold (PlotTask), or kill a
  monster (FightTask). They're then done by calling the Task#complete
  method of the object. Currently available tasks:
  * PlotTask - for simple procedures that can't really be messed up.
    good for advancing the plot.
  * TravelTask - Moves the player between the town and the killing fields.
  * FightTask - Combat the baddies!
  * MerchantSellTask - Sells stuff to the merchant at the town.

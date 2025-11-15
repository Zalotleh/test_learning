// The Last Call - Marcus Webb Bribe Scene
// The pivotal moral choice of the case
// Location: Private meeting location (Webb calls you)

VAR morality = 0
VAR sarah_trust = 0
VAR evidence_count = 0  // How much evidence you have
VAR webb_knows_youre_close = true
VAR final_choice_made = false

CONST BRIBE_AMOUNT = 50000

=== start ===
Your phone rings. Unknown number.

You answer.

"We need to talk." The voice is smooth, controlled. Marcus Webb.

* [Where and when?]
    -> agree_to_meet
* [Hang up]
    -> hang_up_attempt
* [We can talk now]
    -> talk_now

=== hang_up_attempt ===
"This conversation ends now—"

"I know what you have," Webb interrupts, voice harder now. "I know what you think you know. And I know that if you pursue this, you'll destroy a lot of innocent people."

* [Listen]
    -> agree_to_meet
* [Still hang up]
    ~ morality += 3
    You hang up. The phone rings again immediately.
    -> agree_to_meet

=== talk_now ===
"We can talk right now, Webb."

"Not over the phone. The parking garage behind your office. One hour. Come alone."

The line goes dead.

-> prepare_for_meeting

=== agree_to_meet ===
"Where?"

"Parking garage behind your office. One hour. Come alone, or this conversation never happens."

Click.

-> prepare_for_meeting

=== prepare_for_meeting ===
You have an hour before meeting Webb.

{evidence_count >= 8: You have enough evidence to take him down. The embezzlement, the timeline gap, the motive. Maybe even the murder.}
{evidence_count < 8: You have some evidence, but the case isn't airtight yet.}

This meeting could be dangerous. Webb knows you're closing in.

* [Bring the evidence files]
    -> bring_evidence
* [Go unarmed (metaphorically)]
    -> go_unarmed
* [Call Detective Kwan]
    -> call_kwan

=== bring_evidence ===
You pack copies of the key evidence in your bag. USB drive copy, timeline reconstruction, everything.

If this goes south, at least you have leverage.

-> arrive_at_garage

=== go_unarmed ===
You go with nothing but your phone.

Better to hear what he has to say first.

-> arrive_at_garage

=== call_kwan ===
~ morality += 5
You call Detective Kwan.

"I'm meeting Marcus Webb in an hour. Parking garage behind my office. If you don't hear from me in two hours..."

"I'll come myself," Kwan says. "Be careful."

-> arrive_at_garage

=== arrive_at_garage ===
The parking garage is nearly empty at this hour. Your footsteps echo.

A black sedan sits in the corner. As you approach, the rear door opens.

Marcus Webb sits inside, immaculate in a tailored suit. He gestures to the seat beside him.

* [Get in the car]
    -> get_in_car
* [Talk from outside]
    -> talk_outside

=== talk_outside ===
~ morality += 2
"I'll stand, thanks."

Webb sighs. "Have it your way." He steps out, closing the door. Two men in suits emerge from the shadows nearby—bodyguards.

"Just insurance," Webb says smoothly.

-> confrontation_begins

=== get_in_car ===
You slide into the leather seat. Webb smells of expensive cologne.

The door closes. Suddenly the space feels very small.

-> confrontation_begins

=== confrontation_begins ===
"You're good," Webb says. "Better than I expected. Found the USB drive, cracked David's encryption, put together the timeline. I'm impressed."

* [Don't confirm anything]
    -> play_coy
* [Confront him directly]
    -> confront_murder
* [Ask what he wants]
    -> ask_what_he_wants

=== play_coy ===
"What makes you think I found anything?"

Webb smiles. "Because Rebecca Martinez suddenly requested a transfer. Because you've been asking questions at the gala venue. Because you're not stupid."

-> webb_lays_out_situation

=== confront_murder ===
~ morality += 3
"You killed David Chen."

It's not a question.

Webb's expression doesn't change. "David made a choice. A poor one. He was going to destroy our firm—put hundreds of people out of work—over some creative accounting."

"Creative accounting? You embezzled millions."

"I borrowed from accounts that could afford it. I always paid it back. David didn't understand the nuances of high-level finance."

-> webb_justifies

=== ask_what_he_wants ===
"What do you want, Webb?"

"To make you an offer. And to explain why taking it is the smart choice."

-> webb_lays_out_situation

=== webb_lays_out_situation ===
Webb leans back, casual. Like he's discussing a business deal.

"Here's the situation. You have evidence of embezzlement. Maybe. Enough to make my life difficult for a few years. But murder?" He shakes his head. "That's circumstantial at best. Timeline gaps, suspicious coincidences. No jury would convict."

{evidence_count >= 10: "Though I admit, you've gathered more than I expected."}

"David's death was a tragedy. Suicide often is. His sister is looking for someone to blame because grief needs a target."

-> webb_makes_offer

=== webb_justifies ===
"David was idealistic," Webb continues. "Couldn't see the bigger picture. Yes, I moved money around. Yes, some of it stuck to my fingers. But the firm stayed afloat. People kept their jobs. Clients were happy."

"David was going to blow the whistle, collapse everything, for what? Principle? Principles don't feed families."

* [He deserved the truth to come out]
    ~ morality += 3
    -> defend_david
* [So you killed him]
    -> webb_evades
* [Stay silent]
    -> webb_makes_offer

=== defend_david ===
"David deserved to expose the truth without being murdered for it."

"Murdered," Webb repeats, tasting the word. "Such a harsh term. Let's say... a problem solved itself. David was depressed, taking medication, under stress. Sometimes people break."

"You poisoned him."

"Can you prove that?" Webb asks mildly. "In court? Beyond reasonable doubt?"

-> webb_makes_offer

=== webb_evades ===
"I didn't kill anyone," Webb says smoothly. "I wasn't even at David's apartment that night. I was at a charity gala with two hundred witnesses."

"With a ninety-minute gap in your timeline."

"I stepped out for a phone call. Took a walk. Donations make me uncomfortable—I needed air." He spreads his hands. "Is that a crime?"

-> webb_makes_offer

=== webb_makes_offer ===
Webb pulls out an envelope. Thick. You can see the paper inside.

"Fifty thousand dollars," he says quietly. "Cash. Untraceable."

He sets it on the seat between you.

"Walk away. Tell Sarah Chen you investigated thoroughly and found nothing suspicious. The police were right—tragic suicide of a troubled man. File your report, take your fee from Sarah, and take this as a bonus."

* [Look at the money]
    -> look_at_money
* [Refuse immediately]
    -> refuse_immediately
* [Ask what happens if you don't]
    -> ask_consequences

=== look_at_money ===
You look at the envelope. Fifty thousand dollars.

{sarah_trust >= 5: You think of Sarah's face, her trust in you.}
{morality >= 10: You think of David, dying alone, knowing someone was coming to kill him.}
{morality <= -10: You think of your bills, your struggling agency, your own survival.}

Webb watches you like a hawk watching prey.

"That's rent for a year. New car. Investment in your business. Or..." he leans in, "maybe it's help for your own demons. We all have them."

{morality < 0: He's not wrong. The money would solve problems. And David's dead anyway—nothing brings him back.}

-> final_choice

=== refuse_immediately ===
~ morality += 15
"No."

The word is final.

Webb's expression hardens. "Don't be a fool."

"David Chen deserves justice. His sister deserves the truth. And you deserve prison."

-> webb_threatens

=== ask_consequences ===
"And if I don't take your money?"

Webb's friendly demeanor evaporates like morning fog.

"Then you make very powerful enemies. I have friends. Lawyers who will bury you in litigation. Police connections who will ensure any evidence you present is... questionable."

He leans forward.

"More importantly, what do you really accomplish? My firm closes, two hundred people lose their jobs in this economy. David's mother loses his pension—did you know his life insurance won't pay out for suicide? Sarah struggles alone."

"You'll destroy innocent people chasing a ghost."

-> final_choice

=== final_choice ===
The envelope sits between you. Fifty thousand dollars.

Webb waits.

This is it. The choice.

* [Take the money]
    -> take_bribe
* [Refuse - expose the truth]
    -> refuse_bribe
* [Negotiate a middle ground]
    -> negotiate_gray

=== take_bribe ===
~ morality -= 25
~ final_choice_made = true
~ sarah_trust = 0

Your hand reaches for the envelope.

It's heavier than you expected. Or maybe that's just your conscience.

"Smart choice," Webb says, relaxing. "David's death stays a suicide. You investigated thoroughly—found some evidence of work stress, but nothing criminal. Case closed."

"Just like that?"

"Just like that." Webb opens the door. "You can keep whatever Sarah's paying you. I'm a generous man."

You step out of the car, envelope in hand.

Webb rolls down the window. "One more thing. If you ever reconsider this arrangement... accidents happen. To everyone. Understand?"

It's not a question.

-> bribe_ending

=== refuse_bribe ===
~ morality += 20
~ final_choice_made = true

"No."

You push the envelope back toward Webb.

"David Chen was murdered. You killed him to cover up your crimes. And I'm going to prove it."

Webb's face goes cold. Really cold. The friendly businessman vanishes, replaced by something predatory.

"You're making a serious mistake."

"I've made them before."

-> refuse_ending

=== negotiate_gray ===
~ morality += 5
~ final_choice_made = true

"I have a counter-offer," you say.

Webb raises an eyebrow.

"I don't care about the embezzlement. Not really. Turn yourself in for that—make a deal, pay restitution, serve some time. White-collar crime, minimum security. You'll survive."

"David's death stays officially a suicide—there's not enough evidence to prove murder anyway. But I tell Sarah the truth privately. She deserves to know her brother was killed, even if we can't prove it in court."

Webb considers this.

-> gray_ending

=== bribe_ending ===
You leave the garage with fifty thousand dollars and a stain on your soul.

The money will help. The money will definitely help.

But that night, when you meet Sarah to deliver your "findings," and you lie to her face, tell her the police were right...

The way her face crumples.

The way she thanks you anyway, voice hollow.

You're not sure fifty thousand is enough.

The money spends the same as any other money, though.

And Webb does call you again. Six months later. Another "opportunity."

You take that one too.

It gets easier.

That's the worst part.

-> END

=== refuse_ending ===
You go to the police with everything.

The evidence is strong but not perfect. Webb's lawyers fight every step. The trial takes eighteen months.

The embezzlement charges stick. Webb gets ten years, will serve six.

The murder charge? Doesn't. Circumstantial evidence, clever defense. The jury can't convict beyond reasonable doubt.

David Chen's death remains officially a suicide.

But Sarah knows the truth. You told her everything. Showed her every piece of evidence.

She testified. She fought.

And when Webb is led away in handcuffs for the embezzlement, she squeezes your hand.

"Thank you," she whispers. "For not giving up on him."

It's not perfect justice. It's messy. It's complicated.

But you sleep at night.

-> END

=== gray_ending ===
Webb agrees to turn himself in for embezzlement.

He serves four years in minimum security. Pays restitution. The firm restructures; some people lose jobs, but it doesn't collapse.

David's death officially remains a suicide.

But you tell Sarah everything. Show her the evidence. Explain that you can't prove murder in court, but you know what happened.

She cries. She's angry that Webb won't face murder charges.

But she knows her brother died trying to do the right thing. That he was murdered, not suicidal.

That he fought.

It's not perfect justice. But it's something.

Some nights you wonder if you took the easy way out.

Other nights you think you did the best you could in a broken system.

The truth is probably somewhere in between.

-> END

=== webb_threatens ===
"If you pursue this," Webb says, voice ice, "I will destroy you. I have lawyers, resources, connections. You're a struggling PI with a shady past. Who do you think people will believe?"

"I'll take my chances."

"Then we're done here." Webb gets back in the car. Before closing the door: "One more thing. Sarah Chen's mother is in St. Mary's care facility, yes? I know the board. Such a shame if they had to raise their rates..."

The door slams. The car drives away.

He just threatened an old woman with Alzheimer's.

You grip your phone.

Time to end this.

-> refuse_ending

-> END

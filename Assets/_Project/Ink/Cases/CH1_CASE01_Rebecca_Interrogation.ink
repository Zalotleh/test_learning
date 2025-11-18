// The Last Call - Rebecca Martinez Interrogation
// Location: Accounting Firm - Rebecca's Cubicle

VAR morality = 0
VAR rebecca_trust = 0
VAR knows_about_embezzlement = false
VAR warned_rebecca = false
VAR rebecca_warned_you = false
VAR has_sticky_note = false

=== start ===
You approach Rebecca Martinez's cubicle. She's hunched over her desk, stress evident in her posture. When she notices you, her eyes widen.

"Can I help you?" Her voice is defensive, almost sharp.

* [Introduce yourself politely]
    -> introduce_polite
* [Show PI credentials]
    -> show_credentials
* [Mention David Chen]
    -> mention_david_direct

=== introduce_polite ===
~ rebecca_trust += 1
"My name is {player_name}. I'm a private investigator. I was hoping I could ask you a few questions."

Rebecca's shoulders tense. "About what?"

* [About David Chen]
    -> mention_david
* [About the firm]
    -> ask_about_firm
* [About you]
    -> ask_about_her

=== show_credentials ===
You flash your PI license. Rebecca barely glances at it.

"Private investigator. Great." She sounds exhausted, not impressed. "Let me guess - someone hired you to dig into their ex, or a cheating spouse, or—"

* [I'm here about David Chen]
    -> mention_david
* [This is about the firm]
    -> ask_about_firm

=== mention_david_direct ===
~ rebecca_trust -= 1
"I'm investigating David Chen's death."

Rebecca goes very still. Then her jaw tightens.

"David's death was ruled a suicide. Why are you bothering his coworkers?"

* [His sister doesn't believe it was suicide]
    -> sister_doesnt_believe
* [I have questions about his work here]
    -> questions_about_work
* [You argued with him before he died]
    -> confrontational_accusation

=== mention_david ===
"I'm investigating David Chen's death."

Rebecca's expression shifts - surprise, then something else. Guilt? Fear?

"David..." she says quietly. "I heard about that. It's awful."

{rebecca_trust >= 1: Her voice sounds genuine.}
{rebecca_trust < 1: She won't meet your eyes.}

-> sister_doesnt_believe

=== ask_about_firm ===
"I'm looking into some financial irregularities at the firm."

Rebecca's eyes flash with alarm. "What kind of irregularities?"

* [Just routine questions]
    "Just routine questions. Do you work with the accounts?"
    -> general_questions
* [Embezzlement]
    {knows_about_embezzlement} "Embezzlement. Specifically, client account transfers."
    -> confront_embezzlement
* [Actually, I'm here about David Chen]
    -> mention_david

=== ask_about_her ===
"I wanted to ask about your role here. What do you do?"

Rebecca relaxes slightly - this is safer ground.

"Junior accountant. I manage smaller client portfolios, mostly individuals and small businesses. I've been here three years."

"And you worked with David Chen?"

Her guard goes back up. "Sometimes. Why?"

-> mention_david

=== sister_doesnt_believe ===
"David's sister hired me. She doesn't believe he would take his own life."

Rebecca's expression softens for a moment. "Sarah. She came by here last week. She was..." Rebecca shakes her head. "She's in denial."

* [You think it was suicide?]
    -> ask_if_suicide
* [Did David seem suicidal to you?]
    -> ask_davids_state
* [Tell me about your relationship with David]
    -> ask_relationship

=== questions_about_work ===
"I have questions about David's work here. His state of mind in the weeks before he died."

Rebecca nods slowly. "Okay. What do you want to know?"

-> general_questions

=== confrontational_accusation ===
~ rebecca_trust -= 3
~ morality -= 2
"I know you argued with David multiple times in the weeks before his death. What were you fighting about?"

Rebecca stands up, face flushing. "Excuse me?"

"People heard you. In the break room. Raised voices."

"That's..." She struggles for words. "That's none of your business. And it wasn't what you think."

* [Then explain it]
    -> demand_explanation
* [Soften approach]
    ~ rebecca_trust += 1
    "I'm sorry. I'm just trying to understand what happened to David."
    -> sister_doesnt_believe
* [Press harder]
    ~ rebecca_trust -= 2
    ~ morality -= 3
    "I can ask others what the fights were about. Or you can tell me now."
    -> press_harder

=== ask_if_suicide ===
"You think David killed himself?"

Rebecca hesitates. "The police said... there were pills, a note..."

"There wasn't a note," you correct her. "Where did you hear that?"

"I..." She falters. "Mr. Webb told us. He said the police found a note."

{knows_about_embezzlement: Interesting. Webb lied to his employees.}

-> ask_davids_state

=== ask_davids_state ===
"Did David seem suicidal to you? Depressed? Hopeless?"

Rebecca considers this. "He seemed stressed. Really stressed, actually. The last month or so, he was working late, coming in early. He looked exhausted."

"Stressed about what?"

Rebecca glances around nervously. "He said it was personal. Family stuff."

* [Was it really family stuff?]
    -> probe_stress
* [Or was it work-related?]
    -> probe_work_stress
* [Tell me about the arguments you had]
    -> ask_arguments

=== ask_relationship ===
"How well did you know David?"

"We were colleagues. We had lunch sometimes, talked about work stuff. He was nice. Brilliant with numbers, really meticulous." Rebecca's voice cracks slightly. "I can't believe he's gone."

* [You argued with him]
    -> ask_arguments
* [Did you socialize outside work?]
    -> ask_outside_work
* [What was he working on before he died?]
    -> ask_what_working_on

=== general_questions ===
"When did you last see David?"

"The day before... before it happened. Friday. He left early, around 4 PM. Said he wasn't feeling well."

"And his behavior that day?"

Rebecca thinks. "Tense. But he'd been tense for weeks."

-> ask_davids_state

=== demand_explanation ===
~ rebecca_trust -= 1
"Then explain it. What were the arguments about?"

Rebecca crosses her arms. "David kept asking me weird questions. About my client accounts, my transaction logs. He implied I was doing something wrong."

"Were you?"

"No!" Her voice rises, then drops. "I run clean books. Always have. But someone was accessing my accounts without permission. I thought David was accusing me."

~ rebecca_trust += 2
// She's telling the truth

* [Who was accessing your accounts?]
    -> who_accessing
* [Did you report this?]
    -> did_report
* [David wasn't accusing you]
    {knows_about_embezzlement} -> reveal_truth

=== press_harder ===
"I'm investigating a possible homicide, Ms. Martinez. Refusing to cooperate makes you look guilty."

Rebecca's eyes widen. "Homicide? What? No. I didn't... David killed himself!"

"Did he? Or did someone make it look that way?"

Rebecca sinks into her chair, face pale. "You think someone killed David?"

* [I think it's possible]
    -> possible_murder
* [I think someone wanted him quiet]
    {knows_about_embezzlement} -> reveal_webb_scheme
* [I'm not sure yet]
    -> not_sure_yet

=== probe_stress ===
"Was it really family stuff?"

Rebecca shrugs. "That's what he said. His mother's medical bills, I think. He mentioned helping his sister with payments."

{has_sticky_note: This matches what Sarah told you.}

"But?" you press.

Rebecca lowers her voice. "But sometimes I'd see him looking at spreadsheets that weren't his accounts. Like he was... auditing something?"

~ rebecca_trust += 1
// Good information

-> probe_work_stress

=== probe_work_stress ===
"Could it have been work-related stress? Problems with clients or accounts?"

Rebecca bites her lip. "Maybe. He started asking me strange questions about account procedures. Transfer protocols. Like he was looking for something specific."

* [What kind of questions?]
    -> what_kind_questions
* [Did you tell anyone about this?]
    -> tell_anyone
* [What do you think he was looking for?]
    -> what_looking_for

=== ask_arguments ===
"Multiple people heard you arguing with David. What were those arguments about?"

Rebecca's jaw tightens. "David was..." She stops, starts again. "About a month ago, David started asking me questions about my accounts. My client portfolios. He wanted to see transaction logs, transfer records."

"Why?"

"He wouldn't say. But he seemed suspicious, like he thought I was doing something wrong. I got defensive. We argued."

* [Were you doing something wrong?]
    ~ rebecca_trust -= 1
    -> were_you_wrong
* [Or was someone else accessing your accounts?]
    -> someone_else_accessing
* [Maybe David was trying to protect you]
    {knows_about_embezzlement} -> david_protecting

=== ask_outside_work ===
"Did you see David outside of work?"

"No. We were friendly at work, but that's it. Different circles."

-> ask_what_working_on

=== ask_what_working_on ===
"What was David working on in the weeks before he died?"

Rebecca shrugs. "His usual client accounts. Corporate portfolios mostly. He handled the big clients."

"Did he mention any problems?"

"Not to me. But..." She hesitates.

"But?"

"Mr. Webb called David into his office a lot those last few weeks. Closed door meetings."

{knows_about_embezzlement: Webb was keeping tabs on David.}

-> ask_webb_meetings

=== who_accessing ===
"Who was accessing your accounts without permission?"

"I don't know. I reported it to IT, but they said there was no unauthorized access in the logs. But I know someone was in there. Transactions I didn't make, files opened when I wasn't logged in."

* [Did you suspect anyone?]
    -> suspect_anyone
* [Did you tell David your suspicions?]
    -> tell_david_suspicions
* [This sounds like embezzlement]
    {knows_about_embezzlement} -> confront_embezzlement

=== did_report ===
"Did you report the unauthorized access?"

"Yes! To IT, to Mr. Webb. They said they'd look into it but..." She shrugs helplessly. "Nothing came of it. They said I probably just forgot logging those transactions."

"But you didn't."

"I KNOW I didn't. I'm meticulous with records."

~ rebecca_trust += 1

-> who_accessing

=== reveal_truth ===
~ knows_about_embezzlement = true
~ rebecca_trust += 3
~ morality += 8

"David wasn't accusing you, Rebecca. He was trying to warn you."

Rebecca stares. "Warn me about what?"

"Someone has been using your accounts to embezzle client funds. David discovered it. He was gathering evidence."

Rebecca goes pale. "What? Who?"

* [Marcus Webb]
    -> reveal_webb
* [I can't say yet]
    -> cant_say_yet
* [You're being set up as the fall guy]
    -> reveal_scapegoat

=== possible_murder ===
"David may have discovered something. Something that got him killed."

Rebecca wraps her arms around herself. "This is insane. You're saying someone at this firm...?"

"I'm saying it's possible."

-> ask_what_david_knew

=== reveal_webb_scheme ===
~ knows_about_embezzlement = true
~ rebecca_trust += 4
~ morality += 10

"I think David discovered embezzlement. I think he was killed to keep him quiet."

Rebecca's hand goes to her mouth. "Oh my God."

"The embezzler was using your accounts, Rebecca. Framing you."

"Who?" Her voice is barely a whisper.

-> reveal_webb

=== not_sure_yet ===
"I don't have enough evidence yet. But I know David was investigating something at this firm."

Rebecca nods slowly. "I'll help. Whatever you need."

~ rebecca_trust += 2
-> ask_what_david_knew

=== what_kind_questions ===
"What specific questions did he ask?"

"He wanted to know about transfer authorization protocols. Who could move money between accounts. Who had access to override transaction alerts. It was really specific, like he was trying to trace a particular pattern."

~ rebecca_trust += 2
// Very useful information

* [Did anyone else ask those questions?]
    -> anyone_else
* [What did you tell him?]
    -> what_told_him
* [That sounds like he was investigating embezzlement]
    {knows_about_embezzlement} -> confront_embezzlement

=== tell_anyone ===
"Did you tell anyone David was asking these questions?"

"Mr. Webb. I thought I should let him know one of his senior accountants was... I don't know, acting strange."

{knows_about_embezzlement: This was a mistake. She tipped off Webb.}

"How did Webb react?"

"He thanked me. Said he'd talk to David about it. That was maybe two weeks before..." She doesn't finish.

~ rebecca_trust += 1

-> what_looking_for

=== what_looking_for ===
"What do you think David was looking for?"

Rebecca considers. "Honestly? I think he found something. Some kind of financial irregularity. And I think it scared him."

"Why do you say that?"

"Because the last time I saw him, he said something weird. He said 'Rebecca, if anything happens to me, check your transaction histories. Someone's been using your accounts.'"

~ rebecca_trust += 3
~ rebecca_warned_you = true
// CRITICAL INFORMATION

* [Did you check your histories?]
    -> did_check
* [What did you think he meant?]
    -> what_meant
* [Have you told anyone else this?]
    -> told_anyone_else

=== were_you_wrong ===
"Were you doing something wrong with the accounts?"

Rebecca's face hardens. "No. I told you, I run clean books. Always."

"Then why was David suspicious?"

"Because someone WAS using my accounts! Just not me!"

-> someone_else_accessing

=== someone_else_accessing ===
~ rebecca_trust += 2
"So someone else was accessing your accounts and making it look like you?"

"Yes! That's what I kept trying to tell everyone!"

"Who would do that?"

Rebecca shakes her head. "I don't know. Someone with high-level access. Someone who knows the system well enough to hide their tracks."

* [Someone like Marcus Webb]
    {knows_about_embezzlement} -> reveal_webb
* [Did David figure out who it was?]
    -> david_figure_out
* [You're being used as a scapegoat]
    -> reveal_scapegoat

=== david_protecting ===
~ rebecca_trust += 4
~ morality += 5
"Maybe David was trying to protect you. He discovered someone was using your accounts for embezzlement. He was gathering evidence to clear your name."

Rebecca's eyes fill with tears. "What? No. He never said..."

"He was probably trying not to scare you. Or maybe he wasn't sure yet."

"So all those questions, the arguments... he was trying to help me?"

"I think so. Yes."

Rebecca sits down heavily. "And now he's dead."

-> ask_what_david_knew

=== suspect_anyone ===
"Did you suspect anyone specifically?"

Rebecca hesitates. "This sounds paranoid, but... Mr. Webb. He's the only one with administrative access to all accounts. And when I reported the issues, he seemed more interested in shutting me up than investigating."

~ rebecca_trust += 3
{knows_about_embezzlement: She's putting it together.}

* [Tell me more about Webb]
    -> tell_about_webb
* [Has he been acting strangely?]
    -> webb_acting_strange
* [I think you're right to suspect him]
    {knows_about_embezzlement} -> reveal_webb

=== tell_david_suspicions ===
"Did you tell David you suspected someone?"

"No. I thought he was accusing ME. We weren't exactly having friendly conversations."

Rebecca looks pained. "I should have listened to him. I should have..."

* [It's not your fault]
    ~ rebecca_trust += 1
    "It's not your fault, Rebecca. You didn't know."
    -> comfort_rebecca
* [What happened to David?]
    -> what_happened_david
* [Now you can help]
    -> help_now

=== confront_embezzlement ===
~ knows_about_embezzlement = true
"This isn't just unauthorized access, Rebecca. This is embezzlement. Someone's been siphoning money from client accounts using your credentials."

Rebecca goes white. "How much?"

{has_evidence_amount: "Millions."}
{not has_evidence_amount: "I don't know exact figures yet. But significant amounts."}

"Oh God. I could go to prison for this."

* [Not if we prove it wasn't you]
    ~ rebecca_trust += 3
    -> prove_innocence
* [Unless you help me find who did it]
    ~ rebecca_trust += 1
    -> help_find_culprit
* [You're being framed]
    -> reveal_scapegoat

=== reveal_webb ===
~ warned_rebecca = true
~ rebecca_trust += 5
~ morality += 10
"Marcus Webb. He's been embezzling from client accounts for years. Using your credentials to hide his tracks."

Rebecca stares in disbelief. "Mr. Webb? But he's... he's a senior partner! He has his own money!"

"Apparently not enough."

"And David found out?"

"Yes. And I think Webb killed him for it."

Rebecca's hand goes to her mouth. "Oh my God. David. Poor David."

* [I need your help to prove it]
    -> need_help_prove
* [You need to be careful now]
    -> warn_danger
* [Will you testify?]
    -> ask_testify

=== cant_say_yet ===
~ rebecca_trust += 1
"I can't say yet. Not until I have solid proof. But I wanted you to know - you weren't imagining things. Someone really was using your accounts."

"Should I be worried?"

* [Just be careful]
    -> warn_be_careful
* [Act natural]
    -> act_natural
* [Yes, you're in danger]
    ~ morality += 3
    -> warn_danger

=== reveal_scapegoat ===
~ rebecca_trust += 4
"You're being set up, Rebecca. If this comes to light, all the evidence points to you. You're the scapegoat."

"But I didn't do anything!"

"I know. But someone powerful doesn't want to take the fall."

Rebecca's breathing quickens. "What do I do?"

* [Help me prove who really did it]
    -> help_find_culprit
* [Get a lawyer]
    -> get_lawyer
* [Don't do anything - act normal]
    -> act_natural

=== ask_what_david_knew ===
"Think carefully. Did David tell you anything specific? Any names, accounts, dates?"

Rebecca shakes her head. "Just that someone was using my accounts. And..." She pauses.

"And what?"

"He said 'Follow the money up, not down.' I didn't understand what he meant."

{knows_about_embezzlement: Webb has approval authority. Money trails would lead to him.}

~ rebecca_trust += 2

* [Did David keep records?]
    -> david_records
* [Did he back up files anywhere?]
    -> david_backups
* [Thank you, Rebecca]
    -> thank_rebecca

=== ask_webb_meetings ===
"Those closed door meetings with Webb - did David seem different after them?"

"Actually, yes. Angry. Scared. The last one, he came out looking pale. Wouldn't talk about it."

"When was the last meeting?"

"Maybe a week before he died?"

{knows_about_embezzlement: Webb was probably threatening him.}

-> ask_what_david_knew

=== did_check ===
"Did you check your transaction histories after David said that?"

"I tried. But my access was restricted the next day. System error, they said. IT was supposed to fix it but..." She gestures helplessly.

{knows_about_embezzlement: Webb cut off her access.}

* [Can you get access again?]
    -> get_access_again
* [That's not a coincidence]
    -> not_coincidence

=== what_meant ===
"What did you think he meant?"

"I thought he was paranoid. Or that he'd made a mistake in some transaction and was covering himself."

She looks ashamed. "I didn't take it seriously. And now he's dead."

-> did_check

=== told_anyone_else ===
"Have you told anyone else what David said?"

"No. Should I?"

* [No, keep it quiet for now]
    ~ rebecca_trust += 2
    "No. Not yet. It might put you in danger."
    -> warn_danger
* [Tell the police]
    "You should tell the police. This is evidence."
    -> tell_police
* [Tell HR or Webb]
    ~ morality -= 5
    "Report it to HR or Mr. Webb."
    -> tell_webb_bad

=== david_figure_out ===
"Did David figure out who was accessing your accounts?"

"If he did, he never told me." Rebecca looks pained. "We weren't on good terms those last weeks. Because of the arguments."

"Did he leave any files? Notes?"

"Not that I know of. But he kept a lot on his personal USB drive. Said he didn't trust the company servers."

~ rebecca_trust += 3
// USB drive mentioned!

* [Do you know where that USB drive is?]
    -> usb_location
* [Did anyone else know about the USB?]
    -> anyone_know_usb

=== tell_about_webb ===
"Tell me about Marcus Webb. What's he like?"

"Charming. Successful. Everyone loves him - clients, employees. He's the face of the firm."

"But?"

Rebecca hesitates. "But he's got a temper. I've seen it once or twice when things don't go his way. And he's... controlling. Wants to know everything happening in the firm."

* [Has he been acting differently lately?]
    -> webb_acting_strange
* [Do you think he's capable of murder?]
    -> webb_capable_murder

=== webb_acting_strange ===
"Has Webb been acting strangely lately?"

Rebecca considers. "Actually, yes. More stressed. Snapping at people. He fired his assistant last month for no reason."

"Around the same time David started investigating?"

"Yeah. Actually, yeah."

{knows_about_embezzlement: Webb knew David was onto him.}

-> webb_capable_murder

=== webb_capable_murder ===
"Do you think Webb is capable of murder?"

Rebecca's eyes widen. "I... I don't want to think so. But if someone threatened everything he's built? His reputation, his firm?"

She meets your eyes. "Maybe. Yeah. Maybe."

~ rebecca_trust += 3

-> ask_what_david_knew

=== comfort_rebecca ===
~ rebecca_trust += 2
"Rebecca, you couldn't have known. David was trying to protect you by not telling you everything."

"I just wish... I should have listened."

"You're listening now. And you can still help."

-> help_now

=== what_happened_david ===
"What do you think happened to David?"

Rebecca's voice drops. "I think he found something he wasn't supposed to find. And someone made sure he couldn't tell anyone."

"You think it was murder."

"I think..." She takes a breath. "Yes. I think someone killed David."

~ rebecca_trust += 3

-> help_now

=== help_now ===
"You can help now. Help me find out who did this."

Rebecca nods firmly. "Tell me what you need."

~ rebecca_trust += 4
// Rebecca is now an ally

-> plan_help

=== prove_innocence ===
~ rebecca_trust += 3
"We'll prove it wasn't you. But I need your help."

"Anything. What do you need?"

-> plan_help

=== help_find_culprit ===
~ rebecca_trust += 2
"Help me find who really did this. Together, we can prove your innocence and get justice for David."

Rebecca nods. "Okay. How?"

-> plan_help

=== need_help_prove ===
"I need your help to prove it. Webb is powerful. He has lawyers, connections. We need solid evidence."

Rebecca straightens. "What can I do?"

-> plan_help

=== warn_danger ===
~ morality += 5
"Rebecca, you need to be very careful now. If Webb knows you're suspicious, he might..."

"Might kill me too?"

You don't answer. You don't need to.

Rebecca pales. "What should I do?"

* [Act normal, don't confront anyone]
    -> act_natural
* [Get out of town]
    ~ rebecca_trust += 2
    "Take some vacation days. Get out of town until this is resolved."
    -> leave_town
* [I'll make sure you're safe]
    ~ rebecca_trust += 3
    ~ morality += 3
    "I'll make sure you're safe. Trust me."
    -> promise_safety

=== ask_testify ===
"When this goes to trial, will you testify? About the unauthorized access, David's warnings, all of it?"

Rebecca hesitates, then nods. "Yes. For David. He tried to help me. The least I can do is help him get justice."

~ rebecca_trust += 5
// Strong ally gained

-> plan_help

=== warn_be_careful ===
"Just be careful. Don't let anyone know you've talked to me."

"Okay."

-> ending

=== act_natural ===
"Act normal. Don't let anyone know you suspect anything. And don't confront Webb."

Rebecca nods. "How long?"

"A few days. Maybe a week. I'm close to having enough evidence."

-> ending

=== get_lawyer ===
~ morality += 3
"Get a lawyer. A good one. Someone who specializes in white-collar crime. Do it quietly."

"That's expensive."

"Cheaper than prison."

Rebecca nods grimly. "You're right."

-> ending

=== tell_police ===
~ morality += 5
"Tell the police what David said. Ask them to reopen the investigation."

"Will they believe me?"

"Maybe. Maybe not. But it's on record then."

-> ending

=== tell_webb_bad ===
~ rebecca_trust -= 5
~ morality -= 10
"Report it to HR. Or better yet, talk to Mr. Webb directly. I'm sure he'll want to know."

{knows_about_embezzlement: This is a terrible idea. You just put Rebecca in Webb's crosshairs.}

Rebecca looks uncertain. "You think so?"

"Sure. He'll appreciate your honesty."

-> ending

=== get_access_again ===
"Can you get access to those transaction histories again?"

"Maybe. If I go through IT. But it might raise red flags."

"Be careful. But if you can get them without drawing attention, do it."

~ rebecca_trust += 2

-> not_coincidence

=== not_coincidence ===
"That's not a coincidence, Rebecca. Someone cut off your access right after David warned you."

"You think they knew? That he told me?"

"Maybe. Or they were being cautious."

-> ask_what_david_knew

=== usb_location ===
"Do you know where David's USB drive is?"

"No. Maybe at his apartment? Or he might have hidden it somewhere here at work."

"Where would he hide it?"

"His desk was cleaned out. But maybe his locker? Or the file room?"

~ rebecca_trust += 1

-> anyone_know_usb

=== anyone_know_usb ===
"Did anyone else know about the USB drive?"

"I don't think so. He was pretty secretive about it."

-> plan_help

=== plan_help ===
"Here's what I need from you..."

* [Access to firm records]
    -> access_records
* [Information about Webb]
    -> info_webb
* [Testimony when the time comes]
    -> testimony

=== access_records ===
"Can you get me access to firm financial records? Transaction logs, transfer authorizations?"

Rebecca bites her lip. "That's risky. Webb watches the system like a hawk."

"Can you do it?"

"Maybe. I'd need to be careful. Use a coworker's login or something."

* [Do it]
    ~ morality -= 2
    "Do whatever you need to. We need that evidence."
    -> records_yes
* [Only if it's safe]
    ~ morality += 2
    "Only if you can do it safely. Don't take unnecessary risks."
    -> records_safe
* [Never mind, too dangerous]
    ~ rebecca_trust += 2
    "Never mind. It's too dangerous."
    -> info_webb

=== info_webb ===
"Tell me everything you know about Webb. His schedule, habits, where he keeps files."

Rebecca nods. "He usually comes in around 8 AM, leaves around 6. But he works late on Tuesdays and Thursdays."

"Office security?"

"Keycard access after hours. But his office has a separate lock."

~ rebecca_trust += 2

-> testimony

=== testimony ===
"When the time comes, I'll need you to testify. About the unauthorized access, about what David told you, all of it."

"I'll do it," Rebecca says firmly. "For David."

~ rebecca_trust += 4

-> ending

=== records_yes ===
"Okay. I'll try. Give me a day or two."

~ rebecca_trust += 1

-> testimony

=== records_safe ===
"I'll be careful. If I can get it without risk, I will."

~ rebecca_trust += 3

-> testimony

=== leave_town ===
"That might be smart. Can you do that?"

"I have family in Oregon. I could visit for a week or two."

"Do it. Tonight if possible."

Rebecca nods. "Okay. And... thank you. For believing me."

~ rebecca_trust += 4

-> ending

=== promise_safety ===
"I promise I'll keep you safe, Rebecca. You have my word."

Rebecca searches your face, then nods. "Okay. I trust you."

~ rebecca_trust += 5

-> ending

=== thank_rebecca ===
"Thank you, Rebecca. You've been very helpful."

"Just... find who did this. For David."

"I will."

-> ending

=== ending ===
{rebecca_trust >= 5: Rebecca stands, offering her hand. "Be careful. And let me know if you need anything else."}
{rebecca_trust < 5 and rebecca_trust >= 0: "Good luck with your investigation," Rebecca says neutrally.}
{rebecca_trust < 0: Rebecca turns back to her computer, clearly done with this conversation.}

{warned_rebecca: She knows the truth now. She's scared, but she's an ally.}
{rebecca_trust >= 5: Rebecca Martinez is now a strong ally.}

-> END

// The Last Call - Opening Scene
// Meeting Sarah Chen for the first time
// Location: Your Office

VAR morality = 0
VAR sarah_trust = 0
VAR case_accepted = false
VAR payment_agreed = 0  // 0 = none, 1 = reduced, 2 = standard, 3 = high

=== start ===
The door to your office creaks open. A young woman steps in, clutching a worn purse. Her eyes are red-rimmed, but she's trying to hold herself together.

"Are you... are you the investigator?" she asks, voice wavering.

* [Stand and offer a seat]
    -> offer_seat
* [Stay seated, gesture to chair]
    -> gesture_seat
* [Ask who's asking]
    -> who_asking

=== offer_seat ===
~ sarah_trust += 1
You stand, offering your hand. "I am. Please, have a seat."

She shakes your hand gratefully and sinks into the chair across from your desk.

-> introduce_herself

=== gesture_seat ===
You gesture to the chair. "Take a seat. What can I do for you?"

She sits, still clutching that purse like it's a lifeline.

-> introduce_herself

=== who_asking ===
~ sarah_trust -= 1
"Who's asking?" you say, not unkindly.

She hesitates, clearly uncomfortable. "I... I need help. Please."

* [Soften your approach]
    ~ sarah_trust += 1
    "Sorry. Sit down. Tell me what's wrong."
    -> introduce_herself
* [Stay firm]
    "I need a name before we go further."
    -> introduce_herself

=== introduce_herself ===
"My name is Sarah Chen," she says, voice steadier now. "My brother... David... he died three days ago."

She pauses, fighting tears.

"The police say it was suicide. Pills. But I know David. He wouldn't... he would never..."

* [Express sympathy]
    -> express_sympathy
* [Ask for details]
    -> ask_details
* [Ask about payment upfront]
    -> ask_payment_cold

=== express_sympathy ===
~ sarah_trust += 2
"I'm sorry for your loss," you say, and mean it.

Sarah nods, grateful. "Thank you. The police closed the case in forty-eight hours. They said he was depressed, had financial troubles. But they're wrong. David would have talked to me. He always talked to me."

-> explain_situation

=== ask_details ===
"Tell me what happened," you say, pulling out a notepad.

Sarah takes a breath. "Three nights ago, David was found in his apartment. Overdose of prescription sedatives. The police found empty bottles, a glass of water by his bed. They said it was open and shut."

"But you don't think so."

"I know so," she says firmly. "David hated taking medication. He barely took aspirin."

-> explain_situation

=== ask_payment_cold ===
~ sarah_trust -= 2
~ morality -= 2
"Before we go further, Ms. Chen, we need to discuss payment. I don't work for free."

She flinches slightly. "I... I don't have much money. I'm a teacher. But I have some savings, and I can—"

* [Interrupt - demand full fee]
    -> demand_full_fee
* [Let her finish]
    -> let_finish_payment

=== demand_full_fee ===
~ sarah_trust -= 3
~ morality -= 5
"My standard rate is $5,000 upfront, plus expenses. That's non-negotiable."

Sarah's face falls. "I... I can do that. It's my savings for my mother's medical bills, but I can—"

* [Insist on payment]
    ~ payment_agreed = 3
    ~ morality -= 3
    "That's the rate. If you want my help, that's what it costs."
    Sarah nods slowly, defeated. "Okay. I'll bring the money tomorrow."
    -> case_details_short
* [Relent slightly]
    ~ morality += 2
    "Look, we can work out a payment plan. Tell me about your brother."
    -> explain_situation

=== let_finish_payment ===
"Go on," you say.

"I have about $2,000 saved. I know it's not much for this kind of work, but I'll pay you everything I have. I just need to know the truth."

* [Accept what she can pay]
    -> accept_low_payment
* [Suggest standard fee]
    -> suggest_standard
* [Try to negotiate higher]
    -> negotiate_higher

=== accept_low_payment ===
~ sarah_trust += 5
~ morality += 8
~ payment_agreed = 1
~ case_accepted = true
"Two thousand is fine," you say. "I've seen enough grief to know when it's real. Tell me about David."

Sarah's face floods with relief and gratitude. "Thank you. Thank you so much."

-> explain_situation

=== suggest_standard ===
~ payment_agreed = 2
~ case_accepted = true
"My standard rate for this kind of investigation is $3,000, plus expenses for forensics if needed. Does that work?"

Sarah nods quickly. "Yes. I can do that. I'll need a few days to pull it together, but yes."

-> explain_situation

=== negotiate_higher ===
~ sarah_trust -= 1
~ morality -= 3
~ payment_agreed = 3
"This kind of investigation usually runs $4,500. But if you can manage $3,500, I'll take the case."

Sarah winces but nods. "Okay. I'll make it work."

-> explain_situation

=== explain_situation ===
Sarah leans forward, animated now.

"David was an accountant at Chen & Associates. He'd been there for six years. He was good at his job—meticulous, careful. About two months ago, he started acting strange."

"Strange how?"

"Stressed. Distracted. He'd work late, come home exhausted. He mentioned 'problems at work' but wouldn't elaborate. Said he was handling it."

She pulls out her phone, shows you a photo. A young Asian man, warm smile, glasses.

"This is David. This was taken three weeks ago at our mother's birthday. Does he look suicidal to you?"

* [Look at the photo carefully]
    -> examine_photo
* [Ask about the work problems]
    -> ask_work_problems
* [Ask about family situation]
    -> ask_family

=== examine_photo ===
You study the photo. David Chen, arm around his sister, genuine smile. He looks tired, maybe, but not broken.

"No," you admit. "He doesn't."

Sarah nods firmly. "The police said he was in debt. That's true—he was helping pay for our mother's medical treatment. But he knew I was about to get a raise. We had a plan. He was hopeful about the future."

-> ask_next_question

=== ask_work_problems ===
"These work problems," you say. "Did he give you any details? Names? Anything specific?"

Sarah shakes her head. "He said it was 'complicated' and he didn't want to worry me. But two weeks ago, he said something strange. He said, 'If anything happens to me, check my computer. Password is Mom's birthday.'"

~ sarah_trust += 2
// This is a key piece of information

"Did you tell the police that?"

"Yes! But they said it was consistent with someone contemplating suicide. Planning ahead." Her voice breaks. "But that's not what it was. I know it."

-> ask_next_question

=== ask_family ===
"Tell me about your family. Your mother—you mentioned medical treatment?"

Sarah nods. "Our mother has early-onset Alzheimer's. She's in a care facility. It's expensive. David and I split the costs, but it's... it's hard."

"The police said that's why he was depressed. Financial pressure. But we were managing! And David wouldn't leave mom like that. He wouldn't leave me to handle it alone."

-> ask_next_question

=== ask_next_question ===
* [Ask about the police investigation]
    -> ask_police
* [Ask if you can see David's apartment]
    -> ask_apartment
* [Ask about David's relationships]
    -> ask_relationships

=== ask_police ===
"What did the police tell you exactly?"

"Detective Kwan was the investigating officer. She was... kind, but dismissive. Said they found empty prescription bottles—Ambien and Xanax—by his bed. No signs of forced entry. No signs of struggle. Straightforward suicide."

Sarah's hands clench. "But David was neat. Obsessively neat. And when I went to his apartment after... there was a tea cup in the dish rack. Washed."

"That's significant?"

"David never washed his dishes right away. He'd let them pile up until the weekend. Someone else washed that cup. I know it."

~ sarah_trust += 1
// Another good detail

-> ask_next_question

=== ask_apartment ===
"I'll need to see David's apartment. The crime scene."

Sarah nods eagerly. "The police released it yesterday. I have his key." She pulls out a keychain, small apartment key attached to a tiny puzzle piece charm.

"I haven't been able to go in. I tried, but I just... I can't. Will you?"

* [Take the key gently]
    ~ sarah_trust += 1
    "I'll go today. And Sarah—I'll find the truth. Whatever it is."
    -> promise_truth
* [Take the key professionally]
    "I'll examine it thoroughly."
    -> promise_professional

=== ask_relationships ===
"Did David have a girlfriend? Boyfriend? Close friends?"

"No romantic relationships. He dated someone a year ago but it didn't work out. He had friends from work—Rebecca Martinez, they had lunch sometimes. And there was his boss, Marcus Webb. David respected him. Or... used to."

"Used to?"

"About a month ago, David stopped mentioning Webb. When I asked, he'd change the subject."

-> ask_next_question

=== promise_truth ===
Sarah meets your eyes. "Even if it was suicide? Even if I'm wrong?"

* [Promise complete honesty]
    ~ sarah_trust += 3
    ~ morality += 5
    ~ case_accepted = true
    "Even if you're wrong. You deserve the truth, whatever it is. I'll find it."
    Sarah nods, tears finally spilling over. "Thank you."
    -> accept_case
* [Promise carefully]
    ~ case_accepted = true
    "I'll find what the evidence shows. That's all I can promise."
    "That's enough," Sarah says.
    -> accept_case

=== promise_professional ===
~ case_accepted = true
"I'll be thorough. If there's something the police missed, I'll find it."

Sarah nods. "That's all I ask."

-> accept_case

=== case_details_short ===
// Shortened path if player was mercenary about payment
Sarah gives you the basic details quickly, all business now.

~ case_accepted = true
-> accept_case

=== accept_case ===
{payment_agreed == 1: You've agreed to take $2,000 for the case.}
{payment_agreed == 2: You've agreed to your standard $3,000 fee.}
{payment_agreed == 3: You've negotiated $3,500 or more.}

Sarah hands you a folder. "This is everything I have. The police report, David's address, his work information. There's also..."

She hesitates, then pulls out her phone.

"There's an email from David. Sent the night he died. I haven't opened it yet. I've been too scared."

* [Open it together]
    -> open_email_together
* [Suggest she opens it alone]
    -> open_email_alone
* [Ask her to forward it to you]
    -> open_email_forward

=== open_email_together ===
~ sarah_trust += 3
"Open it. I'm here."

Sarah's hands shake as she taps her phone. The email loads.

**Subject: If you're reading this**

*Sarah, if you're reading this, something's happened to me. I'm in danger. I discovered something at work—something bad. I've encrypted the evidence. It's on a USB drive hidden behind my complete Sherlock Holmes collection.*

*The password is our favorite story: HOUN*

*I'm sorry I got you involved. I tried to handle it alone. Go to the police. Show them this.*

*I love you. Protect Mom.*

*—David*

Sarah's reading through tears. "He knew. He knew someone was going to..."

~ sarah_trust += 2
// Critical evidence obtained

-> email_aftermath

=== open_email_alone ===
"Maybe you should read it in private. Forward it to me when you're ready."

Sarah nods, looking relieved and disappointed at the same time.

-> case_summary

=== open_email_forward ===
"Forward it to me. I'll read it as part of the investigation."

"Okay," Sarah says hesitantly. "I will. Tonight."

-> case_summary

=== email_aftermath ===
"This changes everything," you say. "David knew he was in danger. This is evidence."

"Will the police reopen the case?"

* [Yes, definitely]
    ~ sarah_trust += 1
    "With this email? They'll have to."
    -> case_summary
* [Maybe, depends on evidence]
    "They might. Let me investigate first, build a stronger case."
    -> case_summary
* [No, do it ourselves]
    ~ morality -= 3
    "Police are slow. Let's figure this out ourselves first."
    -> case_summary

=== case_summary ===
Sarah stands, preparing to leave.

"I'll be at this number," she says, writing it down. "Call me anytime. Day or night. Please."

{sarah_trust > 5: She looks at you with hope and trust.}
{sarah_trust < 2: She looks uncertain, like she's not sure she made the right choice.}

"I'll find the truth, Sarah."

She nods and leaves.

You're left with David Chen's file, his apartment key, and a case that's starting to smell like murder.

-> END

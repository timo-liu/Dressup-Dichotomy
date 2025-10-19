extends Node

enum ClothingCategory {SHIRT, PANTS, SHOES, ACCESSORIES}

const CLOTHING_GROUPS = {
	ClothingCategory.SHIRT: "shirt",
	ClothingCategory.PANTS: "pants",
	ClothingCategory.SHOES: "shoes",
	ClothingCategory.ACCESSORIES: "accessories"
}

var on_body = []
var ending = false
var current_ending = ""

var dialogues = { 
	"Adrienne" : [["CHARACTER" , "Hiiii!!!!!"],
["PLAYER" , "Adrienne. Typically dressed in all black. Distressed by the way that people perceive her."],
["PLAYER" , "Adrienne, it's good to meet you."],
["PLAYER" , "I see from the request form you filled out that you're unhappy with the way that people perceive you based on how you dress."],
["CHARACTER" , "Yes, it's become quite a problem."],
["CHARACTER" , "You see, there's truly nothing I love more than talking to people! Hearing stories about their lives, getting to know them and their quirks…"],
["CHARACTER" , "But people never want to talk to me."],
["CHARACTER" , "It's one thing for people not to approach me first, but it's another to be completely ignored when I start a conversation!"],
["CHARACTER" , "I'm sure a lot of it has to do with my facial expressions, but that's something that I've found I can't control."],
["CHARACTER" , "So I thought, hey, why not work on something that I can control?"],
["PLAYER" , "Your style."],
["CHARACTER" , "Exactly!"],
["CHARACTER" , "I've been told that I look 'scary,' like I wanna be left alone all the time."],
["CHARACTER" , "That's not the case at all!!!!"],
["PLAYER" , "It's true, she's much more talkative than she looks."],
["PLAYER" , "I'm starting to see the problem…"],
["PLAYER" , "I have a few ideas in mind, but is there anything you'd like me to keep in mind while I put it all together?"],
["CHARACTER" , "It honestly took me a long time to be happy with my personal style."],
["CHARACTER" , "I'm willing to make changes to be more approachable,"],
["CHARACTER" , "But I want to keep the gothic aspects of my style."]],
	"Sonia" : [["CHARACTER" , "..."],
["PLAYER" , "Sonia. Typically dressed in basics and summer clothes. Distressed by the way that people perceive her."],
["PLAYER" , "Sonia, it's good to meet you."],
["CHARACTER" , "...good…me…too…."],
["PLAYER" , "Interesting…"],
["PLAYER" , "I see from the request form you filled out that you're unhappy with the way that people perceive you based on how you dress."],
["PLAYER" , "You dress quite brightly and conventionally. I can't imagine that people would avoid you."],
["CHARACTER" , "THAT'S EXACTLY THE PROBLEM!!"],
["PLAYER" , "?!"],
["CHARACTER" , "People always think that I''m some extroverted cheerleader, but I'm like PLEASE LEAVE ME ALONE!!"],
["CHARACTER" , "When normies start talking to me about anything other than my interests I feel like crawling away and dying in a ditch somewhere."],
["CHARACTER" , "I can't do it anymore!!!!!"],
["PLAYER" , "This is quite a unique problem you have…"],
["CHARACTER" , "None of my fellow nerds know that I'm one of them and I really don't care about anything normies have to talk about."],
["CHARACTER" , "All I care about is my beloved Yuya…"],
["PLAYER" , "..."],
["PLAYER" , "I'm starting to see the problem…"],
["PLAYER" , "I have a few ideas in mind, but is there anything you'd like me to keep in mind while I put it all together?"],
["CHARACTER" , "My style isn't something I pay attention to. I sorta just copy what I see people wear."],
["CHARACTER" , "You can change whatever you want, but please just keep it comfortable and maybe help me show off some of my favs…"]],
	"Astor" : [["CHARACTER" , "Hello!"],
["PLAYER" , "Astor. Typically dressed in sporty casual. Distressed by the way that people perceive him."],
["PLAYER" , "Astor, it's good to meet you."],
["PLAYER" , "I see from the request form you filled out that you're unhappy with the way that people perceive you based on how you dress."],
["CHARACTER" , "Yes, though I can't blame them for having the perception of me that they have,"], 
["CHARACTER" , "The dissonance between my person and my appearance is quite distressing. I imagine that it must be a surprise to others when they talk to me as well."],
["PLAYER" , "It's true, you're much more well-spoken than you appear."],
["CHARACTER" , "Haha, yes. This is often the impression I give others."],
["CHARACTER" , "Though I always dress in gym clothes, I'm not quite sure why everyone seems to think I'd be such a meathead."],
["PLAYER" , "I think I can see why…"],
["CHARACTER" , "In actuality, I study botany for a living and spend most of my time raising my three cats."],
["PLAYER" , "If that's the case, why the gym clothes?"],
["CHARACTER" , "Well, I do exercise quite often as well."],
["CHARACTER" , "I decided that my fashion might be a problem when a group of guys at the gym invited me over to watch a football game."],
["CHARACTER" , "To be honest, I had no idea what was going on."],
["CHARACTER" , "And to make matters worse, while I was there, I remembered that I had forgotten to water my plants that morning."],
["CHARACTER" , "I promptly burst into tears, much to everyone else's confusion…"],
["PLAYER" , "Ah…"],
["PLAYER" , "I'm starting to see the problem…"],
["PLAYER" , "I have a few ideas in mind, but is there anything you'd like me to keep in mind while I put it all together?"],
["CHARACTER" , "I know that I could very easily have a separate gym outfit, but I tend to decide to go to the gym quite spontaneously."],
["CHARACTER" , "Because of this, I'd like to request that the outfit stay breathable and easy to move in."]]
,
	"PLAYER" : [["PLAYER", "My whole life, I've been interested in fashion."],
["PLAYER", "It's always been a way for me to express myself and show others who I am without saying a word."],
["PLAYER" , "But I realized that, sometimes, people's appearances contradict their inner selves."],
["PLAYER" , "This incongruence between outer appearance and inner personality is the cause of distress for a lot of people."],
["PLAYER" , "And that's where I come in!"],
["PLAYER" , "As a style consultant, it's my job to help people dress in a way that makes them comfortable and represents them."],
["PLAYER" , "Today, I've got three clients."],
["PLAYER" , "Let me give it my best!"]],

}

var endings = {
	"SoniaPass" : [["CHARACTER" , "stylist does a good job. got to go on a 20 minute rant about my beloved yuya because the shirt they got me caught the attention of another megafan LOL!! normies r afraid to talk to me which is a total win. seeing my outfit in the mirror makes me rly happy too :3 thx!! 5/5"]],
	"soniaFail" : [["CHARACTER" , "cute clothes i guess…but not really for me. was hoping that a style change would help me meet more fans of my interests but nope…it's still just normies. good for if u just want new cute clothes. 3/5"]]

}

var current_char : String = "Adrienne"

func switch_to_dressup():
	get_tree().change_scene_to_file("res://dressup/dressup.tscn")

func switch_to_cutscene(character : String):
	current_char = character
	get_tree().change_scene_to_file("res://dressup/cutscene.tscn")

func switch_to_select():
	get_tree().change_scene_to_file("res://dressup/select_character.tscn")
	
func grade():
	for c in on_body:
		if not c.correct:
			switch_to_ending(false)
			
func switch_to_ending(success : bool):
	if not success:
		current_ending = current_char + "Fail"
	else:
		current_ending = current_char + "Pass"
	get_tree().change_scene_to_file("res://dressup/dressup.tscn")
		

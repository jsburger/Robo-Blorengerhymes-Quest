/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcFishTalk

on_talked_to = function() {
    say_line(self, ["Globbletops? Nope! Haven't seen any.", "Been having a lot of fun at the Rec Center, though!", "One time I spent so much time on the treadmill, I thought I saw a giant foot!"])
}
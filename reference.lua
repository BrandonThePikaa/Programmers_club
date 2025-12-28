// stucture
function _init()
	-- runs once at startup
end

function _update()
	-- runs every frame (30 / sec)
end

function _draw()
	-- runs every frame, aft update
end

-- this is a comment
// this is also a comment
// don't overuse comments, 
// but they can be nice for 
// readablity of code!

// vars
x = 64
y = 64
speed = 2
score = 0
// can change and typically do
// change during runtime


// numbers and math!!
score = score + 1
y = y - speed
angle = angle + 0.1

// useful math functions
abs(n) -- absolute value
sqrt(n) -- square root
sin(a)
cos(a)
rnd(n) -- round
flr(n) -- floor

// conditionals

if x > 100 then 
	x = 100
end

if score >= 10 then
	win = true
else
	win = false
end

// butons || input
btn(0) -- left  | a
btn(1) -- right | d
btn(2) -- up				| w
btn(3) -- down  | s
btn(4) -- x
btn(5) -- o

if btn(0) then x -= speed end
if btn(1) then x += speed end
if btn(2) then y -= speed end
if btn(3) then y += speed end

// draw!
cls() -- clears the screen

rect(x1,y1,x2,y2,color)
rectfill(x1,y1,x2,y2,color)
circ(x1,y1,x2,y2,color)
circfill(x1,y1,x2,y2,color)

print("hello", x, y, color)

spr(m, x, y) --where n is spite#

// tables | lists | arrays

enemies = {}
add(enemies, {x=10, y=10})

for e in all(enemies) do
	e.y += 1
end








-- MEETING 1
x = 64
y = 64
speed = 2

function _update()
	if btn(0) then x -= speed end
	if btn(1) then x += speed end
	if btn(2) then y -= speed end
	if btn(3) then y += speed end
end

function _draw()
	cls()
	rectfill(x, y, x+7, y+7, 7)
end

-- MEETING 2
px = 64
py = 64
cx = 40
cy = 40
score = 0
speed = 2

function collide()	-- hard coded way of implementation
	return px < cx+8 and px+8 > cx
	 and py < cy+8 and py+8 > cy
end

function _update()
	if btn(0) then px -= speed end 
	if btn(1) then px += speed end
	if btn(2) then py -= speed end
	if btn(3) then py += speed end
	
	if collide() then
		score += 1
		cx = rnd(120)
		cy = rnd(120)
	end
end

function _draw()
	cls()
	rectfill(px, py, px+7, py+7, 7)
	rectfill(cx, cy, cx+7, cy+7, 10)
	print("score: "..score, 1, 1, 7)
end


-- MEETING 3

state = "player"
player_hp = 10
enemy_hp = 8

function _update()
	if state == "player" then
		if btnp(4) then
			 enemy_hp -= 2
			 state = "enemy"
		end
	elseif state == "enemy" then
		player_hp -= 1
		state = "player"
	end
end

function _draw()
	cls()
	print("player hp: "..player_hp, 10, 20, 7)
	print("enemy hp: "..enemy_hp, 10, 30, 8)
	
	if state == "player" then
		print("press x to attack", 10,50,11)
	else
		print("enemy attacks!", 10, 50, 8)
	end
end


-- Meeting 4

state = "start"

function _update()
	if state == "start" then
		if btnp(4) then state = "yes" end
		if btnp(5) then state = "no" end
	end
end

function _draw()
	cls()
	if state == "start" then
		print("help the npc?", 20, 30, 7)
		print("z yes! x no!", 20, 40, 6)
	elseif state == "yes" then
		print("npc thanks you", 20, 30, 9)
	elseif state == "no" then
		print("npc is sad!!", 20, 30, 8)		
	end
end

-- Meeting 5

player = {x=60, y=110, w=8, h=8}
enemies = {}
timer = 0
score = 0
game_over = false

function collide(a, b)
	return a.x < b.x+b.w and
	 a.x+a.w > b.x
	 and a.y < b.y+b.h
  and a.y+a.h > b.y
	end

function _update()
	if game_over == true
		then return end
	if btn(0) then player.x -= 2 end
	if btn(1) then player.x += 2 end
	
	timer += 1
	score += .0334
	
	if timer % 30 == 0 then
		 add(enemies, {x=rnd(120), y=0, w=8, h=8})
	end
	
	for e in all(enemies) do
		e.y += 1
		
		if collide(player, e) then
			game_over = true
		end
	end
end

function _draw()
	cls()
	rectfill(player.x, player.y, player.x+7, player.y+7, 7)
	
	for e in all(enemies) do
	 rectfill(e.x, e.y, e.x+7, e.y+7, 8)
	end
	print("score: "..flr(score), 5, 10, 7)
end	 


--[[
	okay, so I could use a mix of a cool html page AND a google classroom just divide the things between them.
	also because making on own html thing looks good for job and college apps :D

	GOOGLE CLASS:
	i could use the google classroom for all the more boring stuff that dosen't really matter but also link on there the html :)

	Annoucements
	Meetings agendas
	Assignments like "make a thing by next week" -- optional
	If we do have assignmnets then due dates as just a friendly reminder!
	Permission slips, forms, bureacratic nonsense
	link to html


	HTML:
	the cool things
	i could qr code for both but have the html be organized in a way that shows a cheat sheet and stuff like that
	on the html I could define exactly what we will be doing each meeting, the stuff I need to cover, the stuff I wouldn't mind
	talking about, and then the stuff we didn't have time to cover, which I would use as a backup in case we finish really quickly
	but otherwise is just a fun extra thing for people to look at on the html
	I would also have a link to the documentations page for either both lua and pico 8 or just pico 8


	sections:
	1. Welcome
		a. what the club does (mission statement?)
		b. what pico 8 is
		c. stress "you do not need prior experience"
	2. Quick start
		a. Minimal PICO-8 Program that can be modified on standby
		b. How to run it
		c. What `_update()` and `_draw()` are, explained in a conceptual human way
	3. Cheat Sheet
		a. Syntax
		b. Common patterns
		c. Collision explation
		d. Other more abstract ideas I will go over I have just only thought of collision so far. explained with digrams
	4. Mini games by meeting
		a. meeting 1 - box moves
		b. meeting 2 - box collision and point system
		c. meeting 3 - enemy logic
		Also a finished version of each fully explained with comments and a code breakdown, with at the bottom being a few challenges
	5. Outside Practice
		a. "If you're bored at home"
		b. Links, challenges, ideas, problems and solutions
]]
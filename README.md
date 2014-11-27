愛 - Ai Game Engine.

Ai is A 2D Löve powered game engine, targeting LÖVE itself.
The Engine is nothing more but a helper tool to speed up development time.

It contain a set of features such as built-in basic game objects camera, scenes,
asset manager, input manager, and an editor which allows you to create and
animate objects, edit scenes try everything within the editor, and update 
your components in realime.

You can not use engine without having knowledge of how LÖVE works, and Lua programming
experience.

The engine is still very uncomplete and under development.

#How to run

Simply run `love .` inside `ai` directory.

# Getting started:

1. Start the engine
2. Hit F4
3. Select Load
4. Enter an existing project name (See project structure)
5. Mess with the engine

#Understading the engine

Inorder to use the engine, your game must follow the same physolophy used by
the engine:

There are 10 Major Components to understand:
	- Engine
	- Camera
	- Scene
	- Class
	- Object
	- Control
	- AssetManager
	- Input Manager
	- Game
	- Project

#Engine

The engine can be run in two modes: 
	1. Editor
	2. Game

The Editor mode is used to handle scenes, objects, etc.
Game mode will be your final editor-independent game.

The Editor adds few attributes to the objects which are needed for internal 
use, and must be avoided by the programmer to avoid any data corruption. 

In the engine everything is defined by a unique ID which could be a number, or a name (Except camera).

This is how the engine works:

	What you see on the screen is rendered by a Camera.
	A Scene is Attached to a camera inorder to be rendered.
	A scene may contain 0 or many Objects.
	An object can have 0 or more child objects.

The Engine updates its default camera, which will update the scene. 
The scene will update its assigned objects, and each object will
recursively update all of its childs. 
Same aspect for rendering.


#Camera
Camera can render one attached scene. The Camera width and height are
equal to the screen size by default.

User can create as many camera he wants, but the engine can render only one.
Camera will not display objects that are out of its view area.
(This is defined in the object level.)

#Scene
A scene is nothing more but a background color, with many objects in it.
A scene might not have a background picture as it can be an object itself.

User can override the following method:

	Scene.OnLoad
	Scene.OnUpdate
	Scene.OnExit

Example: 

-- sc refers to the current scene.
Scene.OnLoad = function(sc)
	print("Scene "..sc.name.." loaded.")
end

#Object

Eve has a built in object class. The user need to extend it. 

The can define objects as:

	1. Visible: They are visible objects which will be displayed during the gameplay
	2. Invisible: They are part of the game but they will never be visible during gameplay.
	But they are visible in the editing mode, such as portal, spawning points, etc.

and that is by assigning either a game sprite (visible in game and in editor) or engine sprite 
(visible only in the editor).

Static objects that are usually dragged and dropped from inside the editor. That's why, 
inorder for them to appear inside the object's list, they need to be manually inserted. 
For that purpose, the olist.lua file exists, where the user create uselss instances
of all static objects, and add them the project. This step is only necessary in edit mode.

#Control
A control is basically one of the many behaviours an object can have. They can be animations, 
calculations, path finding, or what ever. Controls can interact with each other, from the same
object, or different objects. However, it's recommanded to create interfaces within objects to
allow their controls to communicate better.

#AssetManager
The asset manager allows you to handle your resources efficently.
You simple register all of your resources by assigning an ID to each resource,
and while importing them, the AssetManager will create LÖVE objects depending
on the resource type.

#Project's structure
Inorder to handle your project efficently, it should have such a structure:
(In Editing mode.)

	\ai											: Engine root
		\projects								: Your game folder
			\init.lua 							: Your main game file
			\objects 							: All of your objects code stored here
				\object1						: Example of object folder
					\object1.lua				: Object's class 
					\defaults.scene_1.table		: Object's defaults on scene 1
					\defaults.scene_n.table		: Object's defaults on scene n

			\scenes								: Scenes folder
				\scene1							: Example of scene 
					\scene1.lua					: Scene1's class
					\defaults.table 			: Scene1 defaults

			\Controls 							: Controls' folder
				\control1						: Example of a control instance
					\control1.lua 				: control1's class

			\assets								: Assets folder
				\gui							: GUI components
				\audio							: Audio Stuff
				\sfx							: Sound Effects
				\OtherStuffYouNeed				: Anything else you need.
				
			\OtherStuff 						: Create as many other folder as you need. 

This is the main structure in which your game must be organized. The Engine assumes
you are following this stucture, so please do.

There are plenty of things to do by your self. The engine just provides some helper 
tools.  

#Input Manager

Input manager handles events from Mouse and Keybards (Joysticks TODO).
The user define an event, and the action corresponding that that event
as a control. The Input manager will enable that control once the event 
had been triggered. 

# Game

The game structure contains game informations such as title, input managers,
current scene, and it redirects inputs to input managers.

# Project

Project structure contains game objects, scenes, controls, etc.

# Ai

This project is free and opensource under BSD license.
If you like this project please consider donating :)

# Author

Author: Sora 
Real name: Chouri Soulaymen 
Website: http://sora.eliteheberg.fr
Email: sora.chouri@gmail.[com]


# Development

## DONE:
	- Multiple Selection
	- Color Chooser
	- Editor Grid
	- Grid Properties
	- Object fork
	- Selection view
	- Implement Camera distance from the scene

## WORKING ON:
	- Scene Objects View

## TODO:
	- Pause RT Simulation instead of stop
	- Layer View
	- Align selected objects
	- Scene properties
	- Editor Settings Window
	- Better organized UI
	- Animation editor
	- Physics
	- Shading, lightning and other effects
	- Editor Settings window
	- Scaling
	- Object Editor
	- Camera Editor
	- Function/Control Editor

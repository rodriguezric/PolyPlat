# PolyPlat - Platformer Prototyping Framework

## Description
This is a simple set of scenes and scripts for prototyping platformers in Godot. It uses Polygon2D shapes to represent a player, walls, enemies, and goals.


## Installation
Clone this repo at the root `:res//` level of your project, then drag and drop the scenes in your project to begin using them.


## Requirements
The Player scene uses specific input names for controls:
* polyplat.left
* polyplat.right
* polyplat.jump

Add those to your input map before running a project.


## Recommendations
* Enable grid snapping and snap scalling. Set scale snapping to 0.5 to get single-block sized floors when scaling to create larger floors.
* Create a master node to send signals from your enemies and goals. Have this node be the parent to all nodes within a level.

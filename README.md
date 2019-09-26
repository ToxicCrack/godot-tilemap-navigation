# Godot Engine: Navigation2D with multiple tilemap layers

This is a sample project to showcase how Tilemap Navigation could be done with multiple layers of obstacles.

Create the ground, obstacle, etc layers as normal (with navigation where it should be), add them to a group called "tilemap". 
Add a Navigation2D node and a tilemap as a child. This tilemap has only one empty tile with navigation on it. Add it to a group called "navigation".
Add to the Navigation2D the TilemapNav.gd script, then enable navigation debugging to see if it works.

The script is very short and should be more or less self-explanatory. You can change the group names in there too.

Hints:
- Only the navigation tilemap must be a child of Navigation2D. The other tilemaps have to be outside.
- The order of the tilemaps is important: Ground then Obstacles or in other words: The tilemaps with navigation in it first, then the tilemaps which negate the navigation.
- Call "refreshNavigation" every time the tilemaps-navigation is modified (e.g. placing obstacles at runtime)

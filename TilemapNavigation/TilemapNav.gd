extends Navigation2D

var navTileset

# Called when the node enters the scene tree for the first time.
func _ready():
  for tilemap in get_children():
    if tilemap.is_in_group("navigation"):
      self.navTileset = tilemap
      break
  refreshNavigation()
  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass

func refreshNavigation():
  if(self.navTileset):
    for tilemap in get_tree().get_nodes_in_group("tilemap"):
      if not tilemap.is_in_group("navigation"):
        print(tilemap.name)
        for cellIdx in tilemap.get_used_cells():
          var cell = tilemap.get_cell(cellIdx.x, cellIdx.y)
          #has navigation?
          var nav = tilemap.tile_set.tile_get_navigation_polygon(cell)
          if(nav != null):
            #Add Navigation tile
            self.navTileset.set_cell(cellIdx.x, cellIdx.y, 0)
          else:
            #Remove any navigation tile on that position
            self.navTileset.set_cell(cellIdx.x, cellIdx.y, -1)
            
      tilemap.update_dirty_quadrants()
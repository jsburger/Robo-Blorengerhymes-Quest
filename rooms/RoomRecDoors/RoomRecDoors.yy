{
  "$GMRoom":"",
  "%Name":"RoomRecDoors",
  "creationCodeFile":"",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_29278B8E_2_1_2_2","path":"rooms/RoomRecDoors/RoomRecDoors.yy",},
    {"name":"inst_22DF2A54_2","path":"rooms/RoomRecDoors/RoomRecDoors.yy",},
    {"name":"inst_676C75C4","path":"rooms/RoomRecDoors/RoomRecDoors.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_29278B8E_2_1_2_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_29278B8E_2_1_2_2","objectId":{"name":"IndoorsFlag","path":"objects/IndoorsFlag/IndoorsFlag.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":64.0,},
        {"$GMRInstance":"","%Name":"inst_22DF2A54_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_22DF2A54_2","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"propertyId":{"name":"target_room","path":"objects/RoomEntrance/RoomEntrance.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"RoomRecLobby",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":2.0,"x":992.0,"y":384.0,},
        {"$GMRInstance":"","%Name":"inst_676C75C4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_676C75C4","objectId":{"name":"Door","path":"objects/Door/Door.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"propertyId":{"name":"target_room","path":"objects/RoomEntrance/RoomEntrance.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"RoomJumpscare",},
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"propertyId":{"name":"is_area_transition","path":"objects/RoomEntrance/RoomEntrance.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":448.0,"y":160.0,},
      ],"layers":[],"name":"Instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRAssetLayer":"","%Name":"Decor","assets":[],"depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Decor","properties":[],"resourceType":"GMRAssetLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"Collision","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Collision","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":12,"SerialiseWidth":16,"TileCompressedData":[
          -21,0,-4,5,-12,0,4,5,0,0,5,-12,0,4,5,0,0,5,-11,0,4,-2147483648,5,-2147483648,-2147483648,-8,5,-4,0,2,
          -2147483648,5,-3,-2147483648,-2,0,1,-2147483648,-8,0,8,-2147483648,5,0,-2147483648,0,0,-2147483648,-2147483648,
          -9,0,-11,5,-32,0,1,-2147483648,-15,0,-2,-2147483648,-2,0,-5,-2147483648,4,0,-2147483648,0,0,-3,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tilesetCollision","path":"tilesets/tilesetCollision/tilesetCollision.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRTileLayer":"","%Name":"Walls","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Walls","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":12,"SerialiseWidth":16,"TileCompressedData":[
          -21,6,4,23,7,7,28,-12,6,4,10,0,0,2,-12,6,4,10,0,0,2,-12,6,4,10,0,0,3,-7,7,-5,6,1,10,-4,0,-2,-2147483648,
          -4,0,-5,6,1,10,-3,0,-3,-2147483648,-4,0,-5,6,1,24,-10,5,-64,6,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tilesetWallsIndoors","path":"tilesets/tilesetWallsIndoors/tilesetWallsIndoors.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4283740282,"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"RoomRecDoors",
  "parent":{
    "name":"Rooms",
    "path":"folders/Rooms.yy",
  },
  "parentRoom":null,
  "physicsSettings":{
    "inheritPhysicsSettings":false,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":768,
    "inheritRoomSettings":false,
    "persistent":false,
    "Width":1024,
  },
  "sequenceId":null,
  "views":[
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":false,
    "inheritViewSettings":false,
  },
  "volume":1.0,
}
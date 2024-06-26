{
  "$GMRoom":"",
  "%Name":"Room1",
  "creationCodeFile":"",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_74D0C980","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_20943DDC","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_78ADB79","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_7F225C09","path":"rooms/Room1/Room1.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_74D0C980","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_74D0C980","objectId":{"name":"Player","path":"objects/Player/Player.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":544.0,"y":320.0,},
        {"$GMRInstance":"","%Name":"inst_20943DDC","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_20943DDC","objectId":{"name":"Pot","path":"objects/Pot/Pot.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":704.0,"y":256.0,},
        {"$GMRInstance":"","%Name":"inst_78ADB79","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_78ADB79","objectId":{"name":"Door","path":"objects/Door/Door.yy",},"properties":[
            {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"propertyId":{"name":"target_room","path":"objects/RoomEntrance/RoomEntrance.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Room2",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":832.0,"y":224.0,},
        {"$GMRInstance":"","%Name":"inst_7F225C09","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_7F225C09","objectId":{"name":"Pot","path":"objects/Pot/Pot.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":448.0,"y":448.0,},
      ],"layers":[],"name":"Instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"Collision","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Collision","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":12,"SerialiseWidth":22,"TileCompressedData":[
          -5,-2147483648,-8,5,-9,0,-4,-2147483648,-10,5,-8,0,-4,-2147483648,-5,5,-3,0,-3,5,-7,0,-7,-2147483648,
          -15,0,1,-2147483648,-3,5,-3,-2147483648,-11,0,1,5,-3,0,1,-2147483648,-3,5,-4,-2147483648,-2,0,-5,5,-7,
          0,1,-2147483648,-3,5,-4,-2147483648,2,0,-2147483648,-5,5,-7,0,-2,-2147483648,-20,0,1,-2147483648,-3,
          10,-18,0,1,-2147483648,-3,10,1,0,-4,1,-13,0,1,-2147483648,-3,10,1,0,-4,1,-13,0,1,-2147483648,-21,0,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tilesetCollision","path":"tilesets/tilesetCollision/tilesetCollision.yy",},"userdefinedDepth":false,"visible":false,"x":0,"y":0,},
    {"$GMRTileLayer":"","%Name":"Walls","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Walls","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":12,"SerialiseWidth":22,"TileCompressedData":[
          -5,-2147483648,1,2,-6,6,3,10,0,0,-8,-2147483648,-2,0,6,-2147483648,1,29,6,6,23,-3,7,2,42,9,-4,0,-5,-2147483648,
          -2,0,2,-2147483648,3,-3,7,1,11,-3,0,3,3,25,12,-3,0,-9,-2147483648,-17,0,-4,-2147483648,-18,0,-4,-2147483648,
          -3,0,-2,-2147483648,-9,0,1,-2147483648,-3,0,4,-2147483648,0,0,-2147483648,-18,0,3,-2147483648,0,0,-5,
          -2147483648,-14,0,3,-2147483648,0,0,-5,-2147483648,-13,0,-13,-2147483648,3,0,-2147483648,-2147483648,
          -5,0,-17,-2147483648,5,0,1,5,5,9,-17,-2147483648,7,0,2,6,6,10,-2147483648,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tilesetWallsMarble","path":"tilesets/tilesetWallsMarble/tilesetWallsMarble.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4288649873,"depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"Room1",
  "parent":{
    "name":"Robo-Blorengerhymes' Quest",
    "path":"Robo-Blorengerhymes' Quest.yyp",
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
    "Width":1366,
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
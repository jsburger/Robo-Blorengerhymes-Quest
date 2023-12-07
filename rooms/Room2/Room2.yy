{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "Room2",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_2CF39232","path":"rooms/Room2/Room2.yy",},
    {"name":"inst_4DCB66E3","path":"rooms/Room2/Room2.yy",},
    {"name":"inst_3029DEE7","path":"rooms/Room2/Room2.yy",},
    {"name":"inst_48828A91","path":"rooms/Room2/Room2.yy",},
    {"name":"inst_33D0AA31","path":"rooms/Room2/Room2.yy",},
    {"name":"inst_4D8C0DFA","path":"rooms/Room2/Room2.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Signals","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3029DEE7","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"SignalStartRoom","path":"objects/SignalStartRoom/SignalStartRoom.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Signal","path":"objects/Signal/Signal.yy",},"propertyId":{"name":"channel","path":"objects/Signal/Signal.yy",},"value":"1",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":128.0,"y":192.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_48828A91","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"ObjectSpawner","path":"objects/ObjectSpawner/ObjectSpawner.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"ObjectSpawner","path":"objects/ObjectSpawner/ObjectSpawner.yy",},"propertyId":{"name":"object","path":"objects/ObjectSpawner/ObjectSpawner.yy",},"value":"Enemy",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Component","path":"objects/Component/Component.yy",},"propertyId":{"name":"channel","path":"objects/Component/Component.yy",},"value":"1",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":192.0,"y":288.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_33D0AA31","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"SignalZone","path":"objects/SignalZone/SignalZone.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Signal","path":"objects/Signal/Signal.yy",},"propertyId":{"name":"output_type","path":"objects/Signal/Signal.yy",},"value":"OutType.ON_CHANGE, OutType.WHEN_TRUE",},
          ],"rotation":0.0,"scaleX":3.5263157,"scaleY":4.368421,"x":352.0,"y":288.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4D8C0DFA","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"ObjectSpawner","path":"objects/ObjectSpawner/ObjectSpawner.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"ObjectSpawner","path":"objects/ObjectSpawner/ObjectSpawner.yy",},"propertyId":{"name":"object","path":"objects/ObjectSpawner/ObjectSpawner.yy",},"value":"Pot",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":192.0,"y":448.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2CF39232","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"propertyId":{"name":"target_room","path":"objects/RoomEntrance/RoomEntrance.yy",},"value":"Room1",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"RoomEntrance","path":"objects/RoomEntrance/RoomEntrance.yy",},"propertyId":{"name":"is_area_transition","path":"objects/RoomEntrance/RoomEntrance.yy",},"value":"True",},
          ],"rotation":-270.51886,"scaleX":1.0,"scaleY":2.5,"x":320.0,"y":32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4DCB66E3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"Pot","path":"objects/Pot/Pot.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":512.0,"y":320.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Collision","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":12,"SerialiseWidth":22,"TileCompressedData":[
-9,-2147483648,-6,5,-2,-2147483648,1,5,-13,-2147483648,-3,5,6,-2147483648,5,5,-2147483648,5,5,-12,-2147483648,-4,
5,6,-2147483648,5,5,-2147483648,5,5,-12,-2147483648,-4,5,1,-2147483648,-5,5,-13,-2147483648,-9,5,-16,-2147483648,
1,5,-21,-2147483648,5,5,-2147483648,5,-2147483648,5,-13,-2147483648,-2,5,1,-2147483648,-5,5,-13,-2147483648,-2,5,
-3,-2147483648,4,5,-2147483648,-2147483648,5,-13,-2147483648,-4,5,-20,-2147483648,-2,5,-33,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tilesetCollision","path":"tilesets/tilesetCollision/tilesetCollision.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Walls","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":12,"SerialiseWidth":22,"TileCompressedData":[
-9,-2147483648,9,2,6,23,7,28,10,0,0,14,-13,-2147483648,9,2,6,10,0,2,10,-2147483648,
1,34,-12,-2147483648,10,1,29,6,10,0,2,10,-2147483648,2,10,-12,-2147483648,10,3,28,6,10,
0,2,24,5,29,10,-13,-2147483648,5,3,7,25,37,30,-3,7,1,11,-16,-2147483648,1,14,
-6,-2147483648,-2,0,-13,-2147483648,8,14,-2147483648,13,-2147483648,16,-2147483648,0,0,-10,-2147483648,9,17,12,-2147483648,4,
41,8,40,32,-2147483648,-3,0,-9,-2147483648,2,1,34,-3,-2147483648,5,15,-2147483648,-2147483648,15,-2147483648,-3,0,
-9,-2147483648,4,3,25,27,9,-7,-2147483648,1,0,-10,-2147483648,-2,0,2,3,11,-33,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tilesetWallsHedge","path":"tilesets/tilesetWallsHedge/tilesetWallsHedge.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4286611584,"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Robo-Blorengerhymes' Quest",
    "path": "Robo-Blorengerhymes' Quest.yyp",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 768,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1366,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}
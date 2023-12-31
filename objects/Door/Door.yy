{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Door",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":{"name":"Player","path":"objects/Player/Player.yy",},"eventNum":0,"eventType":4,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Doors",
    "path": "folders/Objects/Room Parts/Doors.yy",
  },
  "parentObjectId": {
    "name": "RoomEntrance",
    "path": "objects/RoomEntrance/RoomEntrance.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"type","filters":[],"listItems":[
        "DoorType.OPEN",
        "DoorType.PUZZLE",
        "DoorType.LOCKED",
        "DoorType.BOSS_LOCKED",
      ],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"DoorType.OPEN","varType":6,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"can_be_closed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"True","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"channel","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":true,"rangeMax":8.0,"rangeMin":0.0,"value":"0","varType":1,},
  ],
  "solid": false,
  "spriteId": {
    "name": "sprDoorUp",
    "path": "sprites/sprDoorUp/sprDoorUp.yy",
  },
  "spriteMaskId": null,
  "tags": [
    "Signal Receiver",
    "Serializable",
  ],
  "visible": true,
}
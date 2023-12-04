/// do NOT save the whole struct this returns. it WILL change
function collision_line_first(x1, y1, x2, y2, object, prec, notme) {
	static stuff = {
		x: 0,
		y: 0,
		inst: noone
	}
    var sx, sy, inst, i;
    sx = x2 - x1;
    sy = y2 - y1;
    inst = collision_line(x1,y1,x2,y2,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(x1,y1,x2,y2,object,prec,notme);
            if instance_exists(i) {
                x2 -= sx;
                y2 -= sy;
                inst = i;
            }
			else {
                x2 += sx;
                y2 += sy;
            }
        }
		stuff.x = x2
		stuff.y = y2
    }
	else {
		stuff.x = x2
		stuff.y = y2
	}
	stuff.inst = inst
    return stuff;
}
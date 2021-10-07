/obj/structure/barricade/ship
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat1"
	material_name = "wood"
	protection_chance = 60
	var/ispartial = FALSE
	opacity = TRUE
	New()
		..()
		if (dir == SOUTH && ispartial)
			layer = 4.5
/obj/structure/barricade/ship/dismantle()
	new/obj/effect/decal/cleanable/debris(loc)
	if(prob(50))
		var/x1 = src.x+pick(-1,1)
		var/y1 = src.y+pick(-1,1)
		new/obj/effect/decal/cleanable/debris(locate(x1,y1,src.z))
	..()
	return
/obj/effect/decal/cleanable/debris
	name = "ship debris"
	desc = "Bits and pieces blown off a ship."
	density = FALSE
	anchored = TRUE
	icon = 'icons/obj/vehicles/vehicleparts_boats.dmi'
	icon_state = "debris0"

	New()
		..()
		icon_state = pick("debris0","debris1","debris2","debris3")
		dir = pick(NORTH,SOUTH,EAST,WEST)

//copied from sandbags
/obj/structure/barricade/ship/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)

	if (!ispartial)
		return ..()

	for (var/obj/covers/repairedfloor/rope/R in loc)
		return TRUE

	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE

	else if (!istype(mover, /obj/item))
		if (get_dir(loc, target) & dir)
			return FALSE
		else
			return TRUE
	else
		if (istype(mover, /obj/item/projectile))
			var/obj/item/projectile/proj = mover
			proj.throw_source = proj.starting

			if (ishuman(proj.firer) && (proj.firer.lying || proj.firer.prone))
				visible_message("<span class = 'warning'>[mover] hits the [src]!</span>")
				if (istype(mover, /obj/item/projectile))
					var/obj/item/projectile/B = mover
					return prob(100-protection_chance-(B.penetrating*4))
				return FALSE
		if (!mover.throw_source)
			if (get_dir(loc, target) & dir)
				return FALSE
			else
				return TRUE
		else
			switch (get_dir(mover.throw_source, get_turf(src)))
				if (NORTH, NORTHEAST)
					if (dir == EAST || dir == WEST || dir == NORTH)
						return TRUE
				if (SOUTH, SOUTHEAST)
					if (dir == EAST || dir == WEST || dir == SOUTH)
						return TRUE
				if (EAST)
					if (dir != WEST)
						return TRUE
				if (WEST)
					if (dir != EAST)
						return TRUE

/obj/structure/barricade/ship/New(var/newloc, var/material_name)
	return
/obj/structure/barricade/ship/get_material()
	return material

/obj/structure/barricade/ship/north
	icon_state = "boat1_up"

/obj/structure/barricade/ship/north/corners
	icon_state = "boat1_up_corners"


/obj/structure/barricade/ship/wall1
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat1_a"
	opacity = FALSE

/obj/structure/barricade/ship/wall2
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat2"

/obj/structure/barricade/ship/wall2/doorway
	name = "dorway"
	desc = "A wooden ship dorway."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat2_doorway"
	density = FALSE
	opacity = FALSE

/obj/structure/barricade/ship/blue
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b1"

/obj/structure/barricade/ship/blue/b1
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b1"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b2
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b2"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b3
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b3"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b4
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b4"
/obj/structure/barricade/ship/blue/b5
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b5"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b6
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b6"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b7
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b7"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b8
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b8"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b9
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b9"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b10
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b10"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b11
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b11"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b12
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b12"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b13
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b13"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b14
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b14"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b15
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b15"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b16
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b16"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b17
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b17"
/obj/structure/barricade/ship/blue/b18
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b18"
	opacity = TRUE
/obj/structure/barricade/ship/blue/b19
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b19"

/obj/structure/barricade/ship/blue/bport0
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_port0"
	protection_chance = 40
	opacity = FALSE
	ispartial = TRUE

/obj/structure/barricade/ship/blue/bport1
	name = "holed wall"
	desc = "A thin wood ship wall, with a lower part to fire through."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_port1"
	protection_chance = 25
	opacity = FALSE
	ispartial = TRUE
	
/obj/structure/barricade/ship/blue/bport3
	name = "crenelated wall"
	desc = "A thin wood ship wall, with a lower part to fire through."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_port3"
	protection_chance = 20
	opacity = FALSE
	density = FALSE
	ispartial = TRUE

/obj/structure/barricade/ship/blue/bwest
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_west"
	opacity = FALSE

/obj/structure/barricade/ship/blue/bwest2
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_west2"
	opacity = FALSE

/obj/structure/barricade/ship/blue/beast
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_east"
	opacity = FALSE

/obj/structure/barricade/ship/blue/beast2
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat_b.dmi'
	icon_state = "boat_b_east2"
	opacity = FALSE

/obj/structure/barricade/ship/wood
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a1"
	opacity = TRUE


/obj/structure/barricade/ship/wood/a1
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a1"
/obj/structure/barricade/ship/wood/a2
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a2"
/obj/structure/barricade/ship/wood/a3
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a3"
/obj/structure/barricade/ship/wood/a4
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a4"
/obj/structure/barricade/ship/wood/a5
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a5"
/obj/structure/barricade/ship/wood/a6
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a6"
/obj/structure/barricade/ship/wood/a7
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a7"
/obj/structure/barricade/ship/wood/a8
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a8"
/obj/structure/barricade/ship/wood/a9
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a9"
/obj/structure/barricade/ship/wood/a10
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a10"
/obj/structure/barricade/ship/wood/a11
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a11"
/obj/structure/barricade/ship/wood/a12
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a12"

/obj/structure/barricade/ship/wood/a12
	name = "wall"
	desc = "A wooden ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_a12"

/obj/structure/barricade/ship/wood/port0
	name = "wall"
	desc = "A thin wood ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_port0"
	protection_chance = 40
	opacity = FALSE
	ispartial = TRUE

/obj/structure/barricade/ship/wood/portl1
	name = "wall"
	desc = "A thin wood ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_portl1"
	protection_chance = 40
	opacity = FALSE
	ispartial = TRUE

/obj/structure/barricade/ship/wood/portl2
	name = "wall"
	desc = "A thin wood ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_portl2"
	protection_chance = 40
	opacity = FALSE
	ispartial = TRUE

/obj/structure/barricade/ship/wood/portl3
	name = "wall"
	desc = "A thin wood ship wall."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_portl3"
	protection_chance = 40
	opacity = FALSE
	ispartial = TRUE

/obj/structure/barricade/ship/wood/port1
	name = "holed wall"
	desc = "A thin wood ship wall, with a hole to fire through."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_port1"
	protection_chance = 35
	opacity = FALSE

/obj/structure/barricade/ship/wood/port2
	name = "crenelated wall"
	desc = "A thin wood ship wall, with a lower part to fire through."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat_port2"
	protection_chance = 25
	density = FALSE
	opacity = FALSE

/obj/structure/barricade/ship/aport0
	name = "closed cannon port"
	desc = "A port used to fire cannons out of. This one is closed."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat1_port0"
	opacity = TRUE
	protection_chance = 100
	ispartial = FALSE
	var/open = FALSE
	density = TRUE
	attack_hand(mob/living/human/H)
		..()
		if (open)
			if (do_after(H, 35, src))
				H << "You close the port."
				open = FALSE
				opacity = TRUE
				protection_chance = 100
				ispartial = FALSE
				update_icon()

		else
			if (do_after(H, 35, src))
				H << "You open the port."
				open = TRUE
				opacity = FALSE
				protection_chance = 60
				ispartial = TRUE
				update_icon()
	update_icon()
		if (open)
			icon_state = "boat1_port1"
		else
			icon_state = "boat1_port0"
	verb/open_close()
		set name = "Open/Close"
		set category = null
		set src in range(1, usr)

		if (!istype(usr, /mob/living/human))
			return
		if (open)
			if (do_after(usr, 35, src))
				usr << "You close the port."
				open = FALSE
				opacity = TRUE
				protection_chance = 100
				ispartial = FALSE
				update_icon()

		else
			if (do_after(usr, 35, src))
				usr << "You open the port."
				open = TRUE
				opacity = FALSE
				protection_chance = 60
				ispartial = TRUE
				update_icon()
/obj/structure/barricade/ship/aport0/north
	icon_state = "boat1_port0_up"
	update_icon()
		if (open)
			icon_state = "boat1_port1_up"
		else
			icon_state = "boat1_port0_up"
/obj/structure/barricade/ship/aport1
	name = "open cannon port"
	desc = "A port used to fire cannons out of. This one is open."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat1_port1"
	opacity = FALSE
	protection_chance = 30
	ispartial = TRUE

/obj/structure/barricade/ship/aport1/north
	name = "open cannon port"
	desc = "A port used to fire cannons out of. This one is open."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat1_port1_up"
	opacity = FALSE
	protection_chance = 30
	ispartial = TRUE

/obj/structure/barricade/ship/aport2
	name = "open cannon port"
	desc = "A port used to fire cannons out of. This one is open and has a cannon poking out."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat1_port2"
	opacity = FALSE
	protection_chance = 45
	ispartial = TRUE

/obj/structure/barricade/ship/cport0
	name = "closed cannon port"
	desc = "A port used to fire cannons out of. This one is closed."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat2_port0"
	opacity = TRUE
	protection_chance = 60
	ispartial = TRUE

/obj/structure/barricade/ship/cport1
	name = "open cannon port"
	desc = "A port used to fire cannons out of. This one is open."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat2_port1"
	opacity = FALSE
	protection_chance = 30
	ispartial = TRUE

/obj/structure/barricade/ship/cport2
	name = "open cannon port"
	desc = "A port used to fire cannons out of. This one is open and has a cannon poking out."
	icon = 'icons/turf/boat.dmi'
	icon_state = "boat2_port2"
	opacity = FALSE
	protection_chance = 45
	ispartial = TRUE

/obj/structure/barricade/ship/mast
	name = "mast"
	desc = "A wooden ship mast."
	icon = 'icons/turf/walls.dmi'
	icon_state = "wood_mast"
	protection_chance = 60

/obj/structure/barricade/ship/mast/large
	icon = 'icons/turf/64x64.dmi'
	icon_state = "large_mast"
	var/image/olay
	var/image/mlay
	bound_height = 64
	bound_width = 64
	opacity = FALSE
	maxhealth = 10000
	health = 10000

	var/sailhealth = 100
	var/rigginghealth = 100
	var/sailstat = 100
	var/owner = "ship"
	
	New()
		..()
		mlay = image(icon='icons/obj/vehicles/mast_vertical.dmi',icon_state="mast_overlay", pixel_x = -32, pixel_y = -192, layer=10)
		olay = image(icon='icons/obj/vehicles/mast_vertical.dmi',icon_state="sails_overlay_h100", pixel_x = 32, pixel_y = -192, layer=10)
		update_icon()

	update_icon()
		overlays.Cut()
		overlays += mlay
		if (sailstat <= 0)
			olay.icon_state = "sails_overlay0"
		else if (sailhealth > 75)
			olay.icon_state = "sails_overlay_h100"
		else if (sailhealth <= 75 && sailhealth > 50)
			olay.icon_state = "sails_overlay_h75"
		else if (sailhealth <= 50 && sailhealth > 25)
			olay.icon_state = "sails_overlay_h50"
		else if (sailhealth <= 25)
			olay.icon_state = "sails_overlay_h25"
		overlays += olay

	examine(mob/user)
		..(user)
		var/sailstat_t = "Full Sail"
		if (sailstat <= 66 && sailstat > 33)
			sailstat_t = "Half Sail"
		else if (sailstat <= 33 && sailstat > 0)
			sailstat_t = "Reduced Sail"
		else if (sailstat <= 0)
			sailstat_t = "Retracted"
		user << "Sails: <b>[sailstat_t]</b>"
		user << "Sail Status: <b>[sailhealth]%</b>"
		user << "Rigging Status: <b>[rigginghealth]%</b>"

	attackby(obj/item/I, mob/living/human/H)
		if (istype(I, /obj/item/stack/material))
			var/obj/item/stack/material/M = I
			if (istype(I,/obj/item/stack/material/cloth))
				if (sailhealth < 100)
					H << "You start patching the sails..."
					if(do_after(H,30,src))
						if(M.amount >= 1)
							M.amount--
							H << "You repair one of the holes."

			else if (istype(I,/obj/item/stack/material/rope))
				if (rigginghealth < 100)
					H << "You start replacing the damaged riggings..."
					if(do_after(H,30,src))
						if(M.amount >= 1)
							M.amount--
							H << "You fix one of the ropes."
		else
			..()
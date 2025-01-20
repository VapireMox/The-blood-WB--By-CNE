import Reflect;

/**
 * 这个真的太牛逼了，哈哈哈哈哈哈，都给我狠狠地三连
 */
class AnimationIcon extends FlxSprite {
	public var iconName:String = "bf";
	
	public var healthSteps:Map<String, Dynamic> = [
		"lose" => {x: 0.0, y: 0.0, min: 0.0, max: 0.25},
		"normal" => {x: 0.0, y: 0.0, min: 0.25, max: 0.75},
		"win" => {x: 0.0, y: 0.0, min: 0.75, max: 1.0}
	];
	
	public var data:Dynamic = null;

	public var isPlayer:Bool;

	public function new(icon:String = "bf", isPlayer = false, ?list:Array<Dynamic>) {
		this.isPlayer = isPlayer;
		iconName = icon;
		
		health = 0.5;
		
		if(list != null) {
			for(obj in list) {
				if(Reflect.hasField(obj, "animName")) {
					switch(obj.animName) {
						case "lose":
							if(Reflect.hasField(obj, "x"))
								healthSteps.get(obj.animName).x = obj.x;
							if(Reflect.hasField(obj, "y"))
								healthSteps.get(obj.animName).y = obj.y;
							if(Reflect.hasField(obj, "min"))
								healthSteps.get(obj.animName).min = obj.min;
							if(Reflect.hasField(obj, "max"))
								healthSteps.get(obj.animName).max = obj.max;
						case "normal":
							if(Reflect.hasField(obj, "x"))
								healthSteps.get(obj.animName).x = obj.x;
							if(Reflect.hasField(obj, "y"))
								healthSteps.get(obj.animName).y = obj.y;
							if(Reflect.hasField(obj, "min"))
								healthSteps.get(obj.animName).min = obj.min;
							if(Reflect.hasField(obj, "max"))
								healthSteps.get(obj.animName).max = obj.max;
						case "win":
							if(Reflect.hasField(obj, "x"))
								healthSteps.get(obj.animName).x = obj.x;
							if(Reflect.hasField(obj, "y"))
								healthSteps.get(obj.animName).y = obj.y;
							if(Reflect.hasField(obj, "min"))
								healthSteps.get(obj.animName).min = obj.min;
							if(Reflect.hasField(obj, "max"))
								healthSteps.get(obj.animName).max = obj.max;
						default:
							healthSteps.set(obj.animName, {});
							if(Reflect.hasField(obj, "x"))
								Reflect.setField(healthSteps.get(obj.animName), "x", obj.x);
							if(Reflect.hasField(obj, "y"))
								Reflect.setField(healthSteps.get(obj.animName), "y", obj.y);
							if(Reflect.hasField(obj, "min"))
								Reflect.setField(healthSteps.get(obj.animName), "min", obj.min);
							if(Reflect.hasField(obj, "max"))
								Reflect.setField(healthSteps.get(obj.animName), "max", obj.max);
					}
				}
			}
		}
		
		setIcon(icon);
		
		super();
	}
	
	public function setIcon(icon:String) {
		frames = Paths.getSparrowAtlas("icons/" + icon);
		
		for(anim in healthSteps.keys()) {
			animation.addByPrefix(anim, anim, 8, true);
		}
		
		antialiasing = true;
	}
	
	public override function update(elapsed:Float) {
		super.update(elapsed);
	
		for(name in healthSteps.keys()) {
			var step:Dynamic = healthSteps.get(name);
		
			if(health < step.max && health >= step.min) {
				animation.play(name, false);
				
				break;
			}
		}
	}
}
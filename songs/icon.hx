importAddons("AnimationIcon");

var allowAnimationIcon:Array<{var name:String; var scale:Float; var x:Float; var y:Float;}> = [
	{
		name: "hnbf",
		scale: 1.75,
		x: 118,
		y: -125
	},
	{
		name: "tom",
		scale: 1,
		x: 58,
		y: -35
	},
	{
		name: "tom-final",
		scale: 1,
		x: 58,
		y: -35
	}
];

var animationIconP1:AnimationIcon = null;
var animationIconP2:AnimationIcon = null;

function postCreate() {
	var iconName:Array<String> = [];
	
	for(ai in allowAnimationIcon) {
		iconName.push(ai.name);
	}
	
	if(boyfriend != null && dad != null)
		for(char in [boyfriend, dad]) {
			if(iconName.contains(char.getIcon())) {
				switch(char) {
					case boyfriend:
						var cne:Dynamic = allowAnimationIcon[iconName.indexOf(char.getIcon())];
						var index:Int = members.indexOf(iconP1);
						
						remove(iconP1);
						
						animationIconP1 = new AnimationIcon(char.getIcon(), true);
						animationIconP1.data = cne;
						
						animationIconP1.scale.set(cne.scale, cne.scale);
						animationIconP1.updateHitbox();
						
						animationIconP1.cameras = [camHUD];
						animationIconP1.y = iconP1.y + cne.y;
						insert(index, animationIconP1);
					case dad:
						var cne:Dynamic = allowAnimationIcon[iconName.indexOf(char.getIcon())];
						var index:Int = members.indexOf(iconP2);
						
						remove(iconP2);
						
						animationIconP2 = new AnimationIcon(char.getIcon(), false);
						animationIconP2.data = cne;
						animationIconP2.cameras = [camHUD];
						
						animationIconP2.scale.set(cne.scale, cne.scale);
						animationIconP2.updateHitbox();
						
						animationIconP2.y = iconP2.y + cne.y;
						insert(index, animationIconP2);
				}
			}
		}
}

function update(elapsed:Float) {
	if(animationIconP1 != null && members.indexOf(animationIconP1) > -1) {
		animationIconP1.health = healthBar.percent / 100;
	
		var iconOffset:Float = animationIconP1.data.x;
		var center:Float = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0);
	
		animationIconP1.x = center - iconOffset;
	}
	
	if(animationIconP2 != null && members.indexOf(animationIconP2) > -1) {
		animationIconP2.health = 1 - (healthBar.percent / 100);
	
		var iconOffset:Float = animationIconP2.data.x;
		var center:Float = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0);
	
		animationIconP2.x = center - (animationIconP2.frameWidth - iconOffset);
	}
}
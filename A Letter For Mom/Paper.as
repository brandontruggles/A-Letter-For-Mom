package 
{
	import flash.events.Event;
	public class Paper extends GameEntity
	{
		private var yTop:Number;
		private var yBottom:Number;
		private var hitTop:Boolean;
		private var collected:Boolean;
		public function Paper(xpos:Number,ypos:Number) 
		{
			super(xpos,ypos);
			yTop = y-20;
			yBottom = y;
			hitTop = false;
			yVelocity = 1;
			solid = false;
			collected = false;
		}
		public override function tick(evt:Event):void
		{
			if(!collected)
			{
				if(!hitTop && y>yTop)
				moveUp();
				else if(!hitTop && y<=yTop)
				hitTop = true;
				else if(hitTop && y<yBottom)
				moveDown();
				else if(hitTop && y>=yBottom)
				hitTop = false;
				
				for(var i = 0;i<GameManager.getEntityList().listSize();i++)
				if(GameManager.getEntityList().getObject(i) is Player && hitTestObject(GameManager.getEntityList().getObject(i)))
				getCollected();
			}
			
			if(collected)
			if(alpha>0)
			{
				alpha-=.1;
				moveUp();
			}
			else
			{
				removeFromParent();
				GameManager.endCurrentLevel();
			}
		}
		private function getCollected():void
		{
			collected = true;
		}
	}
}
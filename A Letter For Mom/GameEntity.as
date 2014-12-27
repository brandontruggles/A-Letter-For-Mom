package 
{	
	public class GameEntity extends TimelineObject
	{
		protected var xVelocity:Number;
		protected var yVelocity:Number;
		protected var moving:Boolean;
		protected var facingRight:Boolean;
		protected var solid:Boolean;
		public function GameEntity(xpos:Number,ypos:Number)
		{
			x = xpos;
			y = ypos;
			xVelocity = 0;
			yVelocity = 0;
			moving = false;
			facingRight = true;
			solid = true;
		}
		public function setXVelocity(v:Number):void
		{
			xVelocity = v;
		}
		public function setYVelocity(v:Number):void
		{
			yVelocity = v;
		}
		public function canMoveRight():Boolean
		{
			return true;
		}
		public function canMoveDown():Boolean
		{
			return true;
		}
		public function canMoveLeft():Boolean
		{
			return true;
		}
		public function canMoveUp():Boolean
		{
			return true;
		}
		public function isSolid():Boolean
		{
			return solid;
		}
		public function moveRight():void
		{
			if(canMoveRight())
			x+=xVelocity;
		}
		public function moveDown():void
		{
			if(canMoveDown())
			y+=yVelocity;
		}
		public function moveLeft():void
		{
			if(canMoveLeft())
			x-=xVelocity;
		}
		public function moveUp():void
		{
			if(canMoveUp())
			y-=yVelocity;
		}
	}
}
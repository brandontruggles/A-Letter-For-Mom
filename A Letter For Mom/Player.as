package 
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Player extends GameEntity
	{
		private var keyListener:MultiKeyListener;
		private var jumping:Boolean;
		private var hitTopOfJump:Boolean;
		private var jumpHeight:Number;
		public function Player(xpos:Number,ypos:Number) 
		{
			super(xpos,ypos);
			xVelocity = 4;
			yVelocity = 6;
			jumping = false;
			hitTopOfJump = false;
			jumpHeight = y-60;
		}
		public override function addToParent(p:Object):void
		{
			super.addToParent(p);
			keyListener = new MultiKeyListener(this);
		}
		public override function tick(evt:Event):void
		{
			if(keyListener.getKeyList().containsObject(68))
			moveRight();
			else if(keyListener.getKeyList().containsObject(65))
			moveLeft();
			else
			{
				moving = false;
			}
			if(keyListener.getKeyList().containsObject(32))
			jump();
			
			
			if(jumping)
			{
				if(canMoveUp() && !hitTopOfJump)
				moveUp();
				
				if((!canMoveUp() && !hitTopOfJump) || y<jumpHeight)
				hitTopOfJump = true;
				if(!canMoveDown() && hitTopOfJump)
				{
					jumping = false;
					hitTopOfJump = false;
				}
			}
			if(canMoveDown() && hitTopOfJump || !jumping)
			moveDown();
			
			if(!moving && !jumping)
			{
				if(facingRight && currentFrame!=1)
				gotoAndStop(1);
				else if(!facingRight && currentFrame!=2)
				gotoAndStop(2);
			}
			else if(moving && !jumping)
			{
				if(facingRight && currentFrame!=3)
				gotoAndStop(3);
				else if(!facingRight && currentFrame!=4)
				gotoAndStop(4);
			}
			else if(jumping)
			{
				if(facingRight && currentFrame!=5)
				gotoAndStop(5);
				else if(!facingRight && currentFrame!=6)
				gotoAndStop(6);
			}
		}
		public override function removeListeners():void
		{
			super.removeListeners();
			keyListener.removeListeners();
		}
		public override function canMoveRight():Boolean
		{
			for(var i = 0;i<GameManager.getEntityList().listSize();i++)
			if(GameManager.getEntityList().getObject(i) is MovieClip && GameManager.getEntityList().getObject(i)!=this && !(GameManager.getEntityList().getObject(i) is Paper))
			if(x+width/2+xVelocity>((MovieClip)(GameManager.getEntityList().getObject(i))).x-((MovieClip)(GameManager.getEntityList().getObject(i))).width/2 && x<((MovieClip)(GameManager.getEntityList().getObject(i))).x+((MovieClip)(GameManager.getEntityList().getObject(i))).width/2 && y+height/2>((MovieClip)(GameManager.getEntityList().getObject(i))).y-((MovieClip)(GameManager.getEntityList().getObject(i))).height/2 && y<((MovieClip)(GameManager.getEntityList().getObject(i))).y+((MovieClip)(GameManager.getEntityList().getObject(i))).height/2)
			return false;
			if(x+width/2>544)
			return false;
			return true;
		}
		public override function canMoveDown():Boolean
		{
			for(var i = 0;i<GameManager.getEntityList().listSize();i++)
			if(GameManager.getEntityList().getObject(i) is MovieClip && GameManager.getEntityList().getObject(i)!=this && !(GameManager.getEntityList().getObject(i) is Paper))
			if(x+width/2>((MovieClip)(GameManager.getEntityList().getObject(i))).x-((MovieClip)(GameManager.getEntityList().getObject(i))).width/2 && x-width/2<((MovieClip)(GameManager.getEntityList().getObject(i))).x+((MovieClip)(GameManager.getEntityList().getObject(i))).width/2 && y+yVelocity+height/2>((MovieClip)(GameManager.getEntityList().getObject(i))).y-((MovieClip)(GameManager.getEntityList().getObject(i))).height/2 && y<((MovieClip)(GameManager.getEntityList().getObject(i))).y+((MovieClip)(GameManager.getEntityList().getObject(i))).height/2)
			return false;
			return true;
		}
		public override function canMoveLeft():Boolean
		{
			for(var i = 0;i<GameManager.getEntityList().listSize();i++)
			if(GameManager.getEntityList().getObject(i) is MovieClip && GameManager.getEntityList().getObject(i)!=this && !(GameManager.getEntityList().getObject(i) is Paper))
			if(x+width/2>((MovieClip)(GameManager.getEntityList().getObject(i))).x-((MovieClip)(GameManager.getEntityList().getObject(i))).width/2 && x-width/2-xVelocity<((MovieClip)(GameManager.getEntityList().getObject(i))).x+((MovieClip)(GameManager.getEntityList().getObject(i))).width/2 && y+height/2>((MovieClip)(GameManager.getEntityList().getObject(i))).y-((MovieClip)(GameManager.getEntityList().getObject(i))).height/2 && y<((MovieClip)(GameManager.getEntityList().getObject(i))).y+((MovieClip)(GameManager.getEntityList().getObject(i))).height/2)
			return false;
			if(x-width/2<4)
			return false;
			return true;
		}
		public override function moveRight():void
		{
			super.moveRight();
			if(!facingRight)
			facingRight = true;
			if(!moving)
			moving = true;
		}
		public override function moveLeft():void
		{
			super.moveLeft();
			if(facingRight)
			facingRight = false;
			if(!moving)
			moving = true;
		}
		public function jump():void
		{
			if(!jumping && !canMoveDown())
			{
				jumpHeight = y-60;
				jumping = true;
			}
		}
	}
}
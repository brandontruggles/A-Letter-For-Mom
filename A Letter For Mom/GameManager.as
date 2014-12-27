package  
{
	import flash.display.Stage;
	public class GameManager
	{
		private static var entityList:ArrayList;
		private static var mainTimeline:Object;
		private static var completedLevelsCounter:Number;
		private static var levelOneComplete:Boolean;
		private static var levelTwoComplete:Boolean;
		private static var levelThreeComplete:Boolean;
		private static var levelFourComplete:Boolean;
		private static var levelFiveComplete:Boolean;
		private static var levelSixComplete:Boolean;
		public static function init(t:Object):void
		{
			entityList = new ArrayList();
			mainTimeline = t;
			levelOneComplete = false;
			levelTwoComplete = false;
			levelThreeComplete = false;
			levelFourComplete = false;
			levelFiveComplete = false;
			levelSixComplete = false;
			completedLevelsCounter = 0;
		}
		public static function addEntity(o:Object):void
		{
			entityList.addObject(o);
		}
		public static function getEntityList():ArrayList
		{
			return entityList;
		}
		public static function setLevelOneComplete(b:Boolean):void
		{
			levelOneComplete = b;
		}
		public static function setLevelTwoComplete(b:Boolean):void
		{
			levelTwoComplete = b;
		}
		public static function setLevelThreeComplete(b:Boolean):void
		{
			levelThreeComplete = b;
		}
		public static function setLevelFourComplete(b:Boolean):void
		{
			levelFourComplete = b;
		}
		public static function setLevelFiveComplete(b:Boolean):void
		{
			levelFiveComplete = b;
		}
		public static function setLevelSixComplete(b:Boolean):void
		{
			levelSixComplete = b;
		}
		public static function getLevelOneComplete():Boolean
		{
			return levelOneComplete;
		}
		public static function getLevelTwoComplete():Boolean
		{
			return levelTwoComplete;
		}
		public static function getLevelThreeComplete():Boolean
		{
			return levelThreeComplete;
		}
		public static function getLevelFourComplete():Boolean
		{
			return levelFourComplete;
		}
		public static function getLevelFiveComplete():Boolean
		{
			return levelFiveComplete;
		}
		public static function getLevelSixComplete():Boolean
		{
			return levelSixComplete;
		}
		public static function endCurrentLevel():void
		{
			completedLevelsCounter++;
			while(entityList.listSize()>0)
			{
				if(entityList.getObject(0) is GameEntity)
				((GameEntity)(entityList.getObject(0))).removeFromParent();
				entityList.removeObject(entityList.getObject(0));
			}
			if(completedLevelsCounter<6)
			mainTimeline.gotoAndStop(3);
			else
			mainTimeline.gotoAndStop(10);
		}
		public static function resetGame():void
		{
			completedLevelsCounter = 0 ;
			setLevelOneComplete(false);
			setLevelTwoComplete(false);
			setLevelThreeComplete(false);
			setLevelFourComplete(false);
			setLevelFiveComplete(false);
			setLevelSixComplete(false);
			mainTimeline.gotoAndStop(1);
		}
	}
	
}
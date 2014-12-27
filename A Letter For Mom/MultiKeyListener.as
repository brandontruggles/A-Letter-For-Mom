package  
{	
	import flash.events.KeyboardEvent;
	public class MultiKeyListener 
	{
		private var keyList:ArrayList;
		private var myEntity:GameEntity;
		public function MultiKeyListener(e:GameEntity)
		{
			keyList = new ArrayList();
			myEntity = e;
			e.stage.addEventListener(KeyboardEvent.KEY_DOWN,addKey);
			e.stage.addEventListener(KeyboardEvent.KEY_UP,removeKey);
		}
		private function addKey(evt:KeyboardEvent):void
		{
			if(!keyList.containsObject(evt.keyCode))
			keyList.addObject(evt.keyCode);
		}
		private function removeKey(evt:KeyboardEvent):void
		{
			if(keyList.containsObject(evt.keyCode))
			keyList.removeObject(evt.keyCode);
		}
		public function getKeyList():ArrayList
		{
			return keyList;
		}
		public function removeListeners():void
		{
			myEntity.removeEventListener(KeyboardEvent.KEY_DOWN,addKey);
			myEntity.removeEventListener(KeyboardEvent.KEY_UP,removeKey);
		}
	}
}
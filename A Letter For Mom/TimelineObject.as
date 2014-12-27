package 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	public class TimelineObject extends MovieClip
	{
		public function TimelineObject()
		{
			
		}
		public function addToParent(p:Object):void
		{
			p.addChild(this);
			p.addEventListener(Event.ENTER_FRAME,tick);
		}
		public function removeFromParent():void
		{
			if(parent!=null)
			{
				removeListeners();
				parent.removeChild(this);
			}
		}
		public function tick(evt:Event):void
		{
			
		}
		public function removeListeners():void
		{
			parent.removeEventListener(Event.ENTER_FRAME,tick);
		}
	}
	
}
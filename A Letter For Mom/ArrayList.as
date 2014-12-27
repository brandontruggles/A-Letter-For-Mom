package  
{
	public class ArrayList 
	{
		private var array:Array;
		public function ArrayList() 
		{
			array = new Array();
		}
		public function addObject(item):void
		{
			array.push(item);
		}
		public function getObject(i:Number)
		{
			return array[i];
		}
		public function indexOfObject(item):Number
		{
			return array.indexOf(item);
		}
		public function listSize():Number
		{
			return array.length;
		}
		public function containsObject(item):Boolean
		{
			var found:Boolean = false;
			for(var i = 0;i<array.length;i++)
			if(array[i] == item)
			found = true;
			return found;
		}
		public function removeObject(item):void
		{
			var tempArray:Array = array;
			array = new Array();
			for(var i = 0;i<tempArray.length;i++)
			if(tempArray[i]!=item)
			array.push(tempArray[i]);
		}
		public function toString():String
		{
			return ""+array;
		}
	}
	
}
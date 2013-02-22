package view.event
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		/**
		 * add story
		 */ 
		public static const ADD_STORY:String = "AddStory";
		
		public static const MANAGE_STORY:String = "ManageStory";
		
		public static const EDIT_STORY:String = "EditStory";
		
		public function AppEvent(type:String, data:Object)
		{
			super(type);
			this.data = data;
		}

		/**
		 * the data in this event
		 */ 
		private var _data:Object;
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

	}
}
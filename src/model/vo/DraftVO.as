package model.vo
{
	public class DraftVO extends ValueObject
	{
		public static const ELEMENT:String = "Draft";
		
		public function DraftVO( xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		private var _isCurrent:Boolean;

		public function get isCurrent():Boolean
		{
			return this.xml.@isCurrent == "true";
		}

		public function set isCurrent(value:Boolean):void
		{
			this.xml.@isCurrent = value;
		}

	}
}
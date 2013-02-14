package model.vo
{
	public class CharacterVO extends ValueObject
	{
		public static const ELEMENT:String = "Character";
		
		public function CharacterVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		private var _egramType:Number;

		public function get egramType():Number
		{
			return Number(this.xml.@egramType);
		}

		public function set egramType(value:Number):void
		{
			this.xml.@egramType = value;
		}
		
		private var _egramCenter:Number;

		public function get egramCenter():Number
		{
			return Number(this.xml.@egramCenter);
		}

		public function set egramCenter(value:Number):void
		{
			this.xml.@egramCenter = value;
		}

		private var _egramLevel:Number;

		public function get egramLevel():Number
		{
			return Number(this.xml.@egramLevel;
		}

		public function set egramLevel(value:Number):void
		{
			this.xml.@egramLevel = value;
		}

	}
}
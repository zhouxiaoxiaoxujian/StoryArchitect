package model.enum
{
	[Bindable]public class Enum
	{
		public function Enum( ordinal:Number, name:String, description:String )
		{
			this.name = name;
			this.ordinal = ordinal;
			this.description = description;
		}
		
		public function equals( enum:Enum ):Boolean
		{
			return ((this.name == enum.name) &&
					(this.ordinal == enum.ordinal) &&
					(this.description == enum.description) );
		}
		public var name:String;
		public var ordinal:Number;
		public var description:String;
	}
}
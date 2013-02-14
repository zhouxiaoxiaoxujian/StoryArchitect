package model.vo
{
	public class CastVO extends ValueObject
	{
		public static const ELEMENT:String = "Cast";
		
		public function CastVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		public function addCharacter( characterVO:CharacterVO ):void
		{
			this.xml.appendChild( characterVO.xml );
		}
	}
}
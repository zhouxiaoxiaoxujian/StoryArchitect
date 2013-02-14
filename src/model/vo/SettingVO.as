package model.vo
{
	public class SettingVO extends ValueObject
	{
		public static const ELEMENT:String = "Setting";
		
		public function SettingVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
	}
}
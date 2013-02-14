package model.vo
{
	public class MilieuVO extends ValueObject
	{
		public static const ELEMENT:String = "Milieu";
		
		public function MilieuVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		private var _setting:SettingVO;

		public function get setting():SettingVO
		{
			return _setting;
		}

		public function set setting(value:SettingVO):void
		{
			this.xml.appendChild(value.xml);
		}

	}
}
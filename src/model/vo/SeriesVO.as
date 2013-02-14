package model.vo
{
	public class SeriesVO extends ValueObject
	{
		public static const ELEMENT:String = "Series";
		
		public function SeriesVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
	}
}
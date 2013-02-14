package model.vo
{
	public class PartVO extends ValueObject
	{
		public static const ELEMENT:String = "Part";
		
		public function PartVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		public function addChapter( chapterVO:ChapterVO ):void
		{
			this.xml.appendChild( chapterVO.xml );
		}
		
		public function getText( includeHeading:Boolean = false ):String
		{
			var text:String = includeHeading == true ? name + DOUBLE_SPACE : "";
			return text;
		}
	}
}
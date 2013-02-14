package model.vo
{
	public class ChapterVO extends ValueObject
	{
		public static const ELEMENT:String = "Chapter";
		
		public function ChapterVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		public function addScene( sceneVO:SceneVO ):void
		{
			this.xml.appendChild( sceneVO.xml );
		}
		
		public function getText( includeHeading:Boolean = false):String
		{
			var text:String = includeHeading == true ? name + DOUBLE_SPACE : "";
		}
	}
}
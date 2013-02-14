package model.vo
{
	public class SceneVO extends ValueObject
	{
		public static const ELEMENT:String = "Scene";
		public function SceneVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		public function addDraft( draftVO:DraftVO ):void
		{
			this.xml.appendChild( draftVO.xml );
		}
		
		public function getText(includeHeading:Boolean = false):String
		{
			var text:String = includeHeading == true ? name + DOUBLE_SPACE : "";
			return text;
		}
	}
}
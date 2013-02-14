package model.vo
{
	import mx.utils.StringUtil;
	
	import model.enum.StoryTypeEnum;

	public class StoryVO extends ValueObject
	{
		public static const ELEMENT:String = "Story";
		
		public function StoryVO(xml:XML=null)
		{
			super(ELEMENT, xml);
		}
		
		public function set cast ( c:CastVO ):void
		{
			this.xml.appendChild( c.xml );
		}
		
		public function get cast():CastVO 
		{
			var castXML:XML = this.xml.child(CastVO.ELEMENT)[0];
			return castXML != null ? new CastVO( castXML ) : null;
		}
		
		public function set milieu( m:MilieuVO ):void
		{
			this.xml.appendChild( m.xml );
		}
		
		public function get milieu():MilieuVO {
			var milieuXML:XML = this.xml.child(MilieuVO.ELEMENT)[0];
			return milieuXML != null ? new MilieuVO( milieuXML ) : null;
		}
		
		public function get series():SeriesVO {
			var seriesXML:XML = this.xml.child(SeriesVO.ELEMENT)[0];
			return seriesXML != null ? new  SeriesVO( seriesXML ) : null;
		}
		
		public function get isEpisode():Boolean
		{
			return ( this.xml.child(SeriesVO.ELEMENT)[0] == null);
		}
		
		public function get type():StoryTypeEnum 
		{
			return ( this.xml.@type != undefined ) ? StoryTypeEnum.list[ Number( x.@type ) ]: null;
		}
		
		public function set type( t:StoryTypeEnum ):void
		{
			this.xml.@type = t.ordinal;
		}
		
		public function get useScenes():Boolean
		{
			return ( this.type == StoryTypeEnum.SIMPLE );
		}
		
		public function set useScenes(u:Boolean):void
		{
			this.type = StoryTypeEnum.SIMPLE;
		}
		
		public function get useChapters():Boolean
		{
			return ( this.type == StoryTypeEnum.NORMAL );
		}
		
		public function set useChapters(u:Boolean):void
		{
			this.type = StoryTypeEnum.NORMAL;
		}
		
		public function get useParts():Boolean
		{
			return ( this.type == StoryTypeEnum.COMPLEX );
		}
		
		public function set userParts(u:Boolean):void
		{
			this.type = StoryTypeEnum.COMPLEX;
		}
		
		public function get scenes():Vector.<SceneVO>
		{
			var v:Vector.<SceneVO> = new Vector.<SceneVO>();
			var xl:XMLList = xml..Scene;
			for each( var sx:XML in xl )
			{
				var scene:SceneVO = new SceneVO(sx);
				v.push(scene);
			}
			return v;
		}
		
		public function get chapters():Vector.<ChapterVO>
		{
			var v:Vector.<ChapterVO> = new Vector.<ChapterVO>();
			var xl:XMLList = xml..Chapter;
			for  each( var cx:XML in xl )
			{
				var chapter:ChapterVO = new ChapterVO(cx);
				v.push(chapter);
			}
			v.sort(ValueObject.ordinalSort);
			return v;
		}
		
		public function get parts():Vector.<PartVO>
		{
			var v:Vector.<PartVO> = new Vector.<PartVO>();
			if (useParts ) {
				var xl:XMLList = xml.child(PartVO.ELEMENT);
				for each( var px:XML in xl )
				{
					var part:PartVO = new PartVO(px);
					v.push(part);
				}
				v.sort(ValueObject.ordinalSort);
			}
			return v;
		}
		
		public function getNewScene():SceneVO
		{
			var scene:SceneVO = new SceneVO();
			this.addScene(scene);
			return scene;
		}
		
		public function getNewChapter():ChapterVO
		{
			var chapter:ChapterVO = new ChapterVO();
			this.addChapter(chapter);
			return chapter;
		}
		
		public function getNewPart():PartVO
		{
			var part:PartVO = new PartVO();
			this.addPart(part);
			return part;
		}
		
		public function addScene( scene:SceneVO ):void
		{
			if ( scene.ordinal > 0 && scene.ordinal < nextPartOrdinal ) {
				var scenes:Vector.<SceneVO> = this.scenes;
				for each( var svo:SceneVO in scenes)
				{
					if (svo.ordinal >= scene.ordinal) svo.ordinal++;
				}
			}
			else
			{
				scene.ordinal = nextSceneOrdinal;
			}
			xml.appendChild( scene.xml );
			this.useScenes = true;
		}
		
		public function addChapter( chapter:ChapterVO ):void
		{
			if (chapter.ordinal > 0 && chapter.ordinal < nextChapterOrdinal )
			{
				var chapters:Vector.<ChapterVO> = this.chapters;
				for each( var cvo:ChapterVO in chapters )
				{
					if ( cvo.ordinal >= chapter.ordinal ) cvo.ordinal++;
				}
			}
			else
			{
				chapter.ordinal = nextChapterOrdinal;
			}
			xml.appendChild( chapter.xml );
			this.useChapters = true;
		}
		
		public function addPart( part:PartVO ):void
		{
			if( part.ordinal > 0 && part.ordinal < nextPartOrdinal )
			{
				var parts:Vector.<PartVO> = this.parts;
				for each( var pvo:PartVO in parts ) {
					if(pvo.ordinal >= part.ordinal) pvo.ordinal++;
				}
			}
			else
			{
				part.ordinal = nextPartOrdinal;
			}
			xml.appendChild( part.xml );
			this.useParts = true;
		}
		
		public function getText( includeHeading:Boolean = false ):String
		{
			var text:String = includeHeading == true ? name + DOUBLE_SPACE : "";
			if (this.useParts )
			{
				var partList:Vector.<PartVO> = parts;
				if ( partList.length > 1 )
				{
					for each( var pvo:PartVO in partList )
					{
						text += pvo.getText(true) + DOUBLE_SPACE;
					}
				}
				else if( partList.length == 1 )
				{
					text += PartVO(partList[0]).getText(false);
				}
			}
			else if (this.useChapters)
			{
				var chapterList:Vector.<ChapterVO> = chapters;
				if(chapterList.length > 1)
				{
					for each( var cvo:ChapterVO in chapterList)
					{
						text += cvo.getText(true) + DOUBLE_SPACE;
					}
				}
				else if( chapterList.length == 1)
				{
					text += ChapterVO(chapterList[0]).getText(false);
				}
			}
			else if(this.useScenes)
			{
				var sceneList:Vector.<SceneVO> = scenes;
				if ( sceneList.length > 1)
				{
					for each( var svo:SceneVO in sceneList )
					{
						text += svo.getText(true) + DOUBLE_SPACE;
					}
				}
				else if ( sceneList.length == 1 )
				{
					text += SceneVO(sceneList[0]).getText(false);
				}
			}
			
			return StringUtil.trim( text );
		}
		
		public function get wordCount():Number
		{
			var wc:Number = 0;
			var storyText:String = getText(false);
			if ( storyText.length > 0 )
			{
				wc = storyText.split(/\s+/g).length;
			}
			return wc;
		}
		
		private function get nextPartOrdinal():Number
		{
			return this.getNextOrdinal( xml..Part);
		}
		
		private function get nextChapterOrdinal():Number
		{
			return this.getNextOrdinal( xml..Chapter);
		}
		
		private function get nextSceneOrdinal():Number
		{
			return this.getNextOrdinal( xml..Scene);
		}
	}
}
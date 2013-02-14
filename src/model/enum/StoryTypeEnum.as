package model.enum
{
	import mx.collections.ArrayCollection;

	public class StoryTypeEnum extends Enum
	{
		public static const NONE:StoryTypeEnum = 
				new StoryTypeEnum( -1, "--None Selected--", "Choose a Story Type");
		
		public static const SIMPLE:StoryTypeEnum =
				new StoryTypeEnum( 0, "Simple", "Scenes only");
		
		public static const NORMAL:StoryTypeEnum = 
				new StoryTypeEnum( 1, "Normal", "Chapters and Scenes");
		
		public static const COMPLEX:StoryTypeEnum = 
				new StoryTypeEnum( 2, "Complex", "Chapters, Parts, and Scenes");
		
		public function StoryTypeEnum(ordinal:Number, name:String, description:String)
		{
			super(ordinal, name, description);
		}
		
		public static function get list():Array
		{
			return [ SIMPLE, NORMAL, COMPLEX ];
		}
		
		public static function get comboList():ArrayCollection
		{
			return new ArrayCollection( [ NONE ].concat( list );
		}
		
		override public function equals(enum:Enum):Boolean
		{
			return (enum is StoryTypeEnum &&  super.equals( enum ));
		}
	}
}
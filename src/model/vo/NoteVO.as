package model.vo
{
	[Bindable]public class NoteVO
	{
		/**
		 * The XML element name. 
		 */		
		public static const ELEMENT:String = "Note";
		
		/**
		 * Construct for NoteVO 
		 * @param xml
		 * 
		 */		
		public function NoteVO( xml:XML = null )
		{
			this.xml = (xml != null) ? xml : <{ELEMENT}/>;
		}
		
		/**
		 * The text of this Note. 
		 * @param t
		 * 
		 */		
		public function set text( t:String ):void
		{
			this.x.setChildren(t);
		}
		
		public function get text():String
		{
			return this.xml.toString();
		}
		
		public function set url( u:String ):void
		{
			this.xml.@url = u;
		}
		
		public function get url():String
		{
			return this.xml.@url;
		}
		
		public function set xml( data:XML ):void
		{
			this.x = data;	
		}
		
		public function get xml():XML
		{
			return x;
		}
		
		protected var x:XML;
	}
}
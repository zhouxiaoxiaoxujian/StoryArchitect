package model.vo
{
	[Bindable]public class ValueObject
	{
		public static const DOUBLE_SPACE:String = "\n\n";
		public static const DASH:String = "-";
		public static const SPACE:String = " ";
		
		public function ValueObject( element:String, xml:XML = null)
		{
			this.xml = validateOrProvideDefault( element, xml );
		}
		
		public function getStub():XML
		{
			var stub:XML = validateOrProvideDefault( xml.localName() );
			var vo:ValueObject = new ValueObject( xml.localName(), stub);
			vo.isStub = true;
			vo.uid = this.uid;
			vo.name = this.name;
			vo.ordinal = this.ordinal;
			vo.description = this.description;
			return stub;
		}
		
		/**
		 * The name of the Value Object. If no name is set,
		 * element and ordinal attribute are concatenated. 
		 * @param n
		 * 
		 */		
		public function set name( n:String ):void
		{
			this.xml.name = n;
		}
		
		public function get name():String
		{
			return (String(xml.name) != "") ?
					String(xml.name) : String(xml.localName()+SPACE+ordinal);
		}
		
		/**
		 * Ordinal location of this Value Object within the collection. 
		 * @param o
		 * 
		 */		
		public function set ordinal( o:Number ):void
		{
			xml.@ordinal = o;
		}
		
		public function get ordinal():Number
		{
			return Number(xml.@ordinal);
		}
		
		/**
		 * Unique identifier for this Value Object 
		 * @param u
		 * 
		 */		
		public function set uid( u:String ):void
		{
			xml.@uid = u;
		}
		
		public function get uid():String
		{
			return String(xml.@uid);
		}
		
		/**
		 * Is this ValueObject an unpopulated stub? 
		 * @param s
		 * 
		 */		
		public function set isStub( s:Boolean ):void
		{
			xml.@isStub = s;
		}
		
		public function get isStub():Boolean
		{
			return Boolean(xml.@isStub == "true");
		}
		
		/**
		 * A short description of this ValueObject 
		 * @param d
		 * 
		 */		
		public function set description( d:String ):void
		{
			xml.description = d;
		}
		
		public function get description():String
		{
			return String(xml.description);
		}
		
		/**
		 * An Vector of a ValueObject's NoteVOs. 
		 * @return 
		 * 
		 */		
		public function get notes():Vector.<NoteVO>
		{
			var v:Vector.<NoteVO> = new Vector.<NoteVO>();
			var xl:XMLList = xml.child(NoteVO.ELEMENT);
			for each( var nx:XML in xl)
			{
				var note:NoteVO = new NoteVO(nx);
				v.push(note);
			}
			return v;
		}
		
		public function set notes( v:Vector.<NoteVO> ):void
		{} //read-only but bindable
		
		/**
		 * Add a Note the ValueObject 
		 * @param note
		 * 
		 */		
		public function addNote( note:NoteVO ):void
		{
			xml.appendChild( note.xml );
		}
		
		public function set xml( x:XML ):void
		{
			this.x = x;
		}
		
		public function get xml():XML
		{
			return x;
		}
		
		protected var x:XML;
		
		public static function ordinalSort( v1:ValueObject, v2:ValueObject ):Number
		{
			var retval:Number = 0;
			if (v1.ordinal < v2.ordinal ) { retval = -1; }
			else if(v1.ordinal > v2.ordinal) { retval = 1; }
			return retval;
		}
		
		public static function nameSort( v1:ValueObject, v2:ValueObject):Number
		{
			var retval:Number = 0;
			if( v1.name < v2.name ) { retval = -1; }
			else if(v1.name > v2.name) {retval = 1; }
			return retval;
		}
		
		protected function getNextOrdinal( xl:XMLList ):Number
		{
			var n:Number = 0;
			var x:XML;
			for each( x in xl) {
				var o:Number = Number(x.@ordinal);
				if( o > n) n = o;
			}
			return ++n;
		}
		
		protected function validateOrProvideDefault( elementName:String, xml:XML ):XML
		{
			if (xml == null || xml.localName() != elementName) {
				var u:String = elementName + DASH + new Date().time + 
								DASH + uidRuntimeUniquifier++;
				xml = <{elementName} uid={u}/>;
			}
			return xml;
		}
		
		/**
		 * Number of unique Value Objects created this runtime.
		 * Used to ensure two objects of the same type created
		 * within the same millisecond will have a unique uid. 
		 */		
		protected static var uidRuntimeUniquifier:Number = 0;
	}
}
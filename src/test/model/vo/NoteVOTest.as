package test.model.vo
{
	import flexunit.framework.Assert;
	
	import model.vo.NoteVO;

	public class NoteVOTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test] public function testNoteVOWithXML():void
		{
			var url:String = "http://google.com";
			var text:String = "Some stuff I'm keeping in the cloud.";
			var xml:XML = <Note url={url}>{text}</Note>;
			var vo:NoteVO = new NoteVO(xml);
			if (! vo is NoteVO ) Assert.fail("Construction with xml failed");
			if ( vo.text != text ) Assert.fail("text match failed");
			if ( vo.url != url ) Assert.fail("url match failed");
		}
		
		[Test]public function testNoteVOWithoutXML():void
		{
			var vo:NoteVO = new NoteVO();
			if (! vo is NoteVO) Assert.fail("Construction without xml failed");
			if ( vo.xml.localName() != NoteVO.ELEMENT )
				Assert.fail("default xml not provided");
		}
		
		[Test]public function testSet_text():void
		{
			var text:String = "Bunnies are nice!";
			var vo:NoteVO = new NoteVO();
			vo.text = text;
			if ( vo.text != text ) Assert.fail("text match failed");
		}
		
		[Test] public function testSet_url():void {
			var url:String = "http://puremvc.org";
			var vo:NoteVO = new NoteVO();
			vo.url = url;
			if ( vo.url != url ) Assert.fail("url match failed");
		}
		[Test] public function testSet_xml():void {
			var url:String = "http://puremvc.org";
			var text:String = "Code at the Speed of Thought!";
			var xml:XML = <Note url={url}>{text}</Note>;
			var vo:NoteVO = new NoteVO();
			vo.xml = xml;
			if ( vo.text != text ) Assert.fail("text match failed"); if ( vo.url != url ) Assert.fail("url match failed");
		}
	}
}
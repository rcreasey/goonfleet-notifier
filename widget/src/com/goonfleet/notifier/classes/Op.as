package com.goonfleet.notifier.classes
{
	
	public class Op
	{
		[Bindable]
		public var title:String;
		
		[Bindable]
		public var startTime:Date;
		
		[Bindable]
		public var endTime:Date;
		
		[Bindable]
		public var priority:String;
		
		[Bindable]
		public var bgColor:uint;
		
		[Bindable]
		public var thread:String;
		
		[Bindable]
		public var formUp:String;
		
		[Bindable]
		public var shipTypes:String;
		
		[Bindable]
		public var text:String;
		
		[Bindable]
		public var poster:String;
		
		
		public function Op(op:Object)
		{
			title = op.title;
			startTime = parseDate(op.startTime);
			endTime = parseDate(op.endTime);
			priority = op.priority;
			thread = op.thread;
			formUp = op.formup;
			shipTypes = op.shiptypes;
			text = op.text;
			poster = op.poster;
			
			switch (priority) {
				case "important":
					bgColor = 0xffff00;
					break;
				case "critical":
					bgColor = 0xff0000;
					break;
				default:
					bgColor = undefined;
			}
		}
		
		private function parseDate(dateString:String):Date {
			var pattern:RegExp = /-/;
			
			// Replace the first 2 dashes with slashes
			dateString = dateString.replace(pattern, "/");
			dateString = dateString.replace(pattern, "/");
			
			return new Date(dateString);
		}
	}
}
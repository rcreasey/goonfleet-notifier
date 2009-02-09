package com.goonfleet.notifier.business
{
	import com.goonfleet.notifier.classes.Op;
	
	import mx.collections.ArrayCollection;
		
	
	// --------------------------------------------
	// This helper class parses data coming from the
	// notification XML file and converts it into 
	// an object
	
	public class NotificationServiceParser
	{		
		public function parseNotificationResults(notification:Object):Object {
			
			var notificationObject:Object = new Object();
			
			notificationObject.eveTime = parseDate(notification.opapp.timedata.evetime);
			
			notificationObject.ops = new ArrayCollection;
			
			for each (var op:Object in notification.opapp.ops.op) {
				
				notificationObject.ops.addItem(new Op(op));
			}
			
			return notificationObject;
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
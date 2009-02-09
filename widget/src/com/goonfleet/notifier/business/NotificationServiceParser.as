package com.goonfleet.notifier.business
{	
	
	// --------------------------------------------
	// This helper class parses data coming from the
	// notification XML file and converts it into 
	// an object
	
	public class NotificationServiceParser
	{		
		public function parseNotificationResults(notification:Object):Object {
			
			var notificationObject:Object = new Object();
			trace(notification.opapp.timedata.evetime);
			notificationObject.eveTime = parseDate(notification.opapp.timedata.evetime);
			
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
package com.goonfleet.notifier.business
{
	import com.goonfleet.notifier.classes.*;
	
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
			
			notificationObject.ops = new ArrayCollection();
			
			if (notification.opapp.ops.op.length == undefined) {
				notificationObject.ops.addItem(new Op(notification.opapp.ops.op));
			} else {
				for each (var op:Object in notification.opapp.ops.op) {
					notificationObject.ops.addItem(new Op(op));
				}
			}
			
			notificationObject.notices = new ArrayCollection();
			
			if (notification.opapp.notices.notice.length == undefined) {
				notificationObject.notices.addItem(new Notice(notification.opapp.notices.notice));
			} else {
				for each (var notice:Object in notification.opapp.notices.notice) {
					notificationObject.ops.addItem(new Notice(notice));
				}
				notificationObject.notices = notification.opapp.notices.notice;
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
<?php

class DBNotification extends Prefab {

    public function markNotificationAsRead($notificationID) {
        Database::instance()->exec('UPDATE notifications SET read = "true" WHERE notification_id = :notification_id', array(':notification_id' => $notificationID)
        );
    }

    public function getNotificationsForLoginId($loginId) {
        $notifications = array();

        $notificationsDetails = Database::instance()->exec('SELECT notification_id FROM notifications WHERE recipient_id = :login_id AND read = "false" ORDER BY notification_id DESC',
            array(':login_id' => $loginId)
        );

        foreach ($notificationsDetails as $details) {
            $notifications[] = new Notification($details['notification_id']);
        }

        return $notifications;
    }

}
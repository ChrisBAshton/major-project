<?php

class MockAccount implements AccountInterface {
    public function __construct($account = NULL) {

    }
    public function getLoginId() {
        return false;
    }
    public function getEmail() {
        return false;
    }
    public function getName() {
        return false;
    }
    public function getNotifications() {
        return false;
    }
    public function __toString() {
        return 'Mock Account';
    }
    public function getAllDisputes() {
        return array();
    }
}

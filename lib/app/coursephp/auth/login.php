<?php
include "../connect.php";

$email=filterrequest("email");
$password=filterrequest("password");
$stmt=$con->prepare("SELECT * FROM `user` WHERE `email` =? AND `password`=?");
$stmt ->execute(array($email,$password));
$count=$stmt->rowCount();
if($count>0){echo json_encode(array('status'=>"successful"));}
else {echo json_encode(array("status"=>"fail"));}





?>
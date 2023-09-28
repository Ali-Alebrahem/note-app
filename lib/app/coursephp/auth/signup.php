<?php

include "../connect.php";
$name=filterrequest("name");
$email=filterrequest("email");
$password=filterrequest("password");
$stmt=$con->prepare("INSERT INTO `user`(`username`,`email`,`password`) VALUES (?,?,?)") ;
$stmt ->execute(array($name,$email,$password));

$count=$stmt->rowCount();
if($count>0){echo json_encode(array('status'=>"successful"));}
else echo json_encode(array("status"=>"fail"));
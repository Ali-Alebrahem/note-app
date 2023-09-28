<?php
include "../connect.php";

$id=filterrequest("id");
$imagename=filterRequest("imagename");
$stmt=$con->prepare("DELETE FROM `notes` WHERE `id`=?") ;

$stmt ->execute(array($id));

$count=$stmt->rowCount();
if($count>0){deleteFile("../upload",$imagename);echo json_encode(array('status'=>"success"));}
else {echo json_encode(array("status"=>"fail"));}

?>
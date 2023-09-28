<?php
include "../connect.php";

$title=filterRequest('title');
$des=filterRequest('des');
$imagename=imageUpload('file');
$userid=filterRequest('userid');
if($imagename !="fail"){
$stmt=$con->prepare("INSERT INTO `notes`(`note_title`,`note_des`,`image`,`note_user`) VALUES (?,?,?,?)");
$stmt->execute(array($title,$des,$imagename,$userid));
$row=$stmt->rowCount();
if($row>0){echo json_encode(array('status'=>'success'));
}

else{echo json_encode(array('status'=>'fail'));}
}
else{echo json_encode(array('status'=>'fail'));}



?>
<?php

define('MB',1048576);

function filterRequest($requestname){
    return htmlspecialchars(strip_tags($_POST[$requestname]));

}

function imageUpload($imagerequest){
    global $msgErrpr;
    $imagename=rand(1000,10000) . $_FILES[$imagerequest]['name'];
    $imagetmp=$_FILES[$imagerequest]['tmp_name'];
    $imagesize=$_FILES[$imagerequest]['size'];
    $allowExt=array("jpg","png","gif","mp3","pdf","webp");
    $strToArray=explode(".",$imagename);
    $ext=end($strToArray);
    $ext=strtolower($ext);
    if(!empty($imagename)&& !in_array($ext,$allowExt)){
  $msgErrpr[] = "Ext";

    }
    if($imagesize > 2 * MB){
   $msgErrpr[]="size";
    }
    if(empty($msgErrpr)){
    move_uploaded_file($imagetmp,"../upload/" . $imagename);
return $imagename;


}else{return "fail";}
}

function deleteFile($dir,$imagename){
  if(file_exists($dir . "/" . $imagename)){unlink($dir . "/" . $imagename);}
}

?>
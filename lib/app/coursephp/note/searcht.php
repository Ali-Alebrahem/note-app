<?php

include "../connect.php";
$title=filterRequest('title');
 $stmt=$con->prepare("SELECT * FROM `notes` WHERE `note_title` LIKE ?");
 $stmt->execute(array("$title%"));
 $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
 $data = array_map(function($item) {
    return array(
        'title' => $item['note_title'],
        'name' => $item['note_des'],
        'id' => $item['id'],
        'image'=>$item['image']
    );
}, $data);
echo json_encode($data); 



?>
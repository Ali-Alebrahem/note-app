<?php
 include "../connect.php";
 $stmt=$con->prepare("SELECT * FROM `notes`");
 $stmt->execute();
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
<?php 

    require_once('C:/xampp/htdocs/Fitness_For_Everyone/useraccount/operations.php');
    $db = new  operations_useraccount();
    
    if(isset($_GET['D_ID']))
    {
        global $db;
        $id = $_GET['D_ID'];

        if($db->Delete_Record($id))
        {
            $db->set_messsage('<div class="alert alert-danger">  Your Record Has Been Deleted </div>');
            header("location:view.php");
        }
        else
        {
            $db->set_messsage('<div class="alert alert-danger">  Something Wrong to Delete the Record </div>'); 
        }
    }


?>
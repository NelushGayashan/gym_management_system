<?php 

  require_once('C:/xampp/htdocs/test/views/common/dbconfig.php');
    $db = new dbconfig();
    
    class  operations_customer_details extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
		$id = $db->check($_POST['id']);
                $name = $db->check($_POST['name']);
                $age = $db->check($_POST['age']);
		$height = $db->check($_POST['height']);
                $chest = $db->check($_POST['chest']);
                $weight = $db->check($_POST['weight']);
                $issues = $db->check($_POST['issues']);
                $arm_sizes = $db->check($_POST['arm_sizes']);
                $staff_id = $db->check($_POST['staff_id']);
                $customer_id = $db->check($_POST['customer_id']);
                

                if($this->insert_record($id,$name,$age,$height,$chest,$weight,$issues,$arm_sizes,$staff_id,$customer_id))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Saved Successfullly. </div>');
                    
                    echo "<script>window.location.href='view.php';</script>";
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Invalid Data. Try Again! </div>');
                }
            }
        }

        // Insert Record in the Database Using Query    
        function insert_record($id,$name,$age,$height,$chest,$weight,$issues,$arm_sizes,$staff_id,$customer_id)
        {
            global $db;
            $query = "insert into customer_details (id,name,age,height,chest,weight,issues,arm_sizes,staff_id,customer_id) values('$id','$name','$age','$height','$chest','$weight','$issues','$arm_sizes','$staff_id','$customer_id')";
            $result = mysqli_query($db->connection,$query);

            if($result)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        // View Database Record
        public function view_record()
        {
            global $db;
            $query = "select * from customer_details ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
         public function viewc1_record()
        {
            global $db;
            $query = "select d.id,d.name,d.age,d.height,d.chest,d.weight,d.issues,d.arm_sizes,d.staff_id,d.customer_id 
                        from customer_details d, customer c, useraccount u
                     where u.id = c.useraccount_id and  c.id = d.customer_id and u.id = '".$_SESSION['id']."' ";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        
        
        
         public function view2_record()
        {
            global $db;
            $query = "SELECT customer_details.staff_id,customer_details.customer_id, COUNT(customer_details.staff_id) as no_of_rows, customer_details.name , 
                        staff.fname, staff.lname FROM customer_details INNER JOIN staff ON customer_details.staff_id=staff.id GROUP BY staff_id order BY staff_id;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function viewi1_record()
        {
            global $db;
            $query = "SELECT 
                        customer_details.staff_id,customer_details.customer_id, COUNT(customer_details.staff_id) as no_of_rows,
                        customer_details.name , staff.fname, staff.lname, staff.useraccount_id 
                      FROM 
                        customer_details 
                      INNER JOIN 
                        staff 
                      ON 
                        customer_details.staff_id=staff.id 
                      WHERE 
                        staff.useraccount_id = '".$_SESSION['id']."' ;";
            
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
         public function view1_record()
        {
            global $db;
            $query = "SELECT customer_details.staff_id,customer_details.customer_id, COUNT(customer_details.staff_id) as no_of_rows, customer_details.name , 
                        staff.fname, staff.lname FROM customer_details INNER JOIN staff ON customer_details.staff_id=staff.id GROUP BY customer_details.customer_id;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from customer_details where ID='$id'";
            $data = mysqli_query($db->connection,$sql);
            return $data;

        }

        // Update Record
        public function update()
        {
            global $db;

            if(isset($_POST['btn_update']))
            {
                $id = $_POST['id'];
                $name = $db->check($_POST['name']);
                $customer_id = $db->check($_POST['customer_id']);
                $height = $db->check($_POST['height']);
                $age = $db->check($_POST['age']);
		$weight = $db->check($_POST['weight']);	
                $arm_sizes = $db->check($_POST['arm_sizes']);
                $chest = $db->check($_POST['chest']);
                
                $issues = $db->check($_POST['issues']);
                
                $staff_id = $db->check($_POST['staff_id']);
                

                if($this->update_record($id,$name,$age,$height,$chest,$weight,$arm_sizes,$issues,$staff_id,$customer_id ))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Updated Successfullly. </div>');
                    header('location: view.php');
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Invalid Data. Try Again! </div>');
                }

               
            }
        }

        // Update Function 2
        public function update_record($id,$name,$age,$height,$chest,$weight,$arm_sizes,$issues,$staff_id,$customer_id)
        {
            global $db;
            $sql = "update customer_details set name='$name', age='$age',height = '$height', chest='$chest', weight='$weight', arm_sizes = '$arm_sizes', issues = '$issues'  , staff_id = '$staff_id' , customer_id = '$customer_id' where ID='$id'";
            $result = mysqli_query($db->connection,$sql);
            if($result)
            {
                return true;
            }
            else
            {
                return false;
            }
        }



        // Set Session Message
        public function set_messsage($msg)
        {
            if(!empty($msg))
            {
                $_SESSION['Message']=$msg;
            }
            else
            {
                $msg = "";
            }
        }

        // Display Session Message
        public function display_message()
        {
            if(isset($_SESSION['Message']))
            {
                echo $_SESSION['Message'];
                unset($_SESSION['Message']);
            }
        }

        // Delete Record
        public function Delete_Record($id)
        {
            global $db;
            $query = "delete from customer_details where ID='$id'";
            $result = mysqli_query($db->connection,$query);
            if($result)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

      

    }




?>
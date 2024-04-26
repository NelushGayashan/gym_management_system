<?php 

  require_once('C:/xampp/htdocs/test/views/common/dbconfig.php');
    $db = new dbconfig();

    class  operations_customer extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {

		$id = $db->check($_POST['id']);
                $fname = $db->check($_POST['fname']);
                $lname = $db->check($_POST['lname']);
		$address = $db->check($_POST['address']);
                $telephone = $db->check($_POST['telephone']);
                $email = $db->check($_POST['email']);
                $dob = $db->check($_POST['dob']);
                $doj = $db->check($_POST['doj']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                $gender_id = $db->check($_POST['gender_id']);
               


                if($this->insert_record($id,$fname,$lname,$address,$telephone,$email,$dob,$doj,$useraccount_id,$gender_id))
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
        function insert_record($id,$fname,$lname,$address,$telephone,$email,$dob,$doj,$useraccount_id,$gender_id)
        {
            global $db;
            $query = "insert into customer (id,fname,lname,address,telephone,email,dob,doj,useraccount_id,gender_id,age) values('$id','$fname','$lname','$address','$telephone', '$email',' $dob', '$doj', '$useraccount_id', '$gender_id, 'TIMESTAMPDIFF(YEAR , dob , curdate())";
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
            $query = "select * from customer ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
         // View Database Record
        public function viewc1_record()
        {
            global $db;
            $query = "select * from 
                     customer c, useraccount u
                     where u.id = c.useraccount_id and u.id = '".$_SESSION['id']."' ORDER BY c.id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
        
          public function view2_record()
        {
            global $db;
            $query = "SELECT date_format(doj,'%Y - %M') AS MONTH , COUNT(*) COUNT FROM customer GROUP BY MONTH(doj) ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from customer where ID='$id'";
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
                $fname = $db->check($_POST['fname']);
                $lname = $db->check($_POST['lname']);
				$address = $db->check($_POST['address']);
                $telephone = $db->check($_POST['telephone']);
                
                $email = $db->check($_POST['email']);
                $dob = $db->check($_POST['dob']);
                $doj = $db->check($_POST['doj']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
               
                $gender_id = $db->check($_POST['gender_id']);

                if($this->update_record($id,$fname,$lname,$address,$telephone,$email,$dob,$doj,$useraccount_id,$gender_id))
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
        public function update_record($id,$fname,$lname,$address,$telephone,$email,$dob,$doj,$useraccount_id,$gender_id)
        {
            global $db;
            $sql = "update customer set fname='$fname', lname='$lname',address = '$address', telephone='$telephone',  email = '$email', dob = '$dob', doj = '$doj' , useraccount_id = '$useraccount_id'  , gender_id = '$gender_id'  where ID='$id'";
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
            $query = "delete from customer where ID='$id'";
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
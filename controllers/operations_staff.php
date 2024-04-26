<?php 

     require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_staff extends dbconfig
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
                $designation_id = $db->check($_POST['designation_id']);
                $email = $db->check($_POST['email']);
                $dob = $db->check($_POST['dob']);
                $doj = $db->check($_POST['doj']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                
                $gender_id = $db->check($_POST['gender_id']);
                $description = $db->check($_POST['description']);
                $useraccount_role_id = $db->check($_POST['useraccount_role_id']);


                if($this->insert_record($id,$fname,$lname,$address,$telephone,$designation_id,$email,$dob,$doj,$useraccount_id,$gender_id,$description,$useraccount_role_id ))
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
        function insert_record($id,$fname,$lname,$address,$telephone,$designation_id,$email,$dob,$doj,$useraccount_id,$gender_id,$description,$useraccount_role_id)
        {
            global $db;
            $query = "insert into staff (id,fname,lname,address,telephone,designation_id,email,dob,doj,useraccount_id,gender_id,description,useraccount_role_id) values('$id','$fname','$lname','$address','$telephone','$designation_id', '$email',' $dob', '$doj', '$useraccount_id','$gender_id', '$description', '$useraccount_role_id')";
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
            $query = "select * from staff ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
         // View Database Record
        public function viewi1_record()
        {
            global $db;
            $query = "select * from staff where staff.useraccount_id = '".$_SESSION['id']."' ";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
           public function view2_record()
        {
            global $db;
            $query = "SELECT date_format(doj,'%Y - %M') AS MONTH , COUNT(*) COUNT FROM staff GROUP BY MONTH(doj) ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from staff where ID='$id'";
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
                $designation_id = $db->check($_POST['designation_id']);
                $email = $db->check($_POST['email']);
                $dob = $db->check($_POST['dob']);
                $doj = $db->check($_POST['doj']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                
                $gender_id = $db->check($_POST['gender_id']);
                $description = $db->check($_POST['description']);
                $useraccount_role_id = $db->check($_POST['useraccount_role_id']);

                if($this->update_record($id,$fname,$lname,$address,$telephone,$designation_id,$email,$dob,$doj,$useraccount_id,$gender_id,$description,$useraccount_role_id ))
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
        public function update_record($id,$fname,$lname,$address,$telephone,$designation_id,$email,$dob,$doj,$useraccount_id,$gender_id,$description,$useraccount_role_id)
        {
            global $db;
            $sql = "update staff set fname='$fname', lname='$lname',address = '$address', telephone='$telephone', designation_id='$designation_id',  email = '$email', dob = '$dob', doj = '$doj' , useraccount_id = '$useraccount_id'  , gender_id = '$gender_id' , description = '$description' , useraccount_role_id = '$useraccount_role_id' where ID='$id'";
            $result = mysqli_query($db->connection,$sql) ;
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
            $query = "delete from staff where ID='$id'";
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
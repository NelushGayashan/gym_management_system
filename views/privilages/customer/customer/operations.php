<?php 

    require_once('C:/xampp/htdocs/test/common/dbconfig.php');
    $db = new dbconfig();

    class  operations_customer extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['btn_save']))
            {

				$id = $db->check($_POST['id']);
                $fname = $db->check($_POST['fname']);
                $lname = $db->check($_POST['lname']);
				$address = $db->check($_POST['address']);
                $telephone = $db->check($_POST['telephone']);
                $reg_date = $db->check($_POST['reg_date']);
                $email = $db->check($_POST['email']);
                $dob = $db->check($_POST['dob']);
                $doj = $db->check($_POST['doj']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                $customer_details_id = $db->check($_POST['customer_details_id']);
                $gender_id = $db->check($_POST['gender_id']);
                $register_id = $db->check($_POST['register_id']);
                $register_membership_id = $db->check($_POST['register_membership_id']);


                if($this->insert_record($id,$fname,$lname,$address,$telephone,$reg_date,$email,$dob,$doj,$useraccount_id,$customer_details_id,$gender_id,$register_id,$register_membership_id ))
                {
                    echo '<div class="alert alert-success"> Your Record Has Been Saved </div>';
                }
                else
                {
                    echo '<div class="alert alert-danger"> Failed. Please check and re-enter the IDs. </div>';
                }
            }
        }

        // Insert Record in the Database Using Query    
        function insert_record($id,$fname,$lname,$address,$telephone,$reg_date,$email,$dob,$doj,$useraccount_id,$customer_details_id,$gender_id,$register_id,$register_membership_id)
        {
            global $db;
            $query = "insert into customer (id,fname,lname,address,telephone,reg_date,email,dob,doj,useraccount_id,customer_details_id,gender_id,register_id,register_membership_id) values('$id','$fname','$lname','$address','$telephone','$reg_date', '$email',' $dob', '$doj', '$useraccount_id', '$customer_details_id','$gender_id', '$register_id', '$register_membership_id')";
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
            $query = "select * from customer";
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
                $reg_date = $db->check($_POST['reg_date']);
                $email = $db->check($_POST['email']);
                $dob = $db->check($_POST['dob']);
                $doj = $db->check($_POST['doj']);
                $useraccount_id = $db->check($_POST['useraccount_id']);
                $customer_details_id = $db->check($_POST['customer_details_id']);
                $gender_id = $db->check($_POST['gender_id']);
                $register_id = $db->check($_POST['register_id']);
                $register_membership_id = $db->check($_POST['register_membership_id']);

                if($this->update_record($id,$fname,$lname,$address,$telephone,$reg_date,$email,$dob,$doj,$useraccount_id,$customer_details_id,$gender_id,$register_id,$register_membership_id ))
                {
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Updated </div>');
                    header("location:view.php");
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-success"> Something Wrong </div>');
                }

               
            }
        }

        // Update Function 2
        public function update_record($id,$fname,$lname,$address,$telephone,$reg_date,$email,$dob,$doj,$useraccount_id,$customer_details_id,$gender_id,$register_id,$register_membership_id)
        {
            global $db;
            $sql = "update customer set fname='$fname', lname='$lname',address = '$address', telephone='$telephone', reg_date='$reg_date',  email = '$email', dob = '$dob', doj = '$doj' , useraccount_id = '$useraccount_id' , customer_details_id = '$customer_details_id' , gender_id = '$gender_id' , register_id = '$register_id' , register_membership_id = '$register_membership_id' where ID='$id'";
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
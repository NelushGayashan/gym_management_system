<?php 

      require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_register extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
		$id = $db->check($_POST['id']);
                $date = $db->check($_POST['date']);
                $remark = $db->check($_POST['remark']);
		$reg_fee = $db->check($_POST['reg_fee']);
                $membership_id = $db->check($_POST['membership_id']);
                $membership_payment_id = $db->check($_POST['membership_payment_id']);
                $customer_id = $db->check($_POST['customer_id']);

                if($this->insert_record($id,$date,$remark,$reg_fee,$membership_id,$membership_payment_id,$customer_id))
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
        function insert_record($id,$date,$remark,$reg_fee,$membership_id,$membership_payment_id,$customer_id)
        {
            global $db;
            $query = "insert into register (id,date,remark,reg_fee, membership_id,membership_payment_id,customer_id) values('$id','$date','$remark','$reg_fee','$membership_id','$membership_payment_id','$customer_id')";
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
            $query = "select * from register ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
         public function viewc1_record()
        {
            global $db;
            $query = "select r.id,r.date,r.remark,reg_fee, r.membership_id,r.membership_payment_id,r.customer_id from  
                      register r, customer c, useraccount u
                      where u.id = c.useraccount_id and  r.customer_id = c.id and u.id = '".$_SESSION['id']."' ORDER BY c.id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
         public function view1_record()
        {
            global $db;
            $query = "SELECT register.membership_id, COUNT(register.membership_id) as no_of_rows, membership.name , membership.fee FROM register INNER JOIN membership ON register.membership_id=membership.id GROUP BY membership_id;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
        
         public function view2_record()
        {
            global $db;
            $query = "SELECT date_format(date,'%Y - %M') AS MONTH , COUNT(*) COUNT FROM register GROUP BY MONTH(date) ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from register where ID='$id'";
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
                $date = $db->check($_POST['date']);
                $remark = $db->check($_POST['remark']);
				$reg_fee = $db->check($_POST['reg_fee']);
                $membership_id = $db->check($_POST['membership_id']);
                $membership_payment_id = $db->check($_POST['membership_payment_id']);
                $customer_id = $db->check($_POST['customer_id']);

                if($this->update_record($id,$date,$remark,$reg_fee,$membership_id,$membership_payment_id,$customer_id ))
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
        public function update_record($id,$date,$remark,$reg_fee,$membership_id,$membership_payment_id,$customer_id)
        {
            global $db;
            $sql = "update register set date='$date', remark='$remark',reg_fee = '$reg_fee', membership_id='$membership_id', membership_payment_id='$membership_payment_id' , customer_id = '$customer_id' where ID='$id'";
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
            $query = "delete from register where ID='$id'";
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
<?php 

    require_once('C:/xampp/htdocs/Fitness_For_Everyone/dbconfig.php');
    $db = new dbconfig();

    class  operations_payment extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['btn_save']))
            {
				$id = $db->check($_POST['id']);
                $amount = $db->check($_POST['amount']);
                $date = $db->check($_POST['date']);
                $payment_type_id = $db->check($_POST['payment_type_id']);
				$remarks = $db->check($_POST['remarks']);
                
        

                if($this->insert_record($id,$amount,$date,$remarks,$payment_type_id))
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
        function insert_record($id,$amount,$date,$remarks, $payment_type_id)
        {
            global $db;
            $query = "insert into payment (id,amount,date,remarks,payment_type_id) values('$id','$amount','$date','$remarks','$payment_type_id')";
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
            $query = "select * from payment";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from payment where ID='$id'";
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
                $amount = $db->check($_POST['amount']);
                $date = $db->check($_POST['date']);
				$remarks = $db->check($_POST['remarks']);
                $$payment_type_id = $db->check($_POST['$payment_type_id']);
            
                
        

                if($this->update_record($id,$amount,$date,$remarks,$payment_type_id))
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
        public function update_record($id,$amount,$date,$remarks, $payment_type_id)
        {
            global $db;
            $sql = "update payment set amount='$amount', date='$date',remarks = '$remarks', payment_type_id  = '$payment_type_id'where ID='$id'";
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
            $query = "delete from payment where ID='$id'";
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
<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php');
    $db = new dbconfig();

    class  operations_expenses extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
				$id = $db->check($_POST['id']);
                                $amount = $db->check($_POST['amount']);
                $date = $db->check($_POST['date']);
                $details = $db->check($_POST['details']);
				
                $payment_id = $db->check($_POST['payment_id']);
                $payment_payment_type_id = $db->check($_POST['payment_payment_type_id']);

                if($this->insert_record($id,$amount,$date,$details,$payment_id,$payment_payment_type_id))
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
        function insert_record($id,$amount,$date,$details,$payment_id,$payment_payment_type_id)
        {
            global $db;
            $query = "insert into expenses (id,amount,date,details,payment_id,payment_payment_type_id) values('$id','$amount','$date','$details','$payment_id','$payment_payment_type_id')";
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
            $query = "select * from expenses ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
         // View Database Record
        public function view1_record()
        {
            global $db;
            $query = "SELECT date_format(date,'%Y - %M') AS MONTH , SUM(amount) SUM FROM expenses GROUP BY MONTH(date) ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }


        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from expenses where ID='$id'";
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
                $details = $db->check($_POST['details']);
				$amount = $db->check($_POST['amount']);
                $payment_id = $db->check($_POST['payment_id']);
                $payment_payment_type_id = $db->check($_POST['payment_payment_type_id']);

                if($this->update_record($id,$date,$details,$amount,$payment_id,$payment_payment_type_id ))
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
        public function update_record($id,$date,$details,$amount,$payment_id,$payment_payment_type_id)
        {
            global $db;
            $sql = "update expenses set date='$date', details='$details',amount = '$amount', payment_id='$payment_id', payment_payment_type_id='$payment_payment_type_id' where ID='$id'";
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
            $query = "delete from expenses where ID='$id'";
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
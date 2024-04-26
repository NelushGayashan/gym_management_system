<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_equipment_purchases extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;

            if(isset($_POST['submit']))
            {
                $id = $_POST['id'];
                $name = $db->check($_POST['name']);
                $status = $db->check($_POST['status']);
                $remark = $db->check($_POST['remark']);
		$cost = $db->check($_POST['cost']);
                $purchased_date = $db->check($_POST['purchased_date']);
                $vendor_name = $db->check($_POST['vendor_name']);
                $quantity = $db->check($_POST['quantity']);
                $vendor_id = $db->check($_POST['vendor_id']);
                $payment_id = $db->check($_POST['payment_id']);
                $payment_payment_type_id = $db->check($_POST['payment_payment_type_id']);
               

                if($this->insert_record($id,$name,$status,$remark,$cost,$purchased_date,$vendor_name,$quantity,$vendor_id,$payment_id,$payment_payment_type_id))
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
        function insert_record($id,$name,$status,$remark,$cost,$purchased_date,$vendor_name,$quantity,$vendor_id,$payment_id,$payment_payment_type_id)
        {
            global $db;
            $query = "insert into equipment_purchases (id,name,status,remark,cost,purchased_date,vendor_name,quantity,vendor_id,payment_id,payment_payment_type_id) values('$id','$name','$status','$remark','$cost','$purchased_date','$vendor_name', '$quantity','$vendor_id', '$payment_id', '$payment_payment_type_id' )";
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
            $query = "select * from equipment_purchases ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function viewactive_record()
        {
            global $db;
            $query = "select * from equipment_purchases where status = 'Active' ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function viewdeactive_record()
        {
            global $db;
            $query = "select * from equipment_purchases where status = 'Deactive' ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
         public function view2_record()
        {
            global $db;
            $query = "SELECT vendor_id, vendor_name, COUNT(vendor_id) AS no_of_rows FROM equipment_purchases where status = 'Deactive' GROUP BY vendor_id  ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        public function view3_record()
        {
            global $db;
            $query = "SELECT vendor_id, vendor_name, COUNT(vendor_id) AS no_of_rows FROM equipment_purchases where status = 'Active' GROUP BY vendor_id  ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
        public function view4_record()
        {
            global $db;
            $query = "SELECT id, date_format(purchased_date,'%Y - %M') as month,count(id) as count , sum(cost) as sum from equipment_purchases 
                        group by month(purchased_date)
                        order by month(purchased_date) ;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from equipment_purchases where ID='$id'";
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
                $status = $db->check($_POST['status']);
                $remark = $db->check($_POST['remark']);
		$cost = $db->check($_POST['cost']);
                $purchased_date = $db->check($_POST['purchased_date']);
                $vendor_name = $db->check($_POST['vendor_name']);
                $quantity = $db->check($_POST['quantity']);
                $vendor_id = $db->check($_POST['vendor_id']);
                $payment_id = $db->check($_POST['payment_id']);
                $payment_payment_type_id = $db->check($_POST['payment_payment_type_id']);
               

                if($this->update_record($id,$name,$status,$remark,$cost,$purchased_date,$vendor_name,$quantity,$vendor_id,$payment_id,$payment_payment_type_id ))
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
        public function update_record($id,$name,$status,$remark,$cost,$purchased_date,$vendor_name,$quantity,$vendor_id,$payment_id,$payment_payment_type_id)
        {
            global $db;
            $sql = "update equipment_purchases set name='$name', status='$status', remark = '$remark', cost = '$cost', purchased_date='$purchased_date', vendor_name='$vendor_name',  quantity = '$quantity', vendor_id = '$vendor_id', payment_id = '$payment_id' , payment_payment_type_id = '$payment_payment_type_id' where ID='$id'";
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
            $query = "delete from equipment_purchases where ID='$id'";
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
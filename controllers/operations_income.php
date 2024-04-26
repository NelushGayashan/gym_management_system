<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_income extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
		$id = $db->check($_POST['id']);
                $membership_payment = $db->check($_POST['membership_payment']);
                $salary_payment = $db->check($_POST['salary_payment']);
                $equipment_expenses = $db->check($_POST['equipment_expenses']);
                $other_expenses = $db->check($_POST['other_expenses']);
                
                $date = $db->check($_POST['date']);
        
		$remark = $db->check($_POST['remark']);
                
        

                if($this->insert_record($id,$membership_payment,$salary_payment,$equipment_expenses,$other_expenses,$date,$remark))
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
        function insert_record($id,$membership_payment,$salary_payment,$equipment_expenses,$other_expenses,$date,$remark)
        {
            global $db;
            $query = "insert into income (id,membership_payment,salary_payment,equipment_expenses,other_expenses,date,remark,income) values('$id','$membership_payment','$salary_payment','$equipment_expenses','$other_expenses','$date','$remark', $membership_payment-$salary_payment-$equipment_expenses-$other_expenses )";
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
            $query = "select id,membership_payment,salary_payment,equipment_expenses,other_expenses,income,date_format(date,'%Y - %M') as month,remark from income ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function view1_record()
        {
            global $db;
            $query = "select id,membership_payment,salary_payment,equipment_expenses,other_expenses,income,date_format(date,'%Y - %M') as month,remark from income where MONTH(date) = MONTH(CURRENT_DATE()) ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from income where ID='$id'";
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
                $membership_payment = $db->check($_POST['membership_payment']);
                $salary_payment = $db->check($_POST['salary_payment']);
                $equipment_expenses = $db->check($_POST['equipment_expenses']);
                $other_expenses = $db->check($_POST['other_expenses']);
                
                $date = $db->check($_POST['date']);
				$remark = $db->check($_POST['remark']);
                
            
                
        

                if($this->update_record($id,$membership_payment,$salary_payment,$equipment_expenses,$other_expenses,$date,$remark))
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
        public function update_record($id,$membership_payment,$salary_payment,$equipment_expenses,$other_expenses,$date,$remark)
        {
            global $db;
            $sql = "update income set membership_payment = '$membership_payment' , salary_payment = '$salary_payment' , equipment_expenses = '$equipment_expenses' , other_expenses = '$other_expenses', date='$date',remark = '$remark' , income = ($membership_payment-$salary_payment-$equipment_expenses-$other_expenses) where ID='$id'";
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
            $query = "delete from income where ID='$id'";
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
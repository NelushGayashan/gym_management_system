<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php');
    $db = new dbconfig();

    class  operations_attendance extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
		$id = $db->check($_POST['id']);
                $date = $db->check($_POST['date']);
                $intime = $db->check($_POST['intime']);
		$outtime = $db->check($_POST['outtime']);
                $staff_id = $db->check($_POST['staff_id']);
                $staff_member_name = $db->check($_POST['staff_member_name']);
                $staff_designation_id = $db->check($_POST['staff_designation_id']);
                

                if($this->insert_record($id,$date,$intime,$outtime,$staff_id,$staff_member_name,$staff_designation_id))
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
        function insert_record($id,$date,$intime,$outtime,$staff_id,$staff_member_name,$staff_designation_id)
        {
            global $db;
            $query = "insert into attendance (id,date,intime,outtime, staff_id,staff_member_name,staff_designation_id,total_hours) values('$id','$date','$intime','$outtime','$staff_id','$staff_member_name','$staff_designation_id',TIMESTAMPDIFF(HOUR , intime , outtime) )";
            
            
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
            $query = "select * from attendance ORDER BY id DESC";
            
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
         public function viewi1_record()
        {
            global $db;
            $query = "select a.id, a.date, a.intime, a.outtime, a.staff_id, a.staff_member_name, a.total_hours  
                     from attendance a, staff s, useraccount u
                     where u.id = s.useraccount_id and  s.id = a.staff_id and u.id = '".$_SESSION['id']."' ORDER BY a.id DESC";
            
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
         // View Database Record
        public function view1_record()
        {
            global $db;
            $query = "SELECT staff_id, staff_member_name, date_format(date,'%Y - %M') as year_month, count(id) as working_days, 
                    SUM(total_hours) as total_working_hours, count(id)*1000 as salary_for_working, (SUM(total_hours)-count(id)*5)*150 as deduction,
                    (SUM(total_hours)-count(id)*5)*150 as incentives, count(id)*1000 + (SUM(total_hours)-count(id)*5)*150 as monthly_salary
                    FROM attendance group by staff_id,month(date)
                    order by staff_id,month(date)";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from attendance where ID='$id'";
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
                $intime = $db->check($_POST['intime']);
		$outtime = $db->check($_POST['outtime']);
                $staff_id = $db->check($_POST['staff_id']);
                $staff_member_name = $db->check($_POST['staff_member_name']);
                $staff_designation_id = $db->check($_POST['staff_designation_id']);
            
                if($this->update_record($id,$date,$intime,$outtime,$staff_id,$staff_member_name,$staff_designation_id))
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
        public function update_record($id,$date,$intime,$outtime,$staff_id,$staff_member_name,$staff_designation_id)
        {
            global $db;
            $sql = "update attendance set date='$date', intime='$intime',outtime = '$outtime', staff_id='$staff_id', staff_member_name='$staff_member_name' ,staff_designation_id='$staff_designation_id' ,total_hours = TIMESTAMPDIFF(HOUR , intime , outtime) where ID='$id'";
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
            $query = "delete from attendance where ID='$id'";
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
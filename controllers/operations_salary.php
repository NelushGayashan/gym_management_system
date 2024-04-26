<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_salary extends dbconfig
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
		$deduction = $db->check($_POST['deduction']);
                $incentives = $db->check($_POST['incentives']);
                $salary_details_id = $db->check($_POST['salary_details_id']);
                $attendance_id = $db->check($_POST['attendance_id']);
                
                if($this->insert_record($id,$date,$remark,$deduction,$incentives,$salary_details_id,$attendance_id))
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
        function insert_record($id,$date,$remark,$deduction,$incentives,$salary_details_id,$attendance_id)
        {
            global $db;
            $query = "insert into salary (id,date,remark,deduction, incentives,salary_details_id,attendance_id) values('$id','$date','$remark','$deduction','$incentives','$salary_details_id','$attendance_id')";
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
            $query = "SELECT id, staff_id, staff_member_name, date_format(date,'%Y - %M') as month , count(id) as working_days , 
                    SUM(total_hours) as total_working_hours, count(id)*500 as salary_for_working, (SUM(total_hours)-count(id)*5)*100 as extra,
                    ((count(id)*500)+((SUM(total_hours)-count(id)*5)*100)) as monthly_salary FROM attendance 
                    group by staff_id,month(date)
                    order by staff_id ,month(date) ";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        public function view1_record()
        {
            global $db;
            $query = "select * from salary ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
         // View Database Record
        public function view2_record()
        {
            global $db;
            $query = "SELECT date_format(date,'%Y - %M') as month , count(id) as working_days , 
                                        SUM(total_hours) as total_working_hours, count(id)*500 as salary_for_working, (SUM(total_hours)-count(id)*5)*100 as extra,
                                        count(id)*1000 + (SUM(total_hours)-count(id)*6)*150 as monthly_salary FROM attendance 
                                        group by month(date)
                                        order by month(date) ";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        
        public function view3_record()
        {
            global $db;
            $query = "SELECT date_format(date,'%Y - %M') as month , count(id) as working_days , 
                                        SUM(total_hours) as total_working_hours, count(id)*500 as salary_for_working, (SUM(total_hours)-count(id)*5)*100 as extra,
                                        count(id)*1000 + (SUM(total_hours)-count(id)*6)*150 as monthly_salary FROM attendance 
                                        group by month(date)
                                        order by month(date) DESC LIMIT 1";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
                
                
        
        
        // View Database Record
        public function viewi1_record()
        {
            global $db;
            $query = "SELECT a.id, a.staff_id, a.staff_member_name, date_format(a.date,'%Y - %M') as month , count(a.id) as working_days , 
                    SUM(a.total_hours) as total_working_hours, count(a.id)*500 as salary_for_working, 
                    (SUM(a.total_hours)-count(a.id)*5)*100 as extra, count(a.id)*1000 + (SUM(a.total_hours)-count(a.id)*6)*150 as monthly_salary 
                    from attendance a, staff s, useraccount u
                    where u.id = s.useraccount_id and  s.id = a.staff_id and u.id = '".$_SESSION['id']."'
                    group by a.staff_id,month(a.date)
                    order by a.staff_id ,month(a.date) DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
                

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from salary where ID='$id'";
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
		$deduction = $db->check($_POST['deduction']);
                $incentives = $db->check($_POST['incentives']);
                $salary_details_id = $db->check($_POST['salary_details_id']);
                $attendance_id = $db->check($_POST['attendance_id']);
                
                if($this->update_record($id,$date,$remark,$deduction,$incentives,$salary_details_id,$attendance_id ))
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
        public function update_record($id,$date,$remark,$deduction,$incentives,$salary_details_id,$attendance_id)
        {
            global $db;
            $sql = "update salary set date='$date', remark='$remark',deduction = '$deduction', incentives='$incentives', salary_details_id='$salary_details_id' , attendance_id = '$attendance_id' where ID='$id'";
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
            $query = "delete from salary where ID='$id'";
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
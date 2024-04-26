<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_leave_process extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
				$id = $db->check($_POST['id']);
                                $staff_id = $db->check($_POST['staff_id']);
                                $staff_member_name = $db->check($_POST['staff_member_name']);
                                
                                $date = $db->check($_POST['date']);
                                $remark = $db->check($_POST['remark']);
                                $status = $db->check($_POST['status']);
				$leave_details_id = $db->check($_POST['leave_details_id']);
				
				

                 if($this->insert_record($id,$date,$remark,$leave_details_id,$staff_id,$staff_member_name,$status))
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
        function insert_record($id,$date,$remark,$leave_details_id,$staff_id,$staff_member_name,$status)
        {
            global $db;
            $query = "insert into leave_process (id,date,remark,leave_details_id,staff_id,staff_member_name,status) values('$id','$date','$remark','$leave_details_id','$staff_id','$staff_member_name','$status')";
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
            $query = "select * from leave_process ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function viewaccepted_record()
        {
            global $db;
            $query = "select * from leave_process where status = 'Accepted' ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function viewdeclineded_record()
        {
            global $db;
            $query = "select * from leave_process where status = 'Declined' ORDER BY id DESC";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
         public function view1_record()
        {
            global $db;
            $query = "select * from leave_process where date = CURRENT_DATE() and status = 'Accepted'";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
         public function view2_record()
        {
            global $db;
            $query = "SELECT id, date AS date, COUNT(id) AS no_of_rows FROM leave_process where status = 'Accepted' GROUP BY date  ORDER BY date;";
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
          public function view3_record()
        {
            global $db;
            $query = "SELECT staff_id,staff_member_name, date_format(date,'%Y - %M') as month,count(id) as count from leave_process where status = 'Accepted'
                group by staff_id,month(date)
                order by staff_id,month(date);";
          
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        public function viewi1_record()
        {
            global $db;
            $query = "select l.id, l.date, l.staff_id, l.staff_member_name, l.status, l.remark
                     from leave_process l, staff s, useraccount u
                     where u.id = s.useraccount_id and  l.status = 'Accepted' and s.id = l.staff_id and u.id = '".$_SESSION['id']."' ORDER BY l.id DESC";
            
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        
        
        public function viewi2_record()
        {
            global $db;
            $query = "select l.id, l.date, l.staff_id, l.staff_member_name, l.status, l.remark
                     from leave_process l, staff s, useraccount u
                     where u.id = s.useraccount_id and  l.status = 'Declined' and s.id = l.staff_id and u.id = '".$_SESSION['id']."' ORDER BY l.id DESC";
            
            $result = mysqli_query($db->connection,$query);
            return $result;
        }
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from leave_process where ID='$id'";
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
                 $staff_id = $db->check($_POST['staff_id']);
                                $staff_member_name = $db->check($_POST['staff_member_name']);
                $date = $db->check($_POST['date']);
                $remark = $db->check($_POST['remark']);
				$leave_details_id = $db->check($_POST['leave_details_id']);
                                        $status = $db->check($_POST['status']);
				

                if($this->update_record($id,$date,$remark,$leave_details_id,$staff_id,$staff_member_name,$status))
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
        public function update_record($id,$date,$remark,$leave_details_id,$staff_id,$staff_member_name,$status)
        {
            global $db;
            $sql = "update leave_process set date='$date', remark='$remark' , leave_details_id = '$leave_details_id' , staff_id = '$staff_id' , staff_member_name = '$staff_member_name' , status = '$status' where ID='$id'";
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
            $query = "delete from leave_process where ID='$id'";
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
<?php 

    require_once('C:/xampp/htdocs/test/views/common/dbconfig.php'); 
    $db = new dbconfig();

    class  operations_gender extends dbconfig
    {
        // Insert Record in the Database
        public function Store_Record()
        {
            global $db;
            if(isset($_POST['submit']))
            {
                $id = $db->check($_POST['id']);
				$gender = $db->check($_POST['gender']);


                if($this->insert_record($id,$gender))
                {
                    echo '<div class="alert alert-success"> Your Record Has Been Saved  </div>';
                }
                else
                {
                    echo '<div class="alert alert-danger"> Failed. Please check and re-enter the IDs. </div>';
                }
            }
        }

        // Insert Record in the Database Using Query    
        public function insert_record($id,$gender)
        {
            global $db;
            $query = "insert into gender (id,gender) values('$id','$gender')";
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
			if(isset($_POST['submit']))
            {
                $search = $_POST['search'];
                
               
				global $db;
				$sql = "SELECT * FROM `gender` WHERE `gender` LIKE '$search'";
				$result = mysqli_query($db->connection,$sql);
				if (isset($_POST["ajax"])) { echo json_encode($results); }
				
						if (mysqli_num_rows($result) > 0)
						{

							
							return $result;
						}
						else 
						{ 
							$this->set_messsage('<div class="alert alert-warning"> Nothing Found : ) Try Again! </div>'); 
							$query = "select * from gender";
							$result = mysqli_query($db->connection,$query);
							
							return $result;
						}

               
            }
			else
			{
				$query = "select * from gender";
				$result = mysqli_query($db->connection,$query);
				return $result;
                        }
                 
        }
       
        

        // Get Particular Record
        public function get_record($id)
        {
            global $db;
            $sql = "select * from gender where id='$id' ";
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
                $gender = $db->check($_POST['gender']);
               

                if($this->update_record($id,$gender ))
                {
                    
                    $this->set_messsage('<div class="alert alert-success"> Your Record Has Been Updated </div>');
                    header("location:view.php");
                }
                else
                {   
                    $this->set_messsage('<div class="alert alert-danger"> Something Wrong : )</div>');
                }

               
            }
        }

        // Update Function 2
        public function update_record($id,$gender)
        {
            global $db;
            $sql = "update gender set gender='$gender' where ID='$id'";
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
                $msg = "Message is empty";
                $_SESSION['Message']=$msg;
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
            $query = "delete from gender where ID='$id'";
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
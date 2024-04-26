<?php 

    require_once('C:/xampp/htdocs/test/controllers/operations_income.php'); 
    $db = new  operations_income();
    $db->update();
    $id = $_GET['U_ID'];
    $result = $db->get_record($id);
    $data = mysqli_fetch_assoc($result);
    
    require_once('C:/xampp/htdocs/test/views/common/styles.php');
    require_once('C:/xampp/htdocs/test/views/privilages/clerk/header.php');
?>

<head>
    <title>Edit Income Details</title>
</head>
<!-- Header -->
  <div class="w3-container  col-lg-12 w3-text-black card recent-sales row  m-auto card mt-5 card-body w3-text-black" style="margin-top:-1000px ; margin-bottom:10px " id="showcase" >
   
    <h1 class="w3-xxlarge w3-text-black"><b> Edit Income Details</b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>


<div class="pagetitle col-lg-12"  style="margin-top:10px ; margin-bottom:-50px; margin-left:0px ">
    <nav>
       <ol class="breadcrumb">
            <li class="breadcrumb-item bi bi-house-door"><a href="http://localhost/test/views/common/homepage.php">Home</a></li>
          <li class="breadcrumb-item"><a href="http://localhost/test/views/privilages/clerk/dashboard.php">Dashboard</a></li>
         <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/expenses_income_management.php">Expense And Income Management</a></li>
          <li class="breadcrumb-item "><a href="http://localhost/test/views/privilages/clerk/income/view.php">View Income Details</a></li>
          <li class="breadcrumb-item active">Edit Income Records</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->
  

        <div class="row col-lg-12 m-auto card mt-5 card-body w3-text-black" style="margin-left:0px ; margin-top:10px ; margin-bottom:0px">
            
                        <?php $db->Store_Record(); ?>
            
                        
                            
                            <form method="POST">
    
    
                            
                            <form method="POST">
                               
                            <input style="margin-bottom:30px" type="hidden" name="id" placeholder=" Income ID" class="form-control mb-2" required value="<?php echo $data['id']; ?>">
                            
                            
                                
                                
                                <div class="form-group row " style="margin-bottom:30px; margin-top:30px">
                                <label for="Membership Name" class="col-sm-4 col-form-label">Date</label>
                                <div class="col-sm-4">
                                <input style="margin-bottom:30px" type="date" name="date" placeholder="Date" class="form-control mb-2" required value="<?php echo $data['date']; ?>" >
                                </div>
                                </div>
                                
                                
                                
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="membership_payment" class="col-sm-4 col-form-label">Membership Payment </label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="membership_payment" name="membership_payment" >
                                <option required value="<?php echo $data['membership_payment']; ?>"><?php echo $data['membership_payment']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT date_format(date,'%Y - %M') AS MONTH , SUM(reg_fee) as SUM FROM register GROUP BY MONTH(date) ;";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["SUM"];?>"><?php echo $category["MONTH"]."-".$category["SUM"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="salary_payment" class="col-sm-4 col-form-label">Salary Payment </label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="salary_payment" name="salary_payment" >
                                <option required value="<?php echo $data['salary_payment']; ?>"><?php echo $data['salary_payment']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT date_format(date,'%Y - %M') as month , count(id) as working_days , 
                                        SUM(total_hours) as total_working_hours, count(id)*500 as salary_for_working, (SUM(total_hours)-count(id)*5)*100 as extra,
                                        count(id)*1000 + (SUM(total_hours)-count(id)*6)*150 as monthly_salary FROM attendance 
                                        group by month(date)
                                        order by month(date) ";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["monthly_salary"];?>"><?php echo $category["month"]."-".$category["monthly_salary"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="equipment_expenses" class="col-sm-4 col-form-label"> Equipment Expenses </label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="equipment_expenses" name="equipment_expenses" >
                                <option required value="<?php echo $data['equipment_expenses']; ?>"><?php echo $data['equipment_expenses']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT date_format(date,'%Y - %M') as month , SUM(amount) AS SUM FROM payment where status = 'Equipment' 
                                        group by month(date)
                                        order by month(date) ";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["SUM"];?>"><?php echo $category["month"]."-".$category["SUM"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                <div class="form-group row " style="margin-bottom:30px ">
                                <label for="other_expenses" class="col-sm-4 col-form-label"> Other Expenses </label>
                                <div class="col-sm-6">
                                <select required class="custom-select mr-sm-2 " id="other_expenses" name="other_expenses" >
                                <option required value="<?php echo $data['other_expenses']; ?>"><?php echo $data['other_expenses']; ?></option>
                                <?php
                                $con = mysqli_connect("localhost","root","","fitness_for_everyone");
                                $sql = "SELECT date_format(date,'%Y - %M') as month , SUM(amount) AS SUM FROM payment where status = 'Expense' 
                                        group by month(date)
                                        order by month(date) ";
                                $all_categories = mysqli_query($con,$sql);
                                while ($category = mysqli_fetch_array(
                                $all_categories,MYSQLI_ASSOC)):; 
                                ?>
                                <option value="<?php echo $category["SUM"];?>"><?php echo $category["month"]."-".$category["SUM"];?></option>
                                <?php  endwhile; ?>
                                </select>
                                </div>
                                </div>
                                
                                
                                <div class="form-group row " style="margin-bottom:30px;">
                                <label for="Membership Name" class="col-sm-4 col-form-label">Remarks </label>
                                <div class="col-sm-8">
                                    <textarea style="margin-bottom:30px" type="text" name="remark" placeholder="Remarks" class="form-control mb-2" required value="<?php echo $data['remark']; ?>" ><?php echo $data['remark']; ?></textarea>
                                </div>
                                </div>
                                
                               
                                
                          
                            
                            
                            
                                      
                  <div  style=" margin-left:400px ; margin-top:100px ; margin-bottom:100px">
                                    <button class="btn btn-success btn-lg" name="btn_update"> Update </button>
                                </div>


                             </form>
                
        </div>
<!-- End page content -->

<?php require_once('C:/xampp/htdocs/test/views/common/footer1.php'); ?>
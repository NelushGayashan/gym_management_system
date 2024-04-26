        <div class="w3-container">
        <div class="icon-box" style="  margin-left:0px ; margin-top:50px ; margin-bottom:50px "><i class="fa fa-trash-o" style="font-size:216px;color:#FFCC00"></i></div>	
        <h4 class=" w3-xxlarge text-danger">Do you really want to delete record ID <?php echo $data['id'] ?>?</h4>
        <div class="text-secondary" style="margin-top:20px ; margin-bottom:30px"> This process cannot be undone</div>
        <button type="button" class="btn btn-primary btn-lg" onclick="document.getElementById('delete<?php echo $data['id'] ?>').style.display='none'">Cancel</button>
        <a href="del.php?D_ID=<?php echo $data['id'] ?>" type="button" class = " btn btn-danger  btn-lg"><span class="glyphicon glyphicon-trash" ></span> Delete</a>
        <h3 style=" margin-bottom:50px"></h3>
        </div>
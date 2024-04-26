$(document).on('click','#submit',function(e) {

	        var data = $("#add").serialize();

	        $.ajax({

	            data: data,

	            type: "post",

	            url: "operations_leave_details.php",

	            success: function(dataResult){

	                    var dataResult = JSON.parse(dataResult);

	                    if(dataResult.statusCode==200){

	                        $('#add').modal('hide');

	                        alert('Data added successfully !');

	                        location.reload();                     

	                    }

	                    else if(dataResult.statusCode==201){

	                       alert(dataResult);

	                    }

	            }

	        });

	    });
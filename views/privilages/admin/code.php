<?= $this->extend('layouts/base'); ?>

<?= $this->section('content'); ?>


<!-- Add Modal -->
<div class="modal fade bd-example-modal-lg" id="expensesModal" tabindex="-1" aria-labelledby="expensesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Expenses Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Date :</label><span id="error_date" class="ms-3"></span>
                            <input type="date" name="date" id="date" class="form-control date">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Batta :</label><span id="error_batta_typ" class="text-danger ms-3"></span>
                            <select name="batta" id="batta_typ" class="form-control batta_typ">
                                <option></option>
                                <?php foreach ($bata_value as $batta) : ?>
                                    <option value="<?= $batta->id; ?>"><?= $batta->batta_scheme; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label><span style="opacity:0;">..</span></label>
                            <input type="text" name="batta_val" id="batta_val" class="form-control batta_val" disabled="true">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col col-md-9">
                        <div class="form-group">
                            <label>Location :</label><span id="error_locaton" class="text-danger ms-3"></span>
                            <input type="text" class="form-control location">
                        </div>
                    </div>
                    <div class="col col-md-3">
                        <div class="form-group">
                            <label>Category :</label><span id="error_category" class="text-danger ms-3"></span>
                            <select class="form-control category">
                                <option></option>
                                <option value="COL">COL</option>
                                <option value="OUT">OUT</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Opening Km :</label><span id="error_open_km" class="text-danger ms-3"></span>
                            <input type="number" class="form-control open_km">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Closing Km :</label><span id="error_close_km" class="text-danger ms-3"></span>
                            <input type="number" class="form-control close_km">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Private Km :</label><span id="error_private_km" class="text-danger ms-3"></span>
                            <input type="number" class="form-control private_km">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Office Km :</label><span id="error_office_km" class="text-danger ms-3"></span>
                            <input type="number" class="form-control office_km" disabled="true">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Total Km :</label>
                            <input type="number" class="form-control total_km" disabled="true">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label>Petrol :</label><span id="error_petrol" class="text-danger ms-3"></span>
                            <input type="number" class="form-control petrol">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Diesel :</label><span id="error_diesel" class="text-danger ms-3"></span>
                            <input type="number" class="form-control diesel">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label>Cost :</label><span id="error_cost" class="text-danger ms-3"></span>
                            <input type="number" class="form-control cost">
                        </div>
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label>Comments :</label>
                        <!--<input type="text" class="form-control comment" >-->
                        <textarea class="form-control comment" id="comment" name="comment" rows="3" cols="10"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label>Category :</label><span id="error_yes_no" class="text-danger ms-3"></span>
                    <select class="form-control yes_no">
                        <option></option>
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary save">Save</button>
            </div>
        </div>
    </div>
</div>


        //validation and submith add form
        $(document).on('click', '.save', function() {

            if ($.trim($('.date').val()).length == 0) {
                error_date = 'Required';
                $('#error_date').html('');
                $("#error_date").addClass("text-danger");
                $('#error_date').text(error_date);
            } else {
                error_date = '';
                $('#error_date').html('');
                $("#error_date").addClass("text-danger");
                $('#error_date').text(error_date);
            }

            if ($.trim($('.batta_typ').val()).length == 0) {
                error_batta_typ = 'Required';
                $('#error_batta_typ').text(error_batta_typ);
            } else {
                error_batta_typ = '';
                $('#error_batta_typ').text(error_batta_typ);
            }

            if ($.trim($('.location').val()).length == 0) {
                error_locaton = 'Required';
                $('#error_locaton').text(error_locaton);
            } else {
                error_locaton = '';
                $('#error_locaton').text(error_locaton);
            }

            if ($.trim($('.category').val()).length == 0) {
                error_category = 'Required';
                $('#error_category').text(error_category);
            } else {
                error_category = '';
                $('#error_category').text(error_category);
            }

            if ($.trim($('.open_km').val()).length == 0) {
                error_open_km = 'Required';
                $('#error_open_km').text(error_open_km);
            } else {
                error_open_km = '';
                $('#error_open_km').text(error_open_km);
            }

            if ($.trim($('.close_km').val()).length == 0) {
                error_close_km = 'Required';
                $('#error_close_km').text(error_close_km);
            } else {
                error_close_km = '';
                $('#error_close_km').text(error_close_km);
            }

            if ($.trim($('.private_km').val()).length == 0) {
                error_private_km = 'Required';
                $('#error_private_km').text(error_private_km);
            } else {
                error_private_km = '';
                $('#error_private_km').text(error_private_km);
            }

            if ($.trim($('.petrol').val()).length == 0) {
                error_petrol = 'Required';
                $('#error_petrol').text(error_petrol);
            } else {
                error_petrol = '';
                $('#error_petrol').text(error_petrol);
            }

            if ($.trim($('.diesel').val()).length == 0) {
                error_diesel = 'Required';
                $('#error_diesel').text(error_diesel);
            } else {
                error_diesel = '';
                $('#error_diesel').text(error_diesel);
            }

            if ($.trim($('.cost').val()).length == 0) {
                error_cost = 'Required';
                $('#error_cost').text(error_cost);
            } else {
                error_cost = '';
                $('#error_cost').text(error_cost);
            }

            //yes validation-----------------------------------------------------------------
            if ($.trim($('.yes_no').val()).length == 0) {
                error_yes_no = 'Required';
                $('#error_yes_no').text(error_yes_no);
            } else {
                error_yes_no = '';
                $('#error_yes_no').text(error_yes_no);
            }

            if (error_date != '' || error_batta_typ != '' || error_locaton != '' || error_category != '' || error_open_km != '' || error_close_km != '' || error_private_km != '' || error_petrol != '' || error_diesel != '' || error_cost != '' || error_yes_no != '') {
                return false;
            } else {
		//----------------------------------------------------------------------------
                var cost = $('.cost').val();
                var yes_no = $('.yes_no').val();



                if (yes_no == 'yes') {
                    var cost = parseInt(cost) + 2000;
                } else {
                    var cost = cost;
                }
                console.log(cost);

                var data = {
                    'date': $('.date').val(),
                    'batta_id': $('.batta_typ').val(),
                    'batta_val': $('.batta_val').val(),
                    'location': $('.location').val(),
                    'category': $('.category').val(),
                    'open_km': $('.open_km').val(),
                    'close_km': $('.close_km').val(),
                    'private_km': $('.private_km').val(),
                    'office_km': $('.office_km').val(),
                    'total_km': $('.total_km').val(),
                    'petrol': $('.petrol').val(),
                    'diesel': $('.diesel').val(),
                    'cost': cost,
                    'comment': $('.comment').val()
                };
		//-------------------------------------------------------------------
                $.ajax({
                    method: "POST",
                    url: "<?= base_url(); ?>/expenses/expenses",
                    data: data,
                    success: function(response) {
                        $('#expensesModal').modal('hide');
                        $('#expensesModal').find('input').val('');
                        $('#expensesModal').find('textarea').val('');
                        $('#expensesModal').find('select').val('');
                        $('.expenses_data').html('');
                        $("#expenses_data").dataTable().fnDestroy();
                        loadExpenses();
                        alertify.set('notifier', 'position', 'top-center');
                        alertify.success(response.status);
                    }
                });
            }
        });
  
</script>
<?= $this->endSection(); ?>
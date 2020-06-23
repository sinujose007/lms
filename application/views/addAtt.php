<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Attendance Management
        <small>Add / Edit Attendance</small>
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
              <!-- general form elements -->
                
                
                
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">EnterDetails</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addTeacher" action="<?php echo base_url() ?>user/AttSubmit" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">                                
                                    <div class="form-group">
                                        <label for="fname">Select date</label>
                                        <input class="datepicker" type="text" class="form-control required" required value="" id="cDate" name="cDate" maxlength="128">
										
                                    </div>                                    
                                </div>
								<div class="col-md-12" style="display:''" class="attBlock">                                
                                    <div class="form-group">
									<div style="border-bottom:1px solid #111;overflow:hidden;width:99%;font-weight:bold;">
										<div class="col-md-4">Teacher Name</div>
										<div class="col-md-8">present</div>
									</div>
										
                                        <?php if(!empty($teachers)){ foreach($teachers as $x=>$y){ ?>
										<div style="border-bottom:1px solid #eee;overflow:hidden;width:99%">
										<div class="col-md-4"><?=$y->Name?></div>
										<div class="col-md-8"><input type="checkbox" id="attC_<?=$y->Id?>" name="attC[]" value="<?=$y->Id?>" /></div></div>
										<?php }} ?>
										
                                    </div>                                    
                                </div>
                               
                            </div>
                          
                        </div><!-- /.box-body -->
    
                        <div class="box-footer">
                            <input type="submit" class="btn btn-primary" value="Submit" />
                            <input type="reset" class="btn btn-default" value="Reset" />
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error)
                    {
                ?>
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('error'); ?>                    
                </div>
                <?php } ?>
                <?php  
                    $success = $this->session->flashdata('success');
                    if($success)
                    {
                ?>
                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('success'); ?>
                </div>
                <?php } ?>
                
                <div class="row">
                    <div class="col-md-12">
                        <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                    </div>
                </div>
            </div>
        </div>    
    </section>
    
</div>
	
<link href="<?php echo base_url(); ?>assets/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<script src="<?php echo base_url(); ?>assets/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
 <script type="text/javascript">
	$(document).ready(function(){
        $('.datepicker').datepicker({ /* */ });
	});
 </script>
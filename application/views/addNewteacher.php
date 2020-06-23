
<?php // print_r($classes);// exit;?>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> teachers Management
        <small>Add / Edit User</small>
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
              <!-- general form elements -->
                
                
                
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter Teacher Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addTeacher" action="<?php echo base_url() ?>addNewTsubmit" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">                                
                                    <div class="form-group">
                                        <label for="fname">Full Name</label>
                                        <input type="text" class="form-control required" value="<?php echo set_value('Name'); ?>" id="fname" name="Name" maxlength="128">
                                    </div>
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input type="text" class="form-control required email" id="email" value="<?php echo set_value('Email'); ?>" name="Email" maxlength="128">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control required" id="password" name="Password" maxlength="20">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cpassword">Confirm Password</label>
                                        <input type="password" class="form-control required equalTo" id="cpassword" name="cPassword" maxlength="20">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Mobile Number</label>
                                        <input type="text" class="form-control required digits" id="mobile" value="<?php echo set_value('Telephone'); ?>" name="Telephone">
                                    </div>
                                </div>
								 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Address</label>
                                        <input type="text" class="form-control" id="add" value="<?php echo set_value('Address'); ?>" name="Address">
                                    </div>
                                </div>                               
                            </div>
							 <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Qualification</label>
                                        <input type="text" class="form-control" id="qu" value="<?php echo set_value('Qualification'); ?>" name="Qualification">
                                    </div>
                                </div>
								 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Subject</label>
                                        <input type="text" class="form-control required" id="sub" value="<?php echo set_value('Subject'); ?>" name="Subject" >
                                    </div>
                                </div>                               
                            </div>
							 <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="mobile">Select Clasess</label>
                                        <select  class="form-control required" multiple name="clasess[]" id="clasess">
										<?php if(!empty($classes)){
											foreach($classes as $k=>$v){ ?>
												<option value="<?=$v->cId?>"><?=$v->cName?></option>
										<?php }}
										?>
										</select>
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
<script src="<?php echo base_url(); ?>assets/js/addTeacher.js" type="text/javascript"></script>
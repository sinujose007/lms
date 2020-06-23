<?php
$Id = $userInfo->Id;
$name = $userInfo->Name;
$email = $userInfo->Email;
$mobile = $userInfo->Telephone;
$address = $userInfo->Address;
$qu = $userInfo->Qualification;
$sub = $userInfo->Subject;
?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Teacher Management
        <small>Add / Edit Teacher</small>
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
              <!-- general form elements -->
                
                
                
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter  Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    
                    <form role="form" action="<?php echo base_url() ?>editTeacherSubmit" method="post" id="addTeacher" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">                                
                                    <div class="form-group">
                                        <label for="fname">Full Name</label>
                                        <input type="text" class="form-control required" id="fname" placeholder="Full Name" name="Name" value="<?php echo $name; ?>" maxlength="128">
                                        <input type="hidden" value="<?php echo $Id; ?>" name="Id" id="Id" />    
                                    </div>
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input readonly="readonly" type="email" class="form-control" id="email" placeholder="Enter email" name="Email" value="<?php echo $email; ?>" maxlength="128">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" placeholder="Password" name="Password" maxlength="20">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cpassword">Confirm Password</label>
                                        <input type="password" class="form-control" id="cpassword" placeholder="Confirm Password" name="cPassword" maxlength="20">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Mobile Number</label>
                                        <input type="text" class="form-control" id="mobile" placeholder="Mobile Number" name="Telephone" value="<?php echo $mobile; ?>" maxlength="10">
                                    </div>
                                </div>
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Address</label>
                                        <input type="text" class="form-control" id="add" value="<?php echo $address; ?>" name="Address">
                                    </div>
                                </div>                               
                            </div>
							 <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Qualification</label>
                                        <input type="text" class="form-control" id="qu" value="<?php echo $qu; ?>" name="Qualification">
                                    </div>
                                </div>
								 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Subject</label>
                                        <input type="text" class="form-control required" id="sub" value="<?php echo $sub; ?>" name="Subject" >
                                    </div>
                                </div>                               
                            </div>
							
							 <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="mobile">Select Clasess</label>
                                        <select  class="form-control required" multiple name="clasess[]" id="clasess">
										<?php 
										
										if(!empty($classes)){
											foreach($classes as $k=>$v){ ?>
												<option <?php if(in_array($v->cId,$exOp)){ ?> selected="selected" <?php } ?> value="<?=$v->cId?>"><?=$v->cName?></option>
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
<!--
<script src="<?php echo base_url(); ?>assets/js/addTeacher.js" type="text/javascript"></script>
-->
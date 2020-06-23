<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard
        <small>Control panel</small>
      </h1>
    </section>
    
    <section class="content">
        <div class="row">
            <div class="col-lg-2 col-xs-4">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>150</h3>
                  <p><a href="<?php echo base_url(); ?>addNewteacher">Add Teachers</a></p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <a href="<?php echo base_url(); ?>teacherListing" class="small-box-footer">List/Edit Teachers <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
			
            <div class="col-lg-2 col-xs-4">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>53<sup style="font-size: 20px">%</sup></h3>
                  <p><a href="<?php echo base_url(); ?>addAttendants">Add Attendants</a></p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <a href="<?php echo base_url(); ?>attendantsListing" class="small-box-footer">List/Edit Attendants <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
			
            <div class="col-lg-2 col-xs-4">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>44</h3>
                  <p><a href="<?php echo base_url(); ?>addNewclass">Add Clasess</a></p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="<?php echo base_url(); ?>classListing" class="small-box-footer">List/Edit Clasess <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
			</div>
    </section>
</div>
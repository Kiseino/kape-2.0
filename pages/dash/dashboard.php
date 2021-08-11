<?php
    $cLocFile   = GetLocationFile(__FILE__) ; 
?>
<section class="content-header">
    <h1 style="display:inline-block">
        Dashboard 
    </h1>
    <form id="frmdah" class="form-inline pull-right" style="display:inline-block;margin-top:-5px;">
        <div class="form-group">
            <label>Start Date</label>
            <input type="text" name="dTglAwal" id="dTglAwal" class="form-control sc-date text-center"
            <?=scDate::SetDataDate()?> value="<?=date("d-01-Y")?>">
            <input type="hidden" name="cPageSource" id="cPageSource" value="<?=$cLocFile?>">
        </div>
        <div class="form-group">
            <label>End Date</label> 
            <input type="text" name="dTglAkhir" id="dTglAkhir" class="form-control sc-date text-center"
            <?=scDate::SetDataDate()?> value="<?=date("d-m-Y")?>">
            <input type="hidden" name="code_type" id="code_type" value="1">
        </div>
        <button type="button" class="btn btn-primary" id="cmdView" name="cmdView">View Data</button>
    </form>
</section> 

<!-- Main content -->
<section class="content">
    <div class="row">
    <div class="col-sm-3">  
            <div class="small-box bg-green">
                <div class="inner">
                  <h3 id="nDash_pegawai">0</h3>
                  <p>Total Pegawai</p>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-person-outline"></i>
                </div>
                <a href="#" class="small-box-footer" onclick="ChangePage('#pegawai/mstpegawai')">
                    More info <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 id="nDash_sppd">0</h3>
                  <p>Total SPPD</p>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-cloud-download-outline"></i>
                </div>
                <a href="#" class="small-box-footer" onclick="ChangePage('#sppd/trsppd')">
                    More info <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-3">  
            <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 id="nDash_sppd_selesai">0</h3>
                  <p>Total SPPD selsai</p>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-email-outline"></i>
                </div>
                <a href="#" class="small-box-footer" onclick="ChangePage('#sppd/trsppd')">
                    More info <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-3">  
            <div class="small-box bg-red">
                <div class="inner">
                  <h3 id="nDash_sppd_new">0</h3>
                  <p>Total SPPD belum selsai</p>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-email-outline"></i>
                </div>
                <a href="#" class="small-box-footer" onclick="ChangePage('#sppd/trsppd')">
                    More info <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        
    </div>
    <?php
        include("./pages/sppd/trsppd.php")
        ?>
</section><!-- /.content -->


<script type="text/javascript" src="<?=$cLocFile?>.js"></script>
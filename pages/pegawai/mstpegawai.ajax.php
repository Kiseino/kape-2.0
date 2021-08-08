<?php 
	function Grid1_Load($va){
		global $scDb ; 
		$cLimit		= $va['offset'].",".$va['limit'] ; //limit
		$vaOrder	= array() ;  
		if(isset($va['sort'])){
			foreach ($va['sort'] as $key => $vaValue) {
				$vaOrder[]	= $vaValue['field'] . " " . $vaValue['direction'] ; 
			}
		}
		$cOrder 	= implode(",",$vaOrder) ; 
		if($cOrder == "") $cOrder = "datetime_update ASC" ; 
		//init order grid

		$vaWhere 	= array() ; 
		if(isset($va['search'])){
			foreach ($va['search'] as $key => $vaValue) {
				$vaWhere[]	= $vaValue['field'] . " like '%".$vaValue['value']."%'" ; 
			} 
		}//init where grid
		$cWhere 	= implode(" OR ", $vaWhere) ; 
		$vaReturn 	= array() ;
		$dbData 	= $scDb->Browse("pegawai","*",$cWhere,"","",$cOrder,$cLimit) ; 
		$dbDataNL 	= $scDb->Browse("pegawai","*",$cWhere) ; 
		while($dbRow= $scDb->GetRow($dbData)){
			$vaGolongan 			= scSys::GetKeterangan("Title,Description","Id = '{$dbRow['golongan']}'","sc_master") ; 
			$dbRow['golongan']		= $vaGolongan['Description'] . " / " . $vaGolongan['Title'] ; 
			$dbRow['recid']			= $dbRow['nip'] ; 
			$dbRow['cmdEdit']		= '<button type="button" onClick="OBJFORM_NEW.mstpegawai.Edit(\''.$dbRow['nip'].'\')" 
										class="btn btn-primary btn-grid">Edit</button>' ;
			$dbRow['cmdEdit']		= html_entity_decode($dbRow['cmdEdit']) ; 
			$dbRow['cmdDelete']		= '<button type="button" onClick="OBJFORM_NEW.mstpegawai.Delete(\''.$dbRow['nip'].'\')" 
										class="btn btn-danger btn-grid">Delete</button>' ;
			$dbRow['cmdDelete']		= html_entity_decode($dbRow['cmdDelete']) ; 
			$vaReturn[]				= $dbRow ; 
		}
		$vaReturn 	= array("total"=>$scDb->Rows($dbDataNL),"records"=>$vaReturn) ;
		echo json_encode($vaReturn) ; 	
	} 

	function Saving($va){
		global $scDb ; 
		$cNip 		= $va['cNip'] ; 
		$vaArray 	= array("nip"=>$va['cNip'],"nama"=>$va['cNama'],
							
							"golongan"=>$va['cGolongan'],
							"jabatan"=>$va['cJabatan']); 
		$vaInsert 	= array("username"=>GetSession("cSession_UserName")) ; 
		$vaUpdate 	= array("username_update"=>GetSession("cSession_UserName")) ; 
		$scDb->Update("pegawai",$vaArray,"nip = '$cNip'",true,$vaInsert,$vaUpdate) ; 
		echo('
				alert("Data sudah disimpan") ; 
				OBJFORM_NEW.mstpegawai.Init() ; 
			') ; 
	}

	function Deleting($va) {
		global $scDb ; 
		$cNip 		= $va['cNip'] ; 
		$scDb->Delete("pegawai","nip = '$cNip'") ; 
		echo('
				alert("Data telah dihapus") ;
				OBJFORM_NEW.mstpegawai.Grid1_ReloadData() ; 
			') ; 
	}

	function Editing($va){
		$cNip 		= $va['cNip'] ; 
		$dbRow 		= scSys::GetKeterangan("*","nip = '$cNip'","pegawai") ; 
		if(!empty($dbRow)){
			$vaNip 		= array("id"=>$dbRow['nip'],"text"=>$dbRow['nip']) ; 
			$vaGolongan	= scSys::GetKeterangan("Title,Description","Id = '{$dbRow['golongan']}'","sc_master") ;
			$vaGolongan	= array("id"=>$dbRow['golongan'],"text"=>$vaGolongan['Description'] . " / " . $vaGolongan['Title']) ; 
			echo(' 
					with(OBJFORM_NEW.mstpegawai.Obj){
						find("#cNip").select2("data",'.json_encode($vaNip).') ;
						find("#cNip").select2("readonly",true) ;
						find("#cNama").val("'.$dbRow['nama'].'") ;
						find("#cGolongan").val("'.$dbRow['golongan'].'") ;
						find("#cJabatan").val("'.$dbRow['jabatan'].'") ;

					} 
					$("#myTabs li:eq(1) a").tab("show") ; 
				') ; 
		}
	}
?>
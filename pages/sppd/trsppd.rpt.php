<?php  
	$code 	= $_GET['code']	 ;
	$dbRow 	= scSys::GetKeterangan("*","code = '$code'","sppd") ; 
	if(!empty($dbRow)){
		$scDb->Edit("sppd",array("status"=>"1"),"code = '$code' AND status = '0'",false) ;

		$vaTable1		= array() ; 
		$vaTable1[] 	= array("x"=>"","1"=>"Lembar Ke","2"=>":","3"=>"") ;
		$vaTable1[] 	= array("x"=>"","1"=>"Kode No","2"=>":","3"=>$code) ;
		$vaTable1[] 	= array("x"=>"","1"=>"Nomor","2"=>":","3"=>"") ;
 
		$vaPejabat 		= scSys::GetKeterangan("nama,golongan,jabatan,nip","nip = '{$dbRow['nip_pejabat']}'","pegawai") ; 
		$vaPejabat_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaPejabat['golongan']}'","sc_master") ; 
		$vaLeader 		= scSys::GetKeterangan("nama,golongan,jabatan,nip","nip = '{$dbRow['nip_leader']}'","pegawai") ; 
		$vaLeader_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaLeader['golongan']}'","sc_master") ; 
		$vaPengikut 	= array() ; 
		foreach (explode(",", $dbRow['nip']) as $key => $value) {
			if($value !== ""){
				$vaPengikut[]	= scSys::GetKeterangan("nama,golongan,jabatan,nip","nip = '$value'","pegawai") ; 	
			} 
		}

		$vaTable2	 	= array() ;  
		$vaTable2[] 	= array("1"=>" I","2"=>"Yang bertanda tangan dibawah ini","3"=>"" ) ;
		$vaTable2[] 	= array("1"=>"","2"=>"Nama","3"=>" " .$vaPejabat["nama"]) ;
		$vaTable2[] 	= array("1"=>"","2"=>"Jabatan","3"=>" " .$vaPejabat['jabatan']) ;

		$vaTable3	 	= array() ; 
		$vaTable3[] 	= array("1"=>" II","2"=>"Menerangkan bahwa","3"=>"") ;
		$vaTable3[] 	= array("1"=>"","2"=>"Nama / NIP","3"=>" " .$vaLeader['nama'] . " / " . $vaLeader['nip']) ;
		$vaTable3[] 	= array("1"=>"","2"=>"Gol - Jabatan","3"=>" " .$vaLeader_Gol['Title'] . " - " . $vaLeader['jabatan']) ;
	
		$vaTable4	 	= array() ; 
		$vaTable4[] 	= array("1"=>" III","2"=>"Akan melaksanakan tugas","3"=>" " .$dbRow['purpose']) ;

		$vaTable5	 	= array() ; 
		$vaTable5[] 	= array("1"=>" IV","2"=>"a. Tempat Berangkat","3"=>" " .$dbRow['place_from']) ;
		$vaTable5[] 	= array("1"=>"","2"=>"b. Tempat Tujuan","3"=>" " .$dbRow['place_to']) ;

		$vaTable6	 	= array() ; 
		$vaTable6[] 	= array("1"=>" V","2"=>"Alat yang dipergunakan","3"=>" " .$dbRow['transport']) ;

		$vaTable7	 	= array() ; 
		$vaTable7[] 	= array("1"=>" VI","2"=>"a. Lama Dinas","3"=>" " .$dbRow['length_journey'] . 
								" (" . scSys::Terbilang($dbRow['length_journey']) .") hari") ;
		$vaTable7[] 	= array("1"=>"","2"=>"b. Tanggal Keerangkatan","3"=>" " .scDate::String2Date($dbRow['date_go']) ) ;
		$vaTable7[] 	= array("1"=>"","2"=>"b. Tanggal Kepulangan","3"=>" " .scDate::String2Date($dbRow['date_back']) ) ;

		$vaTable8	 	= array() ; 
		$vaTable8[] 	= array("1"=>"VIII","2"=>"Keterangan","3"=>" " .$dbRow['description'] ) ;

		$vaTable9 		= array() ; 
		$nRow 			= 1 ; 
		$ncab 			= "Kancab Bandung" ; 
		$vaTable9[] 	= array("1"=>" VII","2"=>"Pengikut","3"=>"","4"=>"","5"=>"","6"=>"","7"=>"") ;
		$vaTable9[] 	= array("1"=>"","2"=>"      No","3"=>"                Nama","4"=>"                 NIP","5"=>"  Gol","6"=>"      Jabatan","7"=>"       Unit Kerja") ;
		foreach ($vaPengikut as $key => $vaData) {
			$vaPengikut_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaData['golongan']}'","sc_master") ;  ; 
			$vaTable9[] 	= array("1"=>"","2"=>"       ".$nRow++."",""=>$vaData['nama'],"4"=>$vaData['nip'],"5"=>$vaPengikut_Gol['Title'],"6"=>$vaData['jabatan'],"7"=>$ncab) ;
		}

		$vaDate 		= scDate::Date2Var($dbRow['date']) ;  
		$vaTanggal		= array() ; 
		$vaTanggal[]	= array("x"=>"","1"=>"Dikeluarkan di","2"=>":","3"=>"Bandung") ; 
		$vaTanggal[]	= array("x"=>"","1"=>"Pada Tanggal","2"=>":","3"=>$vaDate["Tgl"] . " " . $vaDate['Bulan'] . " " . $vaDate['Tahun']) ; 

		$vaTtd 			= array() ; 
		$vaTtd[]		= array("x"=>"","1"=>$vaPejabat["jabatan"]) ; 
		if($vaPejabat['nip'] !== scSys::GetConfig("sc_kepala_dinas")){
			$vaTtd[]	= array("x"=>"","1"=>"An. Kepala Dinas " . scSys::GetConfig("sc_company") ) ; 
		}
		$vaTtd[]		= array("x"=>"","1"=>"") ; 
		$vaTtd[]		= array("x"=>"","1"=>"") ; 
		$vaTtd[]		= array("x"=>"","1"=>"") ; 
		$vaTtd[]		= array("x"=>"","1"=>"") ; 
		$vaTtd[]		= array("x"=>"","1"=>"<u>".$vaPejabat["nama"]."</u>") ; 
		$vaTtd[]		= array("x"=>"","1"=>$vaPejabat_Gol['Description']) ; 
		$vaTtd[]		= array(""=>"","1"=>"NIP : " . $vaPejabat["nip"]) ; 


		$vaDasar 		= array() ; 
		$vaDate 		= scDate::Date2Var($dbRow['letter_date']) ;  

		$vaUntuk 		= array() ; 
		$vaUntuk[]		= array("1"=>"Untuk","2"=>":","3"=>$dbRow['purpose']) ; 

		$nFont		= 11 ; 
		$pdf 		= new Cezpdf("A4","P",$vaOpt,'0') ;  

		$pdf->ezImage( scSys::GetConfig("sc_header") ,false , 100 , 600) ; 
		$pdf->ezText("") ;  
		$pdf->ezText("<u><b>SURAT KETERANGAN PERJALANAN DINAS</b></u>",$nFont+2,array("justification"=>"center")) ;
		$pdf->ezText("Nomor : $code",$nFont+2,array("justification"=>"center")) ;
		$pdf->ezText("") ; 
		$pdf->ezTable($vaTable2,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezTable($vaTable3,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezTable($vaTable4,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezTable($vaTable5,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezTable($vaTable6,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezTable($vaTable7,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezTable($vaTable9,"","",array("showLines"=>2,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>10,"wrap"=>1),
												  "3"	=>array("width"=>26,"wrap"=>1),
												  "4"	=>array("width"=>22,"wrap"=>1),
												  "5"	=>array("width"=>6,"wrap"=>1),
												  "6"	=>array("width"=>15,"wrap"=>1),
												  "7"	=>array("width"=>18,"wrap"=>1)) )) ;
		$pdf->ezTable($vaTable8,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>36,"wrap"=>1),
												  "3"	=>array("width"=>61,"wrap"=>1) ) )) ;
		$pdf->ezText("") ; 
		$pdf->ezText("") ; 
		$pdf->ezTable($vaTanggal,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("x"	=>array("width"=>55,"wrap"=>1),
												  "1"	=>array("wrap"=>1),
												  "2"	=>array("width"=>2),
												  "3"	=>array("wrap"=>1),
												  "4"	=>array("wrap"=>1),
												  "5"	=>array("wrap"=>1) ) )) ;
		$pdf->ezText("") ; 
		$pdf->ezText("") ;
		$pdf->ezText("") ;
		$pdf->ezTable($vaTtd,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("x"	=>array("width"=>50,"wrap"=>1,"justification"=>"center"),
												  "1"	=>array("width"=>40,"wrap"=>1,"justification"=>"center")) )) ;

		
		$pdf->ezNewPage() ;
		$pdf->ezImage( scSys::GetConfig("sc_header") ,false , 100 , 600) ;  
		$pdf->ezText("<u><b>SURAT KETERANGAN PERJALANAN DINAS</b></u>",$nFont+2,array("justification"=>"center")) ;
		$pdf->ezText("Nomor : $code",$nFont+2,array("justification"=>"center")) ; 
		$pdf->ezText("") ; 
		$pdf->ezTable($vaDasar,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>20,"wrap"=>1),
												  "2"	=>array("width"=>2),
												  "3"	=>array("wrap"=>1) ) )) ;
		$pdf->ezText("") ; 
		$pdf->ezText("MEMERINTAHKAN :",$nFont+2,array("justification"=>"center")) ;
		$pdf->ezText("") ; 
		$pdf->ezTable($vaKepada,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>20,"wrap"=>1),
												  "2"	=>array("width"=>2),
												  "3"	=>array("width"=>4),
												  "4"	=>array("width"=>20,"wrap"=>1),
												  "5"	=>array("width"=>2),
												  "6"	=>array("wrap"=>1) ) )) ;
		$pdf->ezText("") ; 
		$pdf->ezTable($vaUntuk,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>20,"wrap"=>1),
												  "2"	=>array("width"=>2),
												  "3"	=>array("wrap"=>1) ) )) ;
		$pdf->ezText("") ; 
		$pdf->ezText("") ; 
		$pdf->ezTable($vaTanggal,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("x"	=>array("width"=>50,"wrap"=>1),
												  "1"	=>array("width"=>25,"wrap"=>1),
												  "2"	=>array("width"=>2),
												  "3"	=>array("width"=>23,"wrap"=>1) ) )) ;
		$pdf->ezText("") ; 
		$pdf->ezTable($vaTtd,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("x"	=>array("width"=>50,"wrap"=>1,"justification"=>"center"),
												  "1"	=>array("width"=>40,"wrap"=>1,"justification"=>"center")) )) ;

		$pdf->ezStream() ; 

	}  
?>  
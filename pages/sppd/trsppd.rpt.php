<?php  
	$code 	= $_GET['code']	 ;
	$dbRow 	= scSys::GetKeterangan("*","code = '$code'","sppd") ; 
	if(!empty($dbRow)){
		$scDb->Edit("sppd",array("status"=>"1"),"code = '$code' AND status = '0'",false) ;

		$vaTable1		= array() ; 
		$vaTable1[] 	= array("x"=>"","1"=>"Lembar Ke","2"=>":","3"=>"") ;
		$vaTable1[] 	= array("x"=>"","1"=>"Kode No","2"=>":","3"=>$code) ;
		$vaTable1[] 	= array("x"=>"","1"=>"Nomor","2"=>":","3"=>"") ;
 
		$vaPejabat 		= scSys::GetKeterangan("nama,golongan,jabatan,nip,pajak","nip = '{$dbRow['nip_pejabat']}'","pegawai") ; 
		$vaPejabat_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaPejabat['golongan']}'","sc_master") ; 
		$vaLeader 		= scSys::GetKeterangan("nama,golongan,jabatan,nip,pajak","nip = '{$dbRow['nip_leader']}'","pegawai") ; 
		$vaLeader_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaLeader['golongan']}'","sc_master") ; 
		$vaPengikut 	= array() ; 
		foreach (explode(",", $dbRow['nip']) as $key => $value) {
			if($value !== ""){
				$vaPengikut[]	= scSys::GetKeterangan("nama,golongan,jabatan,nip,pajak","nip = '$value'","pegawai") ; 	
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
		$vaTable4[] 	= array("1"=>" III","2"=>"Akan melaksanakan tugas","3"=>" ".$dbRow['purpose']) ;

		$vaTable5	 	= array() ; 
		$vaTable5[] 	= array("1"=>" IV","2"=>"a. Tempat Berangkat","3"=>" " .$dbRow['place_from']) ;
		$vaTable5[] 	= array("1"=>"","2"=>"b. Tempat Tujuan","3"=>" " .$dbRow['place_to']) ;

		$vaTable6	 	= array() ; 
		$vaTable6[] 	= array("1"=>" V","2"=>"Sarana Angkutan yang Dipergunakan","3"=>" " .$dbRow['transport']) ;

		$vaTable7	 	= array() ; 
		$vaTable7[] 	= array("1"=>" VI","2"=>"a. Lama Dinas","3"=>" " .$dbRow['length_journey'] . 
								" (" . scSys::Terbilang($dbRow['length_journey']) .") hari") ;
		$vaTable7[] 	= array("1"=>"","2"=>"b. Tanggal Keberangkatan","3"=>" " .scDate::String2Date($dbRow['date_go']) ) ;
		$vaTable7[] 	= array("1"=>"","2"=>"b. Tanggal Kepulangan","3"=>" " .scDate::String2Date($dbRow['date_back']) ) ;

		$vaTable8	 	= array() ; 
		$vaTable8[] 	= array("1"=>"VIII","2"=>"Keterangan","3"=>" " .$dbRow['description'] ) ;

		$vaTable10	 	= array() ; 
		$vaTable10[] 	= array("1"=>"VII","2"=>"Pengikut") ;

		$vaTable9 		= array() ; 
		$nRow 			= 1 ; 
		$ncab 			= "Kancab Bandung" ; 
		$vaTable9[] 	= array("2"=>"No","3"=>"Nama","4"=>"NIP","5"=>"Gol","6"=>"Jabatan","7"=>"Unit Kerja") ;
		foreach ($vaPengikut as $key => $vaData) {
			$vaPengikut_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaData['golongan']}'","sc_master") ;  ; 
			$vaTable9[] 	= array("2"=>"".$nRow++."","3"=>$vaData['nama'],"4"=>$vaData['nip'],"5"=>"".$vaPengikut_Gol['Title']."","6"=>$vaData['jabatan'],"7"=>$ncab) ;
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
		$vaTtd[]		= array("x"=>"","1"=>"<u>".$vaPejabat["nama"]."</u>") ;  
		$vaTtd[]		= array(""=>"","1"=>$vaPejabat['jabatan']) ; 


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
		$pdf->ezTable($vaTable10,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1),
												  "2"	=>array("width"=>97,"wrap"=>1,"justification"=>"left") ) )) ;
		$pdf->ezTable($vaTable9,"","",array("showLines"=>2,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("2"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "3"	=>array("width"=>29,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("width"=>16,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("width"=>5,"wrap"=>1,"justification"=>"center"),
												  "6"	=>array("width"=>29,"wrap"=>1,"justification"=>"center"),
												  "7"	=>array("width"=>18,"wrap"=>1,"justification"=>"center")) )) ;
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
		$pdf->ezTable($vaTtd,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("x"	=>array("width"=>50,"wrap"=>1,"justification"=>"center"),
												  "1"	=>array("width"=>40,"wrap"=>1,"justification"=>"center")) )) ;

		// LEMBAR OPD - MGT
		// . $dbRow['place_to']

		$vaDate 		= scDate::Date2Var($dbRow['date']) ;  
		$vapage2 		= array() ; 
		$vapage2[]		= array("1"=>"Dasar SKPD No","2"=>":","3"=>$code) ; 
		$vapage2[]		= array("1"=>"Tanggal","2"=>":","3"=>$vaDate["Tgl"] . " " . $vaDate['Bulan'] . " " . $vaDate['Tahun']) ; 
		$vapage2[]		= array("1"=>"Dibayarkan Kepada","2"=>":","3"=>$vaLeader['nama']) ; 

		$vapage3 		= array() ; 
		$vapage3[]		= array("1"=>"NO","2"=>"URAIAN","3"=>"JUMLAH","4"=>"JUMLAH (Rp)","5"=>"PPh 21 (Rp)") ; 

		$vaTable4 		= array() ; 
		$nRow 			= 2 ; 
		$vapage4[]		= array("1"=>"I","2"=>"BIAYA LUMPSUM","3"=>"","4"=>"","5"=>"") ; 
		$vapage4[]		= array("1"=>"","2"=>"BIAYA HARIAN " .$dbRow['inputjenis']  ,"3"=>"","4"=>"","5"=>"") ;

		if($dbRow['inputjenis'] == "DALAM KOTA"){
			if($vaLeader_Gol['Title'] == "I" || $vaLeader_Gol['Title'] == "II" || $vaLeader_Gol['Title'] == "III" || $vaLeader_Gol['Title'] == "IV")
			{
				$BiayaPerjalanan_leader = "100000";
			}
			elseif($vaLeader_Gol['Title'] == "V" || $vaLeader_Gol['Title'] == "VI" || $vaLeader_Gol['Title'] == "VII" || $vaLeader_Gol['Title'] == "VIII") 
			{
				$BiayaPerjalanan_leader = "100000";
			}
			elseif($vaLeader_Gol['Title'] == "IX" || $vaLeader_Gol['Title'] == "X" || $vaLeader_Gol['Title'] == "XI" || $vaLeader_Gol['Title'] == "XII") 
			{
				$BiayaPerjalanan_leader = "125000";
			}
		}
		else{
			if($vaLeader_Gol['Title'] == "I" || $vaLeader_Gol['Title'] == "II" || $vaLeader_Gol['Title'] == "III" || $vaLeader_Gol['Title'] == "IV")
			{
				$BiayaPerjalanan_leader = "300000";
			}
			elseif($vaLeader_Gol['Title'] == "V" || $vaLeader_Gol['Title'] == "VI" || $vaLeader_Gol['Title'] == "VII" || $vaLeader_Gol['Title'] == "VIII") 
			{
				$BiayaPerjalanan_leader = "350000";
			}
			elseif($vaLeader_Gol['Title'] == "IX" || $vaLeader_Gol['Title'] == "X" || $vaLeader_Gol['Title'] == "XI" || $vaLeader_Gol['Title'] == "XII") 
			{
				$BiayaPerjalanan_leader = "400000";
			}
		}

		$pajak			= $vaLeader['pajak'] * $BiayaPerjalanan_leader / 100 ;
		$vapage4[]		= array("1"=>"1","2"=>$vaLeader['nama'],"3"=>"1","4"=>number_format($BiayaPerjalanan_leader),"5"=>number_format($pajak)) ; 

		foreach ($vaPengikut as $key => $vaData) {
			$vaPengikut_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaData['golongan']}'","sc_master") ;

			if($dbRow['inputjenis'] == "DALAM KOTA"){
				if($vaPengikut_Gol['Title'] == "I" || $vaPengikut_Gol['Title'] == "II" || $vaPengikut_Gol['Title'] == "III" || $vaPengikut_Gol['Title'] == "IV")
				{
					$BiayaPerjalanan = "100000";
				}
				elseif($vaPengikut_Gol['Title'] == "V" || $vaPengikut_Gol['Title'] == "VI" || $vaPengikut_Gol['Title'] == "VII" || $vaPengikut_Gol['Title'] == "VIII") 
				{
					$BiayaPerjalanan = "100000";
				}
				elseif($vaPengikut_Gol['Title'] == "IX" || $vaPengikut_Gol['Title'] == "X" || $vaPengikut_Gol['Title'] == "XI" || $vaPengikut_Gol['Title'] == "XII") 
				{
					$BiayaPerjalanan = "125000";
				}
			}
			else{
				if($vaPengikut_Gol['Title'] == "I" || $vaPengikut_Gol['Title'] == "II" || $vaPengikut_Gol['Title'] == "III" || $vaPengikut_Gol['Title'] == "IV")
				{
					$BiayaPerjalanan = "300000";
				}
				elseif($vaPengikut_Gol['Title'] == "V" || $vaPengikut_Gol['Title'] == "VI" || $vaPengikut_Gol['Title'] == "VII" || $vaPengikut_Gol['Title'] == "VIII") 
				{
					$BiayaPerjalanan = "350000";
				}
				elseif($vaPengikut_Gol['Title'] == "IX" || $vaPengikut_Gol['Title'] == "X" || $vaPengikut_Gol['Title'] == "XI" || $vaPengikut_Gol['Title'] == "XII") 
				{
					$BiayaPerjalanan = "40000";
				}
			}
			$pajak_pengikut			= $vaData['pajak'] * $BiayaPerjalanan / 100 ;
			$vapage4[]		= array("1"=>"".$nRow++."","2"=>$vaData['nama'],"3"=>"1","4"=>number_format($BiayaPerjalanan),"5"=>number_format($pajak_pengikut)) ; 
			$subtotal+= $BiayaPerjalanan;
			$subtotal_pajak+= $pajak_pengikut;
		}

		$vapage5 		= array() ; 
		$jumlah1		= $BiayaPerjalanan_leader + $subtotal ;
		$jumlah_pajak	= $pajak + $subtotal_pajak ;
		$vapage5[]		= array("1"=>"","2"=>"JUMLAH I" ,"3"=>"","4"=>number_format($jumlah1),"5"=>number_format($jumlah_pajak)) ;

		$vapage6 		= array() ;  
		$vapage6[]		= array("1"=>"II","2"=>"BIAYA AT COST","3"=>"","4"=>"","5"=>"") ; 
		$vapage6[]		= array("1"=>"","2"=>"BIAYA TRANSPORTASI","3"=>"","4"=>number_format($dbRow['b_transport']),"5"=>"") ; 
		$vapage6[]		= array("1"=>"","2"=>"TOL","3"=>"","4"=>number_format($dbRow['b_tol']),"5"=>"") ; 
		$vapage6[]		= array("1"=>"","2"=>"SEWA MOBIL","3"=>"","4"=>number_format($dbRow['b_sewamobil']),"5"=>"") ; 
		$vapage6[]		= array("1"=>"","2"=>"BIAYA PENGINAPAN","3"=>"","4"=>number_format($dbRow['b_penginapan']),"5"=>"") ; 

		$vapage7 		= array() ; 
		$jumlah3		= $dbRow['b_transport'] + $dbRow['b_tol'] + $dbRow['b_sewamobil'] + $dbRow['b_penginapan'] ;
		$vapage7[]		= array("1"=>"","2"=>"JUMLAH II" ,"3"=>"","4"=>number_format($jumlah3),"5"=>"") ;

		$vapage8 		= array() ; 
		$jumlah2		= $jumlah1 + $jumlah3 ;
		$vapage8[]		= array("1"=>"III","2"=>"JUMLAH BIAYA PERJALANAN DINAS" ,"3"=>"","4"=>number_format($jumlah2),"5"=>"") ;

		$vapage9 		= array() ;  
		$nRow 			= 2 ; 
		$vapage9[]		= array("1"=>"IV","2"=>"JUMLAH YANG DITERIMA","3"=>"","4"=>"","5"=>"") ; 
		$pajak_leader 	= $BiayaPerjalanan_leader * $vaLeader['pajak'] / 100 ;
		$biayabersih_leader	= $BiayaPerjalanan_leader - $pajak_leader ;
		$vapage9[]		= array("1"=>"1","2"=>$vaLeader['nama'],"3"=>"1","4"=>number_format($biayabersih_leader),"5"=>number_format($pajak_leader)) ; 

		foreach ($vaPengikut as $key => $vaData) {
			$vaPengikut_Gol	= scSys::GetKeterangan("Title,Description","Id = '{$vaData['golongan']}'","sc_master") ;

			if($dbRow['inputjenis'] == "DALAM KOTA"){
				if($vaPengikut_Gol['Title'] == "I" || $vaPengikut_Gol['Title'] == "II" || $vaPengikut_Gol['Title'] == "III" || $vaPengikut_Gol['Title'] == "IV")
				{
					$BiayaPerjalanan = "100000";
				}
				elseif($vaPengikut_Gol['Title'] == "V" || $vaPengikut_Gol['Title'] == "VI" || $vaPengikut_Gol['Title'] == "VII" || $vaPengikut_Gol['Title'] == "VIII") 
				{
					$BiayaPerjalanan = "100000";
				}
				elseif($vaPengikut_Gol['Title'] == "IX" || $vaPengikut_Gol['Title'] == "X" || $vaPengikut_Gol['Title'] == "XI" || $vaPengikut_Gol['Title'] == "XII") 
				{
					$BiayaPerjalanan = "125000";
				}
			}
			else{
				if($vaPengikut_Gol['Title'] == "I" || $vaPengikut_Gol['Title'] == "II" || $vaPengikut_Gol['Title'] == "III" || $vaPengikut_Gol['Title'] == "IV")
				{
					$BiayaPerjalanan = "300000";
				}
				elseif($vaPengikut_Gol['Title'] == "V" || $vaPengikut_Gol['Title'] == "VI" || $vaPengikut_Gol['Title'] == "VII" || $vaPengikut_Gol['Title'] == "VIII") 
				{
					$BiayaPerjalanan = "350000";
				}
				elseif($vaPengikut_Gol['Title'] == "IX" || $vaPengikut_Gol['Title'] == "X" || $vaPengikut_Gol['Title'] == "XI" || $vaPengikut_Gol['Title'] == "XII") 
				{
					$BiayaPerjalanan = "40000";
				}
			}

			$pajak_pengikut			= $vaData['pajak'] * $BiayaPerjalanan / 100 ;
			$biayabersih			= $BiayaPerjalanan - $pajak_pengikut ;
			$vapage9[]				= array("1"=>$nRow++,"2"=>$vaData['nama'],"3"=>"1","4"=>number_format($biayabersih),"5"=>number_format($pajak_pengikut)) ; 
			$subtotal_bersih += $biayabersih;
		}
		$vapage9[]		= array("1"=>"","2"=>"","3"=>"","4"=>"","5"=>"") ; 
		$vapage9[]		= array("1"=>"","2"=>"BIAYA AT COST","3"=>"","4"=>number_format($jumlah3),"5"=>"") ; 

		$total_bersih 	=	$subtotal_bersih + $biayabersih_leader ;
		$jumlah_III		=	$total_bersih + $jumlah3 ;

		$vapage10 		= array() ; 
		$vapage10[]		= array("1"=>"","2"=>"JUMLAH III" ,"3"=>"","4"=>number_format($jumlah_III),"5"=>number_format($jumlah_pajak)) ;

		$vaDate 		= scDate::Date2Var($dbRow['date']) ; 

		$vaTtd1 		= array() ; 
		$vaTtd1[]		= array("x"=>"PERUM BULOG KANCAB BANDUNG","1"=>"","2"=>"BANDUNG, ".$vaDate["Tgl"] . " " . $vaDate['Bulan'] . " " . $vaDate['Tahun']) ; 
		if($vaPejabat['nip'] !== scSys::GetConfig("sc_kepala_dinas")){
			$vaTtd1[]	= array("x"=>"MENGETAHUI,","1"=>"YANG MENERIMA,","2"=>"KASI MINKU" ) ; 
		}
		$vaTtd1[]		= array("x"=>"","1"=>"") ; 
		$vaTtd1[]		= array("x"=>"","1"=>"") ; 
		$vaTtd1[]		= array("x"=>"","1"=>"") ; 
		$vaTtd1[]		= array("x"=>$vaPejabat["nama"],"1"=>$vaLeader['nama'],"2"=>"KRISTINA INDRIANI A") ;  
		$vaTtd1[]		= array("x"=>$vaPejabat['jabatan'],"1"=>"","2"=>"") ; 

		$pdf->ezNewPage() ;
		$pdf->ezImage( scSys::GetConfig("sc_header") ,false , 100 , 600) ;  
		$pdf->ezText("") ; 
		$pdf->ezTable($vapage2,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>25,"wrap"=>1),
												  "2"	=>array("width"=>2,"wrap"=>1),
												  "3"	=>array("wrap"=>30,"wrap"=>1) ) )) ;

		$pdf->ezText("") ; 
		$pdf->ezTable($vapage3,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1,"justification"=>"center"),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezTable($vapage4,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezTable($vapage5,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1,"justification"=>"right"),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezTable($vapage6,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezTable($vapage7,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1,"justification"=>"right"),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;
												  
		$pdf->ezTable($vapage8,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezTable($vapage9,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezTable($vapage10,"","",array("showLines"=>1,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("1"	=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
												  "2"	=>array("width"=>49,"wrap"=>1,"justification"=>"right"),
												  "3"	=>array("width"=>10,"wrap"=>1,"justification"=>"center"),
												  "4"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center"),
												  "5"	=>array("wrap"=>22,"wrap"=>1,"justification"=>"center") ) )) ;

		$pdf->ezText("") ; 
		$pdf->ezText("") ; 
		$pdf->ezTable($vaTtd1,"","",array("showLines"=>0,"showHeadings"=>0,"fontSize"=>$nFont, "cols"=> 
											array("x"	=>array("wrap"=>1,"justification"=>"center"),
												  "1"	=>array("wrap"=>1,"justification"=>"center"),
												  "2"	=>array("wrap"=>1,"justification"=>"center")) )) ;

		$pdf->ezStream() ; 

	}  
?>  
<?php 
	$vaData	= array() ; 
	$dbData	= $scDb->Browse("pegawai","*") ; 
	$nRow 	= 1 ;
	$vaData[]		= array("NO"=>1,"NAMA"=>2,"NIP"=>3,"ALAMAT"=>"","PANGKAT;GOLONGAN / RUANG"=> 4,
						"PANGKAT;TMT"=> 5,"JABATAN;NAMA"=> 6,"JABATAN;TMT"=> 7,"MASA KERJA;THN"=> 8,
						"MASA KERJA;BLN"=> 9,"LATIHAN JABATAN;NAMA"=> 10,"LATIHAN JABATAN;TGL LULUS"=> 11,
						"LATIHAN JABATAN;JML JAM"=> 12,"PENDIDIKAN;NAMA"=> 13,
						"PENDIDIKAN;TAHUN LULUS"=> 14,"PENDIDIKAN;TK IJAZAH"=> 15,"TEMPAT TANGGAL LAHIR"=> 16,
						"CATATAN MUTASI"=> 17, "KETERANGAN"=> 18) ;
	while($dbRow 	= $scDb->GetRow($dbData)){
		$vaData[]		= array("NO"=>$nRow++,"NAMA"=>$dbRow['nama'],"NIP"=>$dbRow['nip'],"ALAMAT"=>$dbRow['-'],
							"PANGKAT;GOLONGAN / RUANG"	=> $dbRow['golongan'],
							"PANGKAT;TMT"				=> scDate::String2Date($dbRow['-']),
							"JABATAN;NAMA"				=> $dbRow['jabatan'],
							"JABATAN;TMT" 				=> scDate::String2Date($dbRow['-']),
							"MASA KERJA;THN"			=> $dbRow['-'],
							"MASA KERJA;BLN"			=> $dbRow['-'],
							"LATIHAN JABATAN;NAMA"		=> $dbRow['-'],
							"LATIHAN JABATAN;TGL LULUS" => scDate::String2Date($dbRow['-l']),
							"LATIHAN JABATAN;JML JAM"	=> $dbRow['-'],
							"PENDIDIKAN;NAMA"			=> $dbRow['-'],
							"PENDIDIKAN;TAHUN LULUS"	=> $dbRow['-'],
							"PENDIDIKAN;TK IJAZAH"		=> $dbRow['-'],
							"TEMPAT TANGGAL LAHIR"		=> $dbRow['-'] . " " . scDate::String2Date($dbRow['-']),
							"CATATAN MUTASI"			=> $dbRow['-'], 
							"KETERANGAN"				=> $dbRow['-']) ;	
	} 

	$vaDate 	= scDate::Date2Var(date("Y-m-d")) ; 
	$nFont		= 8 ; 
	$pdf 		= new Cezpdf("A3","L",$vaOpt) ; 
	$pdf->ezHeader("<b>UNIT KERJA : DINAS KEHUTANAN DAN PERKEBUNAN KAB. PATI</b>",array("fontSize"=>$nFont+2)); 
	$pdf->ezHeader("<b>KEADAAN : BULAN ".$vaDate['Bulan'] . " " . $vaDate['Tahun'] ."</b>",array("fontSize"=>$nFont+2)); 
	$pdf->ezHeader("") ; 
	$pdf->ezTable($vaData,"","",array("fontSize"=>$nFont, 
						"cols"=>array("NO"=>array("width"=>2,"justification"=>"center"), 
									"NAMA"=>array("width"=>8,"wrap"=>1),
									"NIP"=>array("width"=>8,"wrap"=>1,"justification"=>"center"),
									"ALAMAT"=>array("wrap"=>1),  
									"PANGKAT;GOLONGAN / RUANG"=>array("width"=>7,"wrap"=>1),
									"PANGKAT;TMT"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
									"JABATAN;NAMA"=>array("width"=>7,"wrap"=>1),
									"JABATAN;TMT"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
									"MASA KERJA;THN"=>array("width"=>3,"wrap"=>1,"justification"=>"center"),
									"MASA KERJA;BLN"=>array("width"=>3,"wrap"=>1,"justification"=>"center"),
									"LATIHAN JABATAN;NAMA"=>array("width"=>7,"wrap"=>1),
									"LATIHAN JABATAN;TGL LULUS"=>array("width"=>5,"wrap"=>1,"justification"=>"center"),
									"LATIHAN JABATAN;JML JAM"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
									"PENDIDIKAN;NAMA"=>array("width"=>7,"wrap"=>1),
									"PENDIDIKAN;TAHUN LULUS"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
									"PENDIDIKAN;TK IJAZAH"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
									"TEMPAT TANGGAL LAHIR"=>array("width"=>7,"wrap"=>1),
									"CATATAN MUTASI"=>array("width"=>5,"wrap"=>1),
									"KETERANGAN"=>array("width"=>5,"wrap"=>1) ))) ; 
	$pdf->ezStream() ; 

?>
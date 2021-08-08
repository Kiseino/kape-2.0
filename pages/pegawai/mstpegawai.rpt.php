<?php 
	$vaData	= array() ; 
	$dbData	= $scDb->Browse("pegawai","*") ; 
	$nRow 	= 1 ;
	$vaData[]		= array("NO"=>1,"NAMA"=>2,"NIP"=>3,"PANGKAT;GOLONGAN / RUANG"=> 4,
						"PANGKAT;TMT"=> 5,"JABATAN;NAMA"=> 6,"JABATAN;TMT"=> 7) ;
	while($dbRow 	= $scDb->GetRow($dbData)){
		$vaData[]		= array("NO"=>$nRow++,"NAMA"=>$dbRow['nama'],"NIP"=>$dbRow['nip'],
							"PANGKAT;GOLONGAN / RUANG"	=> $dbRow['golongan'],
							"PANGKAT;TMT"				=> scDate::String2Date($dbRow['-']),
							"JABATAN;NAMA"				=> $dbRow['jabatan'],
							"JABATAN;TMT" 				=> scDate::String2Date($dbRow['-']),
							) ;	
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
									"PANGKAT;GOLONGAN / RUANG"=>array("width"=>7,"wrap"=>1),
									"PANGKAT;TMT"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
									"JABATAN;NAMA"=>array("width"=>7,"wrap"=>1),
									"JABATAN;TMT"=>array("width"=>4,"wrap"=>1,"justification"=>"center"),
								 ))) ; 
	$pdf->ezStream() ; 

?>
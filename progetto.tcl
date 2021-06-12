source ./scripts/pt_analysis


global area_iniziale, leakage_power, switching_power

#################################################
proc evaluate_area { } {
	#stefano
}

##################################################
proc switching_power { } {
	
	#claudia
}

####################################################
proc leakage_power { } {

 #claudia	
}

####################################################
proc swap { } {
	#stefano
}

######################################################
proc score { } {

	#sclaudia
}




##########################
proc optimize { start_main allowed_slack} {
	#mattia
	#power totale

	while {
		#swap iniziale sul non critical path fino a raggiungere slack minore LVT->HVT
	}
	
	if ;#check tempo massimo raggiunto 
		while { 
			while { ;#ciclo su ogni nodo facendo resizing considerando anche HVT

			if ;#check tempo massimo raggiunto
			}
			#swap se hai miglioramenti nel slack LVT->HVT
		}
		
	}
	
	
}

###############################
proc dualVth {args} {
	parse_proc_arguments -args $args results
	set allowed_slack $results(-allowed_slack)
	
	#################################
	### INSERT YOUR COMMANDS HERE
	set start_main [ clock seconds ] ; #timestamp at the start of the proc
	optimize $start_main $allowed_slack ; #main here (call to our fuction):
	#################################

	return
}

define_proc_attributes dualVth \
-info "Post-Synthesis Dual-Vth Cell Assignment and Gate Re-Sizing" \
-define_args \
{
	{-allowed_slack "allowed slack after the optimization (valid range [-OO, 0])" value float required}
}

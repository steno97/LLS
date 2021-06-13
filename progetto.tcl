source ./scripts/pt_analysis


global area_iniziale, leakage_power, switching_power

#################################################
proc evaluate_area { } {
	set area [get_attribute [get_design] area ]
	return $area
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
proc cells_swapping { cell_list vt_type} {
	set lista [list]
	foreach cell $cell_list {
		set lib_cell [get_lib_cell -of_object $cell]
		set type [get_attribute $lib_cell threshold_voltage_group]
		puts $type
		if { $type!=$vt_type} {
			set collection [get_alternative_lib_cells $cell]
			foreach_in_collection t $collection {
				#set lib_cell [get_lib_cell -of_object $cell]
				set type [get_attribute $t threshold_voltage_group]
				puts $type
				if {$type ==$vt_type} {
					size_cell $cell $t
					lappend lista $t
					break
				}
			}
		}	
	}
	return $lista
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

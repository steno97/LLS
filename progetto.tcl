source ./scripts/pt_analysis



global area_iniziale, leakage_iniziale, dynamic_iniziale

#################################################
proc evaluate_area { } {
	set area [get_attribute [get_design] area ]
	return $area
}

##################################################
proc dynamic_power { } {
	set dynamic [get_attribute [get_design] dynamic_power ]
	return $dynamic
}

####################################################
proc leakage_power { } {
	set leakage [get_attribute [get_design] leakage_power ]
	return $leakage
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
	set new_design [get_design]
	set area [get_attribute $new_design area ]
	set dynamic [get_attribute $new_design dynamic_power ]
	set leakage [get_attribute $new_design leakage_power ]

	set score [ expr { ($area_iniziale/$area) + ($leakage_iniziale/$leakage) + ($dynamic_iniziale/$dynamic) } ]
	return $score
}




##########################
proc optimize { start_main allowed_slack} {
	#mattia
	#power totale 
	#valori iniziali:
	set leakage_iniziale [get_attribute [get_design] leakage_power ]
	set dynamic_iniziale [get_attribute [get_design] dynamic_power ]
	set area_iniziale [get_attribute [get_design] leakage_power ]

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

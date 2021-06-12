source ./scripts/pt_analysis

################################################
#extract the list of cells belonging to the most critical paths:
set wrt_path_collection [get_timing_paths] ;# collection of timing paths - size 1
foreach_in_collection timing_point [get_attribute $wrt_path_collection points] { ;# scan the collection of timing points belonging to the path
	set cell_name [get_attribute [get_attribute $timing_point object] full_name] ;# for each timing point we can extract multiple attributes (e.g. arrival time)
	set arrival [get_attribute $timing_point arrival]
	puts "$cell_name --> $arrival"
}

#################################################
proc evaluate_area { } {
	
}
##################################################
proc switching_power { } {
	
	
}
####################################################
proc leakage_power { } {
	
}
####################################################
proc optimize { start_main allowed_slack} {
	
	
	
}



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

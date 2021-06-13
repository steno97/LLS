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

open_hw
connect_hw_server
open_hw_target

current_hw_device [lindex [get_hw_devices] 0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices] 0]

set_property PROBES.FILE {} [lindex [get_hw_devices] 0]

set_property PROGRAM.FILE {./top.bit} [lindex [get_hw_devices] 0]

program_hw_devices [lindex [get_hw_devices] 0]
refresh_hw_device [lindex [get_hw_devices] 0]

quit

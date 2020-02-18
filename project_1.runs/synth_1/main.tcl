# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/FPGA/H13D/project_1.cache/wt [current_project]
set_property parent.project_path D:/FPGA/H13D/project_1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {C:/Users/lemme/AppData/Roaming/Xilinx/Vivado/2019.2/xhub/board_store} [current_project]
set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
set_property ip_output_repo d:/FPGA/H13D/project_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  D:/FPGA/H13D/hdl/cpu_new.vhd
  D:/FPGA/H13D/hdl/gpio.vhd
  D:/FPGA/H13D/hdl/mylibrary.vhd
  D:/FPGA/H13D/hdl/ram.vhd
  D:/FPGA/H13D/hdl/registerfile.vhd
  D:/FPGA/H13D/hdl/rom.vhd
  D:/FPGA/H13D/hdl/spimaster.vhd
  D:/FPGA/H13D/hdl/timebase.vhd
  D:/FPGA/H13D/hdl/uart.vhd
  D:/FPGA/H13D/hdl/main.vhd
  D:/FPGA/H13D/hdl/i2cmaster.vhd
}
read_ip -quiet D:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_1/ila_1.xci
set_property used_in_synthesis false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_1/ila_1_ooc.xdc]

read_ip -quiet D:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_0/ila_0.xci
set_property used_in_synthesis false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all d:/FPGA/H13D/project_1.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/FPGA/H13D/constraints/Arty-S7-50-Rev-B-Master.xdc
set_property used_in_implementation false [get_files D:/FPGA/H13D/constraints/Arty-S7-50-Rev-B-Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top main -part xc7s50csga324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

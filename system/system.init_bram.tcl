cd C:/Users/runarbol/Desktop/tdt4255-new/system/system
if { [ catch { xload xmp system.xmp } result ] } {
  exit 10
}
if { [catch {run init_bram} result] } {
  exit -1
}
exit 0

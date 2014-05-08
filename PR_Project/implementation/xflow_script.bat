@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc7k325tffg900-2 -nt timestamp -bm system.bmm "C:/Users/ECE/Documents/PR_Project/implementation/system.ngc" -uc system.ucf system.ngd 


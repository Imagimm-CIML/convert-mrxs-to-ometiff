@echo off
REM Author: Adrien Cailleau-Lepetit
REM Date: 21/02/2023
REM License: MIT
REM Usage: mrxs2tiff.bat X:\Path\to\file.mrxs

REM Set useful variables and options
setlocal EnableDelayedExpansion
set _home=%~dp0
set JAVA_OPTS="-Djna.library.path=%_home:~0,-1%"
set _bioformats2raw="%~dp0bioformats2raw-0.6.0\bin\bioformats2raw.bat"
set _raw2ometiff="%~dp0raw2ometiff-0.4.0\bin\raw2ometiff.bat"

REM Display program info
echo mrxs2tiff v1.2
echo.

REM Loop through arguments
for %%x in (%*) do (
  set _path=%%~dpx
  set _filename=%%~nx
  set _extension=%%~xx

  REM Display info
  echo Submitted file: "!_path!!_filename!!_extension!"
  echo File to generate: "!_path!!_filename!.ome.tiff"
  echo.

  REM Check submitted file existence
  if exist "!_path!!_filename!!_extension!" (
    REM Check file extension
    if "!_extension!" == ".mrxs" (
      REM Convert MRXS file to Zarr pyramid
      echo Converting MRXS file to Zarr pyramid ...
      call %_bioformats2raw% "!_path!!_filename!!_extension!" "!_path!!_filename!-zarrpyramid"
      REM Check for error in last process
      if NOT %errorlevel% == 0 (
        echo An error occured during the conversion from MRXS to Zarr pyramid.
        echo Error code: %errorlevel%
        REM exit /b %errorlevel%
      )
      
      REM Convert Zarr pyramid to OME Tiff
      echo Converting Zarr pyramid to OME Tiff ...
      call %_raw2ometiff% "!_path!!_filename!-zarrpyramid" "!_path!!_filename!.ome.tiff"
      REM Check for error in last process
      if NOT %errorlevel% == 0 (
        echo An error occured during the conversion from Zarr pyramid to OME Tiff.
        echo Error code: %errorlevel%
      )

      REM Delete temporary files (Zarr pyramid and bfmemo)
      echo Deleting temporary files ...
      rmdir /s /q "!_path!!_filename!-zarrpyramid" >nul 2>&1
      del /f /q "!_path!.!_filename!!_extension!.bfmemo" >nul 2>&1
      
      echo Done!
    ) else (
      echo The submitted file is not an MRXS file.
    )
  ) else (
    echo The submitted file could not be found.
  )

  echo.
)

endlocal
pause
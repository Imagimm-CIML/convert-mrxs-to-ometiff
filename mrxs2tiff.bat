@echo off
REM Author: Adrien Cailleau-Lepetit
REM Date: 10/02/2023
REM License: MIT
REM Usage: mrxs2tiff.bat X:\Path\to\file.mrxs

REM Error codes:
REM -1: File not found
REM -2: File is not and MRXS file

REM Set useful variables and options
setlocal
set _home=%~dp0
set JAVA_OPTS="-Djna.library.path=%_home:~0,-1%"
set _bioformats2raw="%~dp0bioformats2raw-0.6.0\bin\bioformats2raw.bat"
set _raw2ometiff="%~dp0raw2ometiff-0.4.0\bin\raw2ometiff.bat"
set _path=%~dp1
set _filename=%~n1
set _extension=%~x1

REM Display info
echo mrxs2tiff v1.0
echo.
echo Submitted file: "%_path%%_filename%%_extension%"
echo File to generate: "%_path%%_filename%.tiff"
echo.

REM Check submitted file existence
if exist "%_path%%_filename%%_extension%" (
  REM Check file extension
  if "%_extension%" == ".mrxs" (
    REM Convert MRXS file to Zarr pyramid
    echo Converting MRXS file to Zarr pyramid ...
    call %_bioformats2raw% "%_path%%_filename%%_extension%" "%_path%%_filename%-zarrpyramid"
    REM Check for error in last process
    if NOT %errorlevel% == 0 (
      echo An error occured during the conversion from MRXS to Zarr pyramid.
      echo Error code: %errorlevel%
      exit /b %errorlevel%
    )
    
    REM Convert Zarr pyramide to OME Tiff
    echo Converting Zarr pyramid to OME Tiff ...
    call %_raw2ometiff% "%_path%%_filename%-zarrpyramid" "%_path%%_filename%.tiff"
    REM Check for error in last process
    if NOT %errorlevel% == 0 (
      echo An error occured during the conversion from Zarr pyramid to OME Tiff.
      echo Error code: %errorlevel%
      exit /b %errorlevel%
    )
    
    echo Done!
    pause
  ) else (
    echo The file is not an MRXS file.
    pause
    exit /b -2
  )
) else (
  echo The submitted file could not be found.
  pause
  exit /b -1
)
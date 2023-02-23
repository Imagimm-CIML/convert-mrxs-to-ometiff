# mrxs2tiff

## Description
mrxs2tiff allows to convert MRXS files to OME TIFF files that can be read in software like QuPath.

## Requirements
 - Hardware (minimum): 2-core CPU @2GHz, 8GB of RAM
 - System: Windows 10/11 (64 bits)
 - Required free space: Your MRXS data (file and folder) x3
 - Software: Java JRE 8 (64 bits), bioformats2raw (included), raw2ometiff (included)

Note: The script won't work with 32 bits systems or Java installation.

## Installation
1- Download the mrxs2tiff package from Github releases (https://github.com/Imagimm-CIML/convert-mrxs-to-ometiff/releases)  
2- Unpack the ZIP archive in release v1.2 in `C:` (it should be `C:\mrxs2tiff`)   
3- [OPTIONAL] Copy (or create) the link to mrxs2tiff.bat in `C:\mrxs2tiff\mrxs2tiff.lnk` to your desktop (or public desktop)  
4- Drag and drop your MRXS file(s) to the shortcut (or the `mrxs2tiff.bat` file)  
5- Wait for the conversion process to complete (~ 10 min for 10 GB)  
![Drag and drop example screenshot](https://user-images.githubusercontent.com/41480459/220156842-83284af8-8742-43a1-b3f9-2b1d74ffd743.jpg)  
6- Now, you can use QuPath/CellPose to count cells in annotation  
![QuPath example screenshot](https://user-images.githubusercontent.com/41480459/220325043-0a3c61a8-b91a-426c-b53b-8f33809234bf.jpg)  

## Usage
> mrxs2tiff.bat <absolute_file_path> [<absolute_file_path2> ...]

## Notes
The folder containing mrxs2tiff and its dependencies must be stored in a shot path ("C:\" is recommended), otherwise errors will happen (for bioformats2raw and raw2ometiff).
The script works better (and faster) with local MRXS data (I=i.e. on your C: drive), as there might be some errors/warnings on shared storages.

## Support
If you would like to submit issues, please do so in the Issues section.

## Authors and acknowledgment
Main developer: Adrien CAILLEAU-LEPETIT
Repository maintainer: Mathieu FALLET

## License
The `mrxs2tiff.bat` script is licensed under the MIT License (https://opensource.org/licenses/MIT).
However, some tools have their own licenses as listed below:
 - [bioformats2raw](https://github.com/glencoesoftware/bioformats2raw): [GPLv2](https://github.com/glencoesoftware/bioformats2raw/blob/master/LICENSE.txt)
 - [raw2ometiff](https://github.com/glencoesoftware/raw2ometiff): [GPLv2](https://github.com/glencoesoftware/raw2ometiff/blob/master/LICENSE.txt)
 - [blosc](https://github.com/Blosc/c-blosc): [BSD](https://github.com/Blosc/c-blosc/blob/main/LICENSE.txt)



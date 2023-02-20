This package contains the following components:
 - mrxs2tiff.bat (main script)
 - blosc.dll (required dependency)
 - bioformats2raw 0.6.0
 - raw2ometiff 0.4.0

Other dependencies (to install yourself):
 - Java JRE 8


How to use mrxs2tiff?
----
To use mrxs2tiff, you must type this in a command prompt: mrxs2tiff.bat "X:\Path\of\the\file.mrxs"
However, you can also drag your MRXS file and drop it on the mrxs2tiff.bat icon.
You can also create a link on the desktop to make it easier for users.


Important notes
----
The folder containing mrxs2tiff and its dependencies must be stored in a shot path ("C:\" is recommended), otherwise errors will happen (for bioformats2raw and raw2ometiff).
The script works better with local MRXS data (on your C: drive), as there might be some errors/warnings on shared storages (like DOSI).
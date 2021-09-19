# Piano in 162 for Logic Sampler

This repository contains Logic Sampler (also known as EXS24) instrument patch for the excellent [Piano in 162](https://ivyaudio.com/Piano-in-162) sample library. There are also several channel strip patches available with smart controls for microphone mix and quick access to key effects like compressor or key response.

![Smart Controls](/Screenshots/Smart Controls.png)

Brief overview of what is available:

* multiple output Logic Sampler instrument patch in two mic configurations (close, ambient)
* 5 channel strip patches with Smart Controls (click for an MP3 preview):
  * [Piano 162 Init](/Previews/Piano 162 Init.mp3)
  * [Piano 162 Init](/Previews/Piano 162 Init.mp3)
* Smart Controls for all strip patches:
  * _Microphones - Close_: volume of the close microphones.
  * _Microphones - Ambient_: volume of the ambient microphones.
  * _Dynamic - Compression_: channel compression gain and threshold, leftmost position is a bypass.
  * _FX - Low_: channel equalizer low frequency control.
  * _FX - Key response_: velocity processor gain and ratio for light touch, leftmost position for natural response.
  * _FX - High_: channel equalizer high frequency control.

![Smart Controls](/Screenshots/Zone Editor.png)

No conversion tool was used to create this instrument, it was all made from sctratch manually note by note. Start and end of each sample was audited multiple times, volume was manually modified for the best possible experience and few problems and artifacts fixed.

All patches were created in Logic Pro X 10.6 and may not be compatible with older version of either Logic Pro, or Logic Sampler (EXS24 in older versions).

## What is Piano in 162

Piano in 162 is a sample library of a Steinway Model B grand piano for Native Instrument Kontakt as well as other formats excluding Logic Pro. It was created by Simon Dalzell and made available free of charge, however, redistribution of the sample content is not allowed. Therefore, this repository only contains Logic patches. To get the instrument working in Logic, Piano in 162 sample content must be [downloaded separately](https://ivyaudio.com/Piano-in-162) (SFZ version). Since it is a huge download, feel free to start it on the background while you can finish reading this page.

The grand piano was sampled in high quality (96kHz) with two mic configurations (close and ambient) without and with sustain pedal for sympathetic resonance. Each of the 88 keys has five velocity levels (pp, p, mp, mf, f), every sample is present twice for round-robin and sample files are well organized with good names.

The download size is 4.7 GB and all 3520 samples are distributed in FLAC format, an efficient loseless compression. Logic Sampler does not support FLAC encoding, therefore all samples must be converted to WAV in order to be able to load the instrument. Make sure you have at least 19 GB of free space.

## Instructions

### A) Download and setup patches

1. Download [Piano162Logic.zip](https://github.com/lzap/Piano162Logic).
1. Extract the archive.
1. Copy all three folders from `Audio Music Apps` into your home directory in `Audio Music Apps`.
  1. Folder `Audio Music Apps/Sampler Instruments/Piano 162` contains Logic Sampler patch.
  1. Folder `Audio Music Apps/Channel Strip Settings/Instrument` contains chanel strip patches.
  1. Folder `Audio Music Apps/Samples/Piano 162` is empty: this is where sample content must be copied.
1. You can now delete the `Piano162Logic.zip` archive and the rest of the extracted content.

Now, I understand that not everyone is able to fiddle around with sample conversion, so I created a script that will do everything for you. If you are not comfortable with typing commands in MacOS Terminal, use (B1) option and figure out UNIX commands yourself. Otherwise, use (B2) option to use a script that will do everything for you.

### B1) Download and setup samples (manually)

1. Download [Piano in 162 SFZ version](https://ivyaudio.com/Piano-in-162).
1. Use The Unarchiver or 7-Zip (both available in Apple App Store or on the web) to extract the ZIP archive. MacOS (Big Sur) was unable to extract the archive because it uses more recent ZIP format and it will report a corruption.
1. New folder named `Piano in 162 Samples` will be created with `Close` and `Ambient` subfolders both containing two additional subfolders (with and without sustain pedal).
1. Delete all files named `*2Ambient.flac` and `*2Close.flac`, the instrument patch does not use round robin and this will save you a lot of space. There are many of them, see below how to do this automatically.
1. Convert all FLAC files into WAV files. Some [conversion tools](https://www.mediahuman.com/audio-converter/) will have "extra" features like removing silence or normalizing audio, make sure NOT to use any of these features and extract everything as-is.
1. Delete the source FLAC files as they are no longer needed.
1. Put the samples in WAV format into your home folder into `Audio Music Apps/Samples/Piano 162`.

Feel free to flatten the directory structure if needed, Logic Pro will find samples regardless of their paths. Just do not rename samples, they MUST have the very same names except the extension (WAV instead of FLAC). Also keep case sensitivity.

### B2) Download and setup samples (script)

I created a script that will install [MacOS Homebrew](https://brew.sh) if it is not already installed. Then it will install [p7zip](https://formulae.brew.sh/formula/p7zip) and [flac](https://formulae.brew.sh/formula/flac) command line utilities. And finally it will use the utilities to extract, convert and drop unwanted samples. This is how to use it:

1. Make sure to have at least 19 GB of free space.
1. Move the `Ivy Audio - Piano in 162 sfz.zip` into the `PianoIn162Logic` folder next to the `convert.sh` script.
1. Open up MacOS terminal with Command-Space and typing "terminal" with Enter key.
1. Navigate to the `PianoIn162Logic` folder extracted above: `cd ~/Downloads/Piano162Logic`
1. Run the script: `bash convert.sh`
1. The extraction and conversion takes some time, have a break.
1. Move folders `Close` and `Ambient` from `PianoIn162Logic/Audio Music Apps/Samples/Piano 162` into your home folder under `Audio Music Apps/Samples/Piano 162`. Do not copy, these folders are huge (use Shift key and drag to move).

If you run into problems with the script, create [a discussion](https://github.com/lzap/Piano162Logic/discussions) topic and include your MacOS version, make a screenshot or copy and paste the error from the terminal.

## Credits

* Simon Dalzell - Piano in 162 sample content
* Lukáš Zapletal - Logic Pro instrument and patches

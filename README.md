# Piano in 162 for Logic Sampler

This repository contains Logic Sampler (also known as EXS24) instrument patch for the excellent [Piano in 162](https://ivyaudio.com/Piano-in-162) sample library (14 GB). There are also several channel strip patches available with smart controls for microphone mix and quick access to key effects like compressor or key response.

![Smart Controls](/Screenshots/Smart%20Controls.png)

Brief overview of what is available:

* multiple output Logic Sampler instrument patch in two mic configurations (close, ambient)
* filter cutoff modulated by velocity to flatten out sharpness of the tone
* 5 channel strip patches with Smart Controls (click for an MP3 preview):
  * [Piano 162 Init](/Previews/Piano%20162%20Init.mp3): both close and ambient mics, no compression, natural velocity.
  * [Piano 162 Init Loud](/Previews/Piano%20162%20Init%20Loud.mp3): both close and ambient mics, some compression, light velocity.
  * [Piano 162 Close](/Previews/Piano%20162%20Close.mp3): more close than ambient mix, no compression, natural velocity.
  * [Piano 162 Ambient](/Previews/Piano%20162%20Ambient.mp3): more ambient than close mix, no compression, natural velocity.
  * [Piano 162 Pop](/Previews/Piano%20162%20Pop.mp3): mostly close mic mix, ton of compression, lighter velocity.
* Smart Controls for all strip patches:
  * _Microphones - Close_: volume of the close microphones.
  * _Microphones - Ambient_: volume of the ambient microphones.
  * _Dynamic - Compression_: channel compression gain and threshold, leftmost position is a bypass.
  * _FX - Low_: channel equalizer low frequency control.
  * _FX - Key response_: velocity processor gain and ratio for light touch, leftmost position for natural response.
  * _FX - High_: channel equalizer high frequency control.

![Smart Controls](/Screenshots/Zone%20Editor.png)

No conversion tool was used to create this instrument, it was all made from sctratch manually note by note. Start and end of each sample was audited multiple times, volume was manually modified for the best possible experience and few problems fixed. This was all done in my free time, I am not a professional sound designer.

All patches were created in Logic Pro X 10.6 and may not be compatible with older version of either Logic Pro, or Logic Sampler (EXS24 in older versions).

## What is Piano in 162

Piano in 162 is a sample library of a Steinway Model B grand piano for Native Instrument Kontakt as well as other formats excluding Logic Pro. It was created by Simon Dalzell and made available free of charge, however, redistribution of the sample content is not allowed. Therefore, this repository only contains Logic patches. To get the instrument working in Logic, Piano in 162 sample content must be [downloaded separately](https://ivyaudio.com/Piano-in-162) (SFZ version). Since it is a huge download, feel free to start it on the background while you can finish reading this page.

The grand piano was sampled in high quality (96kHz) with two mic configurations (close and ambient) without and with sustain pedal for sympathetic resonance. Each of the 88 keys has five velocity levels (pp, p, mp, mf, f), every sample is present twice for round-robin and sample files are well organized with good names.

The download size is 4.7 GB and all 3520 samples are distributed in FLAC format, an efficient loseless compression. Logic Sampler does not support FLAC encoding, therefore all samples must be converted to WAV in order to be able to load the instrument. Make sure you have at least 19 GB of free space before you start.

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

## Limitations or issues

Logic Sampler is limited to polyphony of 99 voices and since each note triggers two samples (both close and ambient mics), the total polyphony is 50 effectively. This could be workarounded by creating separate Sampler instances but I wanted to keep things simple and also it makes no sense to try to compete with professional sample libraries or even physical modelling or hybrid instruments. They will always sound better with much greater polyphony.

The sample content library comes with round-robins for each individual sample and Logic Sampler is capable of round-robin sampling. However, for practical reasons I ended up using just samples named with "1". Double the samples, double the work on getting a good sound from them.

One ambient pianissimo sample was incorrectly recorded (there is a silence essentially) and although I could use its round-robin counterpart, again, I wanted to keep things simple. Therefore a pitched neighbor is used as a replacement.

Although I did my best to level out velocities for each individual sample as well as for groups, there is still apparent sample change between layers. Therefore I used velocity x-fade across 3 MIDI levels which smooths the transition a bit.

There is a bit of noise, apparently in the ambient samples. I added a bit of fade-out for each sample to smooth it out.

## Background

You maybe wonder why I created a Logic Sampler instrument while Piano in 162 is available for Kontakt and also via free and open SFZ instrument format. Well, after Apple introduced their first M1 models of laptops and Macs, there were no SFZ instrument plugins in native format. Although Rosetta is working fine, I wanted the best possible performance.

Another reason was to try out the new Logic Sampler because workflow was vastly improved. And I have to say it is a wonderful experience and in my experience, it is the best sampler I have ever worked with. I also own Reason with its, ehm, NN19 and NN-XT, tried EXS24, Renoise and few others. Logic Sampler has a ton of capabilities, it recognizes root notes from filenames or, which was particularly useful for this instrument, keeps filename ordering when samples are dragged into the map screen. Also sample audition via arrow keys was fast, snap to transition/0dB as well as fade-in, fade-out and group operations on zones and groups was very useful.

So there you have it, enjoy this piano.

## Thanks

Huge thanks to Simon Dalzell for the sample library.

## Feedback or problems

I am looking for any kind of feedback or contributions, just create [a discussion](https://github.com/lzap/Piano162Logic/discussions) topic. When reporting problems, include your MacOS version, make a screenshot or copy and paste the error from the terminal.

## Tips and credits

* Simon Dalzell - Piano in 162 sample content: [tips or donations](https://sites.fastspring.com/ivyaudio/instant/piano-in-162)
* Lukáš Zapletal - Logic Pro instrument and patches: tips (use the Sponsor button above)

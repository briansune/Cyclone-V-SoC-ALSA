# Cyclone-V-SoC-ALSA

## This IIS audio driver is based on:

1) https://github.com/bsteinsbo/DE1-SoC-Sound/blob/master/drivers/opencores_i2s.c

2) https://www.rocketboards.org/foswiki/Projects/SodiaALSAaudioExampleDesign

## Editors & Advisors

Reported by BrianSune

Assistant "GPT‑4o (the July 2024 release) in ChatGPT"

## Feature Fixed / Added

a) Added master/slave mode flag with after modification allowed.

b) Kernel support & tested on " Linux version 6.12.11-g2f0b0270dbab-dirty "

c) No IIC is required simplest IIS hardware i.e CS4344 / MAX98357A

## Cyclone QSys

```
HPS -- Turn ON DMA signals
HPS -> h2f_usr0_clk (100M)
    -> h2f_usr2_clk (80M)
    -> PLL A ref 100M -> 33.868MHz
    -> PLL B ref 80M -> 24.576MHz
```

## Device Tree Example

```
    sound {
        compatible = "simple-audio-card";
        simple-audio-card,name = "OpenCores I2S";
        simple-audio-card,format = "i2s";

        simple-audio-card,cpu {
            sound-dai = <&i2s>;
        };

        simple-audio-card,codec {
            sound-dai = <&max98357a>;
        };
    };

    i2s: i2s@0 {
        #sound-dai-cells = <0>;
        compatible = "opencores,i2s";
        reg = <0xff200000 0x20>, <0xff200020 0x20>;
        clocks = <&clk44>, <&clk48>;
        clock-names = "clk44", "clk48";
        dmas = <&pdma 0>, <&pdma 1>;
        dma-names = "tx", "rx";
        status = "okay";
    };

    max98357a: max98357a {
        compatible = "maxim,max98357a";
        #sound-dai-cells = <0>;
    };
```

## Serial Port Log

```
brian@brian:~$ sudo busybox devmem 0xff200020 32
0x00000000
brian@brian:~$ sudo insmod snd-soc-opencores-i2s.ko master_mode=1
[   84.927684] opencores_i2s at e08ea000
brian@brian:~$ sudo busybox devmem 0xff200020 32
0x00000000
brian@brian:~$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: I2S [OpenCores I2S], device 0: opencores-i2s-HiFi HiFi-0 [opencores-i2s-HiFi HiFi-0]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
brian@brian:~$ sudo busybox devmem 0xff200020 32
0x00050003
ganfinale.wav$ mplayer -af resample=44100,format=s32le -ao alsa:device=hw=0.0 org
MPlayer 1.3.0 (Debian), built with gcc-7 (C) 2000-2016 MPlayer Team
do_connect: could not connect to socket
connect: No such file or directory
Failed to open LIRC support. You will not be able to use your remote control.

Playing organfinale.wav.
libavformat version 57.83.100 (external)
Audio only file format detected.
Load subtitles in ./
==========================================================================
Opening audio decoder: [pcm] Uncompressed PCM audio decoder
AUDIO: 44100 Hz, 2 ch, floatle, 2822.4 kbit/100.00% (ratio: 352800->352800)
Selected audio codec: [pcm] afm: pcm (Uncompressed PCM)
==========================================================================
AO: [alsa] 44100Hz 2ch s32le (4 bytes per sample)
Video: no video
Starting playback...
A:   1.4 (01.4) of 13.0 (13.0)  1.4%


MPlayer interrupted by signal 2 in module: play_audio
A:   1.5 (01.4) of 13.0 (13.0)  1.3%

Exiting... (Quit)
brian@brian:~$
```

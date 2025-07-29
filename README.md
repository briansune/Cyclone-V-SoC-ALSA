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

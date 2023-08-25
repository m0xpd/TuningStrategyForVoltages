# Tuning Strategy for Voltages
This repository describes an approach to tuning the [Music Thing Modular](https://www.musicthing.co.uk/) ['Voltages' Expander](https://www.musicthing.co.uk/Turing-Voltages-Expander/)

The 'tuning strategy' provides a simple means to ensure that the notes in the sequences produced by Voltages all fall on 12 tone equal-tempered 
('12TET') pitches, such that a quantiser is not required. Understanding how Voltages actually operates then points to slider settings which 
produce sequences based on diatonic and symmetric scales, modes, arpeggiated chords and other musically useful structures.

The tuning strategy is described in detail in [documentation here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Documentation).

It is supported by software examples, presented in Python, available for [download here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Code), 
based on the software used to develop the graphics in [the description](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/Voltages%20Draft%201.pdf).

However, the material above is rather dry and boring - YouTube videos demonstrating the technique from 
a practical and musical perspective are [linked here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Videos) and a catalogue of musically useful tunings is 
presented in section 13 of [the description](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/Voltages%20Draft%201.pdf).

The Tuning Strategy motivates some modifications of the Voltages expander module to correct significant 
non-linearity in the operation of Voltages' sliders, which is described here and some additions to the 
Turing Machine itself, to avoid tuning problems caused when Gates and Pulses outputs are loaded, 
which are described here.

The tuning strategy is applicable to other 'Klee-type' sequencers.

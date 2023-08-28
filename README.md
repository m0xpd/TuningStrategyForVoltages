# A Tuning Strategy for VOLTAGES
This repository describes an approach to tuning the [Music Thing Modular](https://www.musicthing.co.uk/) ['VOLTAGES' Expander](https://www.musicthing.co.uk/Turing-Voltages-Expander/)

<p width=100%, align="center">
<img width=30%, src="https://github.com/m0xpd/TuningStrategyForVoltages/assets/3152962/b01b104b-804a-4c30-a09a-38c9ae1179f7">
</p>



The 'tuning strategy' provides a simple rule to ensure that the notes in the sequences produced by VOLTAGES all fall on 12 tone equal-tempered 
('[12TET](https://en.wikipedia.org/wiki/12_equal_temperament)') pitches, such that **a quantiser is not required**. Understanding how VOLTAGES works then points to slider settings which 
produce sequences based on diatonic and symmetric scales, modes, arpeggiated chords and other musically useful structures.

The tuning strategy is described in detail in [documentation here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Documentation).

It is supported by software examples, presented in Python, available for [download here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Code), 
based on the software used to develop the graphics in [the description](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/A%20Tuning%20Strategy%20for%20Voltages.pdf).

However, the material above is rather dry and boring - YouTube videos demonstrating the technique from 
a practical and musical perspective are [linked here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Videos) and a catalogue of musically useful tunings is 
presented in section 13 of [the description](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/A%20Tuning%20Strategy%20for%20Voltages.pdf).

The Tuning Strategy motivates modification of the VOLTAGES expander module to correct significant 
non-linearity in the operation of Voltages' sliders, which is described [here](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/SliderNonLinearity) and an addition to the 
Turing Machine itself, to avoid tuning problems caused when the GATES and PULSES expander outputs are loaded, which is described [here](https://github.com/m0xpd/TuringMachineGatesBuffer/tree/main).

The tuning strategy is applicable to other 'Klee-type' sequencers.

# Acknowlegements

The publication of this work doesn't imply that VOLTAGES *needs* anything as formal as a 'tuning strategy'.

VOLTAGES and the Turing Machine are perfect - the Turing Machine was the first commercial module I purchased and is the only one I couldn't consider being without. VOLTAGES almost 
'tunes itself' and responds to creative play and experimentation. 

The results and ideas in this repository are simply reflections inspired by VOLTAGES. These reflections were made visible by standing on the shoulders of giants, such as Tom Whitwell, 
Scott Stites and others too numerous to mention.

The work is original (*in that I did it myself*), but I doubt it is novel (*in that it is so simple that others must have done some or all of it before*). There isn't much new under the sun.

# Licensing

All the material in this repository, including the tuning strategy, the documentation, the videos, and the code is published under a [Creative Commons BY-SA 4.0](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/LICENSE.txt) License.

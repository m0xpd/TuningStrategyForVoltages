This folder contains [code](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Code/Tuning%20Voltages) to support the Tuning Strategy and - particularly - the examples presented in [this document](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/A%20Tuning%20Strategy%20for%20Voltages.pdf)

The [Python code here](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Code/Tuning%20Voltages) includes functions which identify  pitches in the sequences produced by any setting of the
sliders on a Voltages expander.

Whilst special focus is placed on the integer ('semi-tone') settings which are the basis of the tuning strategy, non-integer 
(microtonal) settings are also fully supported.

The code was developed under the [PyCharm IDE](https://www.jetbrains.com/pycharm/) on a MacBook running macOS Ventura 13.5.

Early (MATLAB) code was developed in [Octave](https://octave.org/) and is archived in [this folder](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Code/MATLAB) for completeness.

The Python code includes:

---

several functions to solve for the set of all possible sequence pitches, and their distribution,  given the slider settings:

**findpitches()** -      an implementation of the 'convolution method' taught in section 11 of [the document](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/A%20Tuning%20Strategy%20for%20Voltages.pdf)

**findpitches2()** -     an implementation in which the convolution operator is simplified
 
**findpitchescomb()** -  a conventional combinatorial solution (see Section 7 and Appendix E of [the document](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Documentation/A%20Tuning%20Strategy%20for%20Voltages.pdf)
 
**findpitchesbruteforce()** -  a '*Brute Force*' approach, which considers all options sequentially

**findnonintegerpitches()** -  an implementation of the convolution method for non-integer (microtonal) tunings

**findcentpitches()** -        an approximate method in which non-integer tunings are quantized to Cents

---

several Plotting functions to display results (developed using the [matplotlib](https://matplotlib.org/) library):

**pitchconstellation()** -  a function to display the pitches in a sequence in the root octave
 
**plotprobability()** -     a function to display the probability distribution of the possible notes in a sequence

**plotdeltas()** -          a function to display the displaced Unit Sample Functions associated with a tuning (see Fig 21)

---

and some utilities:

**bitget(**_value, n_**)** -    a function to return the Boolean state of the n'th bit in the binary number 'value'

**cleansliders()** -      a function to strip redundant zeros from a 'sliders' vector

**cleanoctaveshifts()** - a function to strip redundant octave shifts from a 'sliders' vector

**countpitches()** -      a function to count occurrences of a pitch and build a frequency diagram / histogram

---

The code is scruffy and badly written - it could run faster if it were re-worked by somebody more skiiled in Python 
(e.g. by removing for loops), but this would risk making the code less accessible to an unskilled audience. 

It could also usefully be organised into a library - but I have neither the time nor the inclination to do this. 

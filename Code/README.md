This folder contains [code](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Code/Tuning%20Voltages) to support the Tuning Strategy and - particularly - the examples presented in this document.

The [Python code here](https://github.com/m0xpd/TuningStrategyForVoltages/blob/main/Code/Tuning%20Voltages) includes functions which identify  pitches in the sequences produced by any setting of the
sliders on a Voltages expander.

Whilst special focus is placed on the integer ('semi-tone') settings which are the basis of the tuning strategy, non-integer 
(microtonal) settings are also fully supported.

The code was developed under the [PyCharm IDE](https://www.jetbrains.com/pycharm/) on a MacBook running macOS Ventura 13.5.

Earlier (MATLAB) code was developed in [Octave](https://octave.org/) and is archived in [this folder](https://github.com/m0xpd/TuningStrategyForVoltages/tree/main/Code/MATLAB)) for completeness.

The code includes:

several functions to solve for pitches, given the slider settings:

several Plotting functions to display results (developed using the [matplotlib](https://matplotlib.org/) library):

and some utilities:



The code is scruffy and badly written - it could run faster if it were re-worked by somebody more skiiled in Python 
(e.g. by removing for loops), but this would risk making the code less accessible to an unskilled audience. 

It could also usefully be organised into a library - but I have neither the time or the inclination to do this. 

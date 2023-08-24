####################################
# Tuning Voltages
#
# Code to support the
# 'Tuning Strategy' for the
# MTM 'Voltages' Expander
#
# P Darlington
# August 2023
####################################
#
# Imports of external libraries...
import matplotlib.pyplot as mlt
import matplotlib
import numpy as np
from itertools import zip_longest
import itertools
import math
import timeit
####################################
# Functions
def bitget(value, n):
    # get bit n from the binary integer 'value'
    # (see MATLAB's 'bitget')
    return (value >> n) & 1

def cleansliders(sliders):
    # strip all redundant zeros
    # from sliders tuning
    n = np.count_nonzero(sliders > 0)
    newsliders = np.zeros([n])
    indices = np.nonzero(sliders)
    newsliders = sliders[indices]
    return newsliders

def cleanoctaveshifts(sliders):
    # strip all redundant octave shifts
    # from sliders tuning
    for i in range(0, len(sliders)):
        if((divmod(sliders[i], 12)[1]) == 0):
            sliders[i] = 0
    return sliders

def findpitches(sliders):
    # find pitches from integer sliders tuning
    # using 'convolution' method
    lsliders = len(sliders)
    cpitches = np.array([1])
    addone = np.array([1])
    for k in range(0, lsliders):
        if sliders[k] > 0:
            y = np.zeros(sliders[k])
            delta = np.append(y, addone, axis=0)
        else:
            delta = addone
        cpitchesadd = np.convolve(cpitches, delta)
        cpitches = [sum(n) for n in zip_longest(cpitches, cpitchesadd, fillvalue=0)]
    return cpitches

def findpitches2(sliders):
    # find pitches from integer sliders tuning
    # using 'convolution' method
    lsliders = len(sliders)
    cpitches = np.array([1])
    addone = np.array([1])
    for k in range(0, lsliders):
        if sliders[k] > 0:
            y = np.zeros(sliders[k])
            inc = np.append(y, cpitches, axis=0)
        else:
            inc = cpitches

        cpitches = [sum(n) for n in zip_longest(cpitches, inc, fillvalue=0)]
        #cpitches = np.append(cpitches, inc)
    return cpitches

def findpitchescomb(sliders):
    # find pitches from integer sliders tuning
    # using conventional combinatorial method
    lsliders = len(sliders)
    pitches = np.array([0])
    for k in range(1, lsliders):
        intermed = list(itertools.combinations(sliders, k))
        pitchesadd=np.zeros(len(intermed))
        for j in range(0, len(intermed)):
            pitchesadd[j] = sum(intermed[j])
        pitches = np.append(pitches, pitchesadd)
    return pitches


def findpitchesbruteforce(sliders):
    # find pitches from integer sliders tuning
    # using brute-force consideration of
    # all 2^n gate patterns
    lsliders = len(sliders)
    pitches = np.array([0])
    bits = range(0,lsliders)
    for k in range(1, (2 ** lsliders)):
        pitchadd = np.array([0])
        for bit in range(0, lsliders):
            pitchadd = pitchadd + bitget(k, bit)*sliders[bit]
        pitches = np.append(pitches, pitchadd)
    return pitches

def countpitches(pitches):
    # count occurrences of pitches
    # to produce a 'histogram'
    maxpitch = int(max(pitches))
    cpitch = np.zeros(maxpitch)
    pitch = range(0, maxpitch)
    for k in range(1, maxpitch):
        cpitch[k] = np.sum(pitches == k)
    return cpitch, pitch



def findcentpitches(sliders):
    # find pitches from non-integer slider tuning
    # quantised to Cents,
    # using the 'convolution' method
    sliders = np.round(100 * sliders)
    lsliders = len(sliders)
    cpitches = np.array([1])
    addone = np.array([1])
    for j in range(0, lsliders):
        if sliders[j] > 0:
            y = np.zeros(int(sliders[j]))
            delta = np.append(y, addone, axis=0)
        else:
            delta = addone
        cpitchesadd = np.convolve(cpitches, delta)
        cpitches = [sum(n) for n in zip_longest(cpitches, cpitchesadd, fillvalue=0)]
    return cpitches



def findnonintegerpitches(sliders):
    # find pitches from non-integer slider tuning
    # using the 'convolution' method
    count = np.array([1])
    pitch = np.array([0])
    lsliders = len(sliders)
    for j in range(0, lsliders):
        if sliders[j] == 0:
            count = count + 1
        else:
            countex = count
            pitchex = pitch + sliders[j]
            count = np.append(count, countex, axis=0)
            pitch = np.append(pitch, pitchex, axis=0)
    # Now sort to unique pitch values:
    uniquepitches = np.array(np.unique(pitch))
    newcount = np.zeros(len(uniquepitches))
    for i in range(0, len(uniquepitches)):
        found = np.array(np.where(pitch == uniquepitches[i]))
        newcount[i] = np.sum(count[found])
    pitch = uniquepitches
    count = newcount
    return count, pitch

def pitchconstellation(rootPitch):
    # Produce Pitch Constellation Display
    # using rootPitch data
    ax = mlt.axes()
    t = np.linspace(0, 2 * math.pi, 100)
    circsx = np.cos(t)
    circsy = np.sin(t)
    mlt.plot(circsx, circsy)
    mlt.axis("square")
    mlt.axis("off")
    for k in range(0, 12):
        phi = 2 * math.pi * ((k)) / 12
        csy = math.cos(phi)
        csx = math.sin(phi)
        l = matplotlib.lines.Line2D([0, csx], [0, csy])
        ax.add_line(l)
        l.set_dashes([2, 2])
        l.set_color('gray')
        csy = 1.1 * math.cos(phi)
        csx = 1.1 * math.sin(phi)
        t = str(k)
        mlt.text(csx - .025, csy, t)
    for k in range(0, len(rootPitch)):
        phi = 2 * math.pi * rootPitch[k] / 12
        csy = math.cos(phi)
        csx = math.sin(phi)
        l = matplotlib.lines.Line2D([0, csx], [0, csy])
        ax.add_line(l)
        l.set_linewidth(2)
        l.set_color('red')
    csx =  -1.2
    csy = 1.2
    t1 = "sliders = "
    t = t1 + np.array2string(sliders)
    mlt.text(csx, csy, t)
    mlt.show()
#    mlt.show(block=False)
#    mlt.pause(0.001)
    return





def plotprobability(cpitches, format):
    # Plot Probability Distribution
    # from pitch count data
    pitches = np.arange(len(cpitches))
    max_pitch = max(pitches)
    probpitches = cpitches / sum(cpitches)
    mlt.bar(pitches, probpitches, width = max_pitch / 100)
    if(format=='semitone'):
        mlt.xlim(-0.5, len(cpitches))
        mlt.xlabel("Pitch  /semitones")
    elif(format=='cent'):
        mlt.xlabel("Pitch  /cents")
    mlt.ylim(0, 1.25 * max(probpitches))
    mlt.ylabel("Probability")
    mlt.show()
    return


def plotdeltas(sliders):
    # Plot displaced Unit Sample Functions
    # (See Section 11, Fig 21)
    # from a slider tuning
    maxrange=13
    if max(sliders)>12:
        maxrange=max(sliders)+1
    for k in range(1, 9):
        mlt.subplot(2,4,k)
        x=np.arange(maxrange)
        d=np.zeros(maxrange)
        d[sliders[k-1]]=1
        mlt.bar(x, d, width=0.2)
    mlt.show()
    return


############################################################################
#
# Start of program...


sliders = np.array([2,2,5,0,7,24,0,0])

integer_pitches = 1

if integer_pitches:
    #sliders = cleansliders(sliders)
    start_time = timeit.default_timer()
    cpitches = findpitches(sliders)
    elapsed = timeit.default_timer() - start_time
    print("Convolution method execution time = ", end="")
    print(elapsed)
    # cpitches = plotfindpitches(sliders)
    # plotdeltas(sliders)


    Pitch = np.array(np.nonzero(cpitches))
    rootPitch = np.unique(divmod(Pitch, 12)[1])
    pitchconstellation(rootPitch)
    plotprobability(cpitches, 'semitone')
    print("cpitches =")
    print(cpitches)
    print("Pitch = ", end="")
    print(Pitch)
    print("rootPitch = ", end="")
    print(rootPitch)
    octave_span = int(np.max(Pitch)/12)
    print("Octave Span = ", end="")
    print(octave_span)




non_integer_pitches = 0

if non_integer_pitches:
    start_time = timeit.default_timer()
    [count, Pitch] = findnonintegerpitches(sliders)
    elapsed = timeit.default_timer() - start_time
    print("Non-Integer Convolution method execution time = ", end="")
    print(elapsed)
    print("Pitch =")
    print(Pitch)
    print("count =")
    print(count)
    print(np.sum(count))

cent_pitches = 0

if cent_pitches:
    cpitches = findcentpitches(sliders)
    plotprobability(cpitches, 'cent')

conventional_methods = 0


if conventional_methods:
    #sliders = cleanoctaveshifts(sliders)
    sliders = cleansliders(sliders)
    print(sliders)
    start_time = timeit.default_timer()
    pitches = findpitchescomb(sliders)
    elapsed = timeit.default_timer() - start_time
    print("Combinatorial method execution time = ", end="")
    print(elapsed)

    [cpitches, pitch] = countpitches(pitches)
    #plotprobability(cpitches, 'semitone')
    start_time = timeit.default_timer()
    pitches2 = findpitchesbruteforce(sliders)
    elapsed = timeit.default_timer() - start_time
    print("Brute Force method execution time = ", end="")
    print(elapsed)
    [cpitches2, pitch2] = countpitches(pitches2)
    plotprobability(cpitches2, 'semitone')

mlt.show()

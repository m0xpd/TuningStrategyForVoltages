# Correcting the Non-Linearity of Voltages' Sliders

This folder describes a modification to Voltages to correct non-linear response of the sliders, described in detail 
in Appendix B of this document.

I notified Tom Whitwell (designer of the Turing Machine and the Voltages Expander) of a non-linearity in the response 
of the sliders in-circuit by email (5 August 2023). After replying to me, Tom posted the greater part of that email 
as an [issue](https://github.com/TomWhitwell/Voltages-Expander/issues/4) on the [Voltages Github repository](https://github.com/TomWhitwell/Voltages-Expander), which I reproduce here...

---

<< I am sure you are aware that – despite having linear taper – the sliders in “Voltages” have a very non-linear response 
in circuit, due to the loading effect of the elements of the 10k Resistor network.

I wonder if you were aware of this non-linearity and left it in place during the design (I can see at least one reason 
why it might be seen as desirable) or if it was ‘unintentional’?

My habit is to use Voltages by placing the sliders at or near ‘semitone’ locations (usually having first set SCALE such 
that the whole travel of a single slider gives an octave pitch change / 1V CV change).

This, along with the non-linearity mentioned above, places 13 semitones ‘awkwardly’ along the slider, with most of the 
squeezed up at the right-hand end…

image

So – given my preferred way of using Voltages - the non-linearity is a nuisance.

On paper, it seemed rather easy to rectify this by changing the resistor network for one with 100k value and making a 
similar change to the SCALE potentiometer from 10k to 100k. Of course, swapping out the resistor network in an existing 
Voltages module is not practical so …

image

I have purchased a second Voltages module from Thonk and made the proposed modification yesterday – it works as predicted – 
the semitones now appear exactly as theory predicts (close enough to a linear disposition along the slider travel)… >>

---

You see from the above that I referred to the Tuning Strategy (which had not been 'revealed' at the time).


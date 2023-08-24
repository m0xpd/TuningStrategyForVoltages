% Voltages_Notes.m
%---------------------------------------------------------------------------------------------
%
% Modelling CV Ptch Sequences
% from the Music Thing Modular
% 'Voltages' Turing Machine Expander
%
% 22 July 2023
%---------------------------------------------------------------------------------------------
clear all
% set the position of the sliders on the Voltages expander...
% here we are assuming their value corresponds directly to Pitch in semitones
% (i.e. to integer multiples of 0.08333 V)
%sliders=[n,0,0,0,0,0,0,0];    % Creates a sequence of the root note and n, e.g.:
%sliders=[7,0,0,0,0,0,0,0];    % Creates a sequence of the root note and the fifth
%sliders=[a,b,c,d,e,f,g,0];    % Creates a pitch sequence S1
%sliders=[a,b,c,d,e,f,g,k*12]; % Places a repeat of pitch sequence S1 k octaves higher, increasing span, e.g.:
%sliders=[7,0,0,0,0,0,0,12];   % Creates a sequence of the root note, fifth, octave and twelfth

%sliders=[10,0,7,5,0,2,0,0];   % Creates a diatonic (and symmetric) pitch sequence (DORIAN: I, II, bIII, IV, V, VI, bVII)
%sliders=[2, 7, 3,0,0,0,0,0,0]; % Creates a diatonic (and symmetric) pitch sequence (DORIAN: I, II, bIII, IV, V, VI, bVII)
%sliders=[10,36,7,5,0,2,0,0];  % This does nothing but increases the span by another octave - and was very close to my 'starting point' setting
%sliders=[0, 10,0,7,5,0,2,0];  % Delay/shift of the sliders doesn't change the distribution or sequence members
%sliders=[10,0,7,3,0,0,0,0];   % Creates a diatonic pitch sequence (PHYRIGIAN: I, bII, bIII, IV, V, bVI. bVII), but it is biased toward the bVII
%sliders=[12,10,0,7,3,0,0,0];  % This does nothing but increases the span by another octave
%sliders=[7,0,7,5,0,2,0,0];    % Creates a hexatonic sequence, (close to major scale); I, II, III, IV, V, VI
%sliders=[9,0,7,5,0,2,0,0];    % Creates an octatonic sequence (major scale with added bV): I, II, III, IV, bV, V, VI, VII
%sliders=[6,1,3,0,0,0,0,0,0];  % Creates an octatonic sequence: I, bII, bIII, III, bV, V, VI, bVII
%sliders=[12,0,10,7,0,2,0,0];  % This was my starting-point favourite; creates I, II, IV, V, VI and bVII
% Chromatic Sequences
%sliders=[1,2,2,5,10,0,0,0];   % Creates a chromatic pitch sequence
%sliders=[10,0,7,4,0,1,0,0];   % ... chromatic
%sliders=[10,0,7,3,0,1,0,0];   % ... chromatic

% Examples of Symmetric Scale Sequences...
%sliders=[0,0,6,0,0,0,0,0];   % Creates a Tritone sequence
%sliders=[0,0,4,0,8,0,0,0];   % Creates an augmented chord pitch sequence
%sliders=[0,0,6,0,3,0,0,0];   % Creates a diminished-seventh chord pitch sequence
%sliders=[10,0,6,4,0,0,0,0];  % Creates a WHOLE TONE pitch sequence
%sliders=[2,0,6,4,0,0,0,0];   % Creates a WHOLE TONE pitch sequence (but over a narrower pitch span than [10,0,6,4,0,0,0,0]
%sliders=[10,0,6,4,1,0,0,0];  % Creates a chromatic pitch sequence

% Examples of (incomplete) Arpeggiated Chords
%sliders=[12, 7, 3,0,0,0,0,0,0];  % Creates a min7 (I, bIII, V, bVII) (n.b. this is an inversion of the 4th of the relative major)
%sliders=[12, 7, 4,0,0,0,0,0,0];  % Creates a maj7 (I, III, V, VII)
%sliders=[10, 4, 0,0,0,0,0,0,0];  % Creates a '9th' feel (I, IX(/II), III, bVII)
%sliders=[10, 7, 0,0,0,0,0,0,0];  % Creates a 'sus7' feel (I, IV, V, bVII)

%sliders=[n,m,0,0,0,0,0,0,0]; % Creates a sequence of the root note, n, m, and n+m e.g.:

sliders=[2, 0, 4,0,4,0,0,0]; %

%-------------------------------------------------------------------------------
% First, do this by looking at the permutations of the slider vector...
% see algorithm in:
% https://uk.mathworks.com/matlabcentral/answers/1437029-how-can-i-get-the-sums-of-all-possible-combinations-of-the-values-of-a-vector
%
% find the significant elements of sliders:
sliders

% create permutations and summation results:
n = numel(sliders);
vIdx = 1:n;
results = cell(n,2);
for i = 1:n
    results{i,1} = num2cell(nchoosek(vIdx,i),2)';
    results{i,2} = sum(nchoosek(sliders,i),2)';
end
% Results
% b: 1xm row vector of summation results
% c: 1xm cell array of indicies of v for each summation
b = [0, results{:,2}];
c = horzcat(results{:,1});
highestsum=max(b);
x3=1:highestsum+1;
for k=0:highestsum
  idx3(k+1)=length(find(b==k));
end
figure(4)
bar(x3-1,idx3/length(b))
unique_sums=unique(b)
unique_tones=unique(mod(unique_sums,12))

%-------------------------------------------------------------------------------
% Second, do this by considering all possible Pulse vectors,
% by counting from 0 to 255
% and recording the summed voltages
% and their probabilities
note=zeros(1,256);
for pulses=0:255
  note(pulses+1)=0;
  for bit=1:8
    note(pulses+1)=note(pulses+1)+bitget(pulses+1,bit)*sliders(9-bit);
  end
end
highestnote=sum(sliders);
[nn,xx]=hist(note,highestnote);
octavesup=floor(highestnote/12);
allnotes=unique(note);
allpitches=unique(mod(unique(note),12));
pitches=mod(note,12);
highestpitch=max(pitches);

x=1:highestnote+1;
for k=0:highestnote
  idx(k+1)=length(find(note==k));
end
x2=1:highestpitch+1;
for k=0:highestpitch
  idx2(k+1)=length(find(pitches==k));
end

figure(1)
bar(x-1,idx/256)
xlabel('pitch')
ylabel('Probability')
figure(2)
bar(x2-1,idx2/256)

figure(3)

r=1;
t = linspace(0,2*pi,100)';
circsx = r.*cos(t);
circsy = r.*sin(t);
plot(circsx,circsy);
axis("square")
axis("noLabel")
axis("off")
hold on

for k=0:11
  phi=2*pi*((k))/12;
  csy = r.*cos(phi);
  csx = r.*sin(phi);
  line([0 csx],[0 csy],"linestyle",":","color","k");
  csy = 1.1*r.*cos(phi);
  csx = 1.1*r.*sin(phi);
  text(csx-.025,csy,num2str(k),"fontsize",12);
end

for k=1:length(allpitches)
  phi=2*pi*(allpitches(k))/12;
  csy = r.*cos(phi);
  csx = r.*sin(phi);
  line([0 csx],[0 csy],"linestyle","-","color","r","linewidth",1);

end



hold off
if (sliders(1)==0)
cpitches=[0];
else
cpitches=[0, sliders(1)];
end
for j=2:length(sliders)
  addpitches=cpitches+sliders(j);
  % find if addpitches are present in cpitches
  % if so, don't add them as duplicates to the list
  % but add to the count
  cpitches=horzcat(cpitches,addpitches);
end



(

SynthDef(\rhodes, {|out, sustain=1, pan, accelerate, freq |
  var sig, in, n = 6, max = 0.04, min = 0.01, delay, pitch, detune, hammer, amp, env;
  amp = 0.9;
	freq = freq.cpsmidi;
	hammer = Decay2.ar(Impulse.ar(0.001), 0.008, 0.04, LFNoise2.ar([2000,4000].asSpec.map(amp), 0.25));
	sig = Mix.ar(Array.fill(3, { arg i;
			detune = #[-0.04, 0, 0.03].at(i);
			delay = (1/(freq + detune).midicps);
			CombL.ar(hammer, delay, delay, 50 * amp)
		}) );

	sig = HPF.ar(sig,50);
    env = EnvGen.ar(Env.perc(0.0001,sustain, amp * 4, -1), doneAction:2);
    OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan, env));
}).add;

)

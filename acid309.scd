(
	SynthDef(\acid309, {|out, sustain=1, pan, accelerate, freq |
	 	var env1, env2, son, pitch, amp, gate;
	    gate=1;
	    amp = 0.5;
		pitch = freq.cpsmidi;
		pitch = Lag.kr(pitch, 0.12 * (1-Trig.kr(gate, 0.001)) * gate);
		env1 = EnvGen.ar(Env.new([0, 1.0, 0, 0], [0.001, 2.0, 0.04], [0, -4, -4], 2), gate, amp, doneAction:2);
		env2 = EnvGen.ar(Env.adsr(0.001, 0.8, 0, 0.8, 70, -4), gate);
		son = LFPulse.ar(pitch.midicps, 0.0, 0.51, 2, -1);

		son = RLPF.ar(son, (pitch + env2).midicps, 0.3);

	    OffsetOut.ar(out, DirtPan.ar(son, ~dirt.numChannels, pan, env1));
	}).add;

)

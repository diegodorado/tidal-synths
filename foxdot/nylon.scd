(

SynthDef(\nylon, {|out, sustain=1, vib=0, accelerate=0, fmod=0, amp=1, freq=0, pan=0|
    var sig, env;

    freq = [freq, freq+fmod];

    sig=(LFPulse.ar(freq, 0.5, (0.33 * accelerate), 0.25) + LFPar.ar((freq + 0.5), 1, 0.1, 0.25));

    env=EnvGen.ar(Env.perc(level: amp,curve: -4,attackTime: 0.000125,releaseTime: (sustain * 3)), doneAction: 0);

    sig = Mix(sig) * 0.5;

    OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan, env));

}).add;

)

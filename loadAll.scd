(
  "Loading synths.".underlined.postln;
  PathName.new(thisProcess.nowExecutingPath.dirname).filesDo{|f|
    (f.extension=="scd").and(f.asAbsolutePath!=thisProcess.nowExecutingPath).if({f.asAbsolutePath.load()},{});

};
)

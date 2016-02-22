60 => int Tempo;

BPM tempo;
tempo.measure(Tempo);

[tempo.whl, tempo.hlf, tempo.qtr, tempo.eth, tempo.sth] @=> dur div[];
[1.0,0.8,0.9,0.5] @=> float pitch[];


//windows 95 sample
me.dir() + "o95.wav" => string win95;

Pan2 master => dac;
SndBuf buf => ADSR env => LPF lpf => JCRev rev => master;
SinOsc s => rev => master;

win95 => buf.read;
0 => buf.pos;
1 => buf.loop;
env.set(tempo.sth, 50::ms, 0.8, tempo.eth);
0.08 => rev.mix;

lpf.set(1200,0.4);

168 => s.freq;
0. => s.gain;

// time loop
while( true )
{
    9000 => buf.pos;
    Math.random2f(.2,.6) => buf.gain;
    pitch[Math.random2(0,pitch.size()-1)] => buf.rate;
    env.keyOn(1);
    div[Math.random2(4, div.size()-1)]=> now;
    env.keyOn(0);
    div[0]=> now;
}
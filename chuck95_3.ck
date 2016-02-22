60 => int Tempo;

BPM tempo;
tempo.measure(Tempo);

[tempo.whl, tempo.hlf, tempo.qtr, tempo.eth, tempo.sth] @=> dur div[];
[1.0,0.8,0.9,0.5] @=> float pitch[];


//windows 95 sample
me.dir() + "o95.wav" => string win95;

Pan2 master => dac;
SndBuf buf => ADSR env => LPF lpf => Pan2 p => master;

win95 => buf.read;
0 => buf.pos;
1 => buf.loop;
env.set(tempo.eth, 50::ms, 0.8, tempo.eth);

lpf.set(1500,0.4);

// time loop
while( true )
{
    90000 => buf.pos;
    Math.random2f(.2,.6) => buf.gain;
    Math.random2f(-1.0,1.0) => p.pan;
    1 => buf.rate;
    env.keyOn(1);
    div[Math.random2(4, div.size()-1)]=> now;
    env.keyOn(0);
    div[0]=> now;
}
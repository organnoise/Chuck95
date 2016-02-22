60 => int Tempo;

BPM tempo;
tempo.measure(Tempo);

[tempo.whl, tempo.hlf, tempo.qtr, tempo.eth, tempo.sth] @=> dur div[];


//windows 95 sample
me.dir() + "o95.wav" => string win95;

Pan2 master => dac;
SndBuf buf => ADSR env => LPF lpf => JCRev rev => master;

win95 => buf.read;
0 => buf.pos;
1 => buf.loop;

lpf.set(2200,0.2);

env.set(tempo.eth, 50::ms, 0.8, tempo.eth);
0.2 => rev.mix;


// time loop
while( true )
{
    67000 => buf.pos;
    Math.random2f(.4,.8) => buf.gain;
    0.5 => buf.rate;
    env.keyOn(1);
    div[0]=> now;
    env.keyOn(0);
    tempo.sth => now;
   
}
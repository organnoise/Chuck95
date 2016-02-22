//Init tempo
BPM tempo;
tempo.measure(60);

1=>dac.gain;

//Save space
tempo.whl => dur whl;
tempo.hlf => dur hlf;
tempo.qtr => dur qtr;
tempo.dot => float dot;

4 * whl => dur measure;

int _1;
int _2;
int _3;
int _4;
int fade;

Machine.add(me.dir() + "chuck95_2.ck") => _2;

measure => now;

Machine.add(me.dir() + "chuck95.ck") => _1;
Machine.add(me.dir() + "chuck95_3.ck") => _3;

measure => now;

Machine.add(me.dir() + "chuck95_4.ck") => _4;

measure * 4 => now;

Machine.add(me.dir() + "fade.ck") => fade;
measure * 2 => now;



Machine.remove(_1);
Machine.remove(_2);
Machine.remove(_3);
Machine.remove(_4);

1::second => now;
while(dac.gain() > 0.00005){
    fadeOut(100);
    }

fun void fadeOut(int speed){
    while(true){
        
        if(dac.gain() > 0.00005){
            dac.gain()  * 0.98 => dac.gain;
        }
        else break;
        speed::ms => now;
        
    }
}
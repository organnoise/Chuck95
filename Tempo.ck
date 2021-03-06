//SET THE BPM
public class BPM {
    
    45 => static int Tempo;
    
    static dur whl, hlf, qtr, eth, sth, tsnd, sfth;
    //Dotted and triplet
    1.5 =>  static float dot; 
    1.0/3.0 => static float trip; 
    
    fun void measure(float bpm){
        
        //Note division math
        60000/bpm => float SPB;
        SPB::ms => qtr;
        
        qtr*2 =>  hlf;
        hlf*2 =>  whl;
        
        qtr*0.5 =>  eth;
        eth*0.5 =>  sth;
        sth*0.5 =>  tsnd;
        tsnd*0.5 =>  sfth;
        
        
    }
    
}
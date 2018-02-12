

void setup(){
  size(700, 700);
  Va = Va*5/18;
  Vb = Vb*5/18;
  /*
  for (int i=0;i<light_location.length;i++){
    light_location[i]/=5;
    light_location[i]+=50;
  }
  */
  noStroke();
}

void draw(){
  setintersection('O');
  setT(180);     //period (s)
  setV(45, 45);  //(car_a, car_b) km/hr
  setGRM('M', 2.46);  setGRM('N', 1.36);  setGRM('O', 2.83);
  setGRM('P', 1.50);  setGRM('Q', 1.42);  setGRM('R', 1.86);
  setSP('M', 10);  setSP('N', 10);  setSP('O', 10);
  setSP('P', 10);  setSP('Q', 10);  setSP('R', 10);
  
  background(255);
  translate(0, height);
  scale(1, -0.3);
  float selgreentime = T*GRP[sel]/(GRP[sel]+1);
  for (int i= (int)(-(5000-light_location[sel])/(Va*T));i<width/T+light_location[sel]/(Va*T);i++){
    fill(50, 250, 50, 125);
    float xL = SP[sel]+T*i-(light_location[sel])/Va;
    float xH = SP[sel]+T*i+(5000 - light_location[sel])/Va;
    quad(xL, 0, xH, 5000, xH+selgreentime, 5000, xL+selgreentime, 0);
  }
  for (int i= (int)(-(light_location[sel])/(Vb*T));i<width/T+(5000 - light_location[sel])/(Vb*T);i++){
    fill(50, 250, 50, 125);
    float xL = SP[sel]+T*i+(light_location[sel])/Vb;
    float xH = SP[sel]+T*i-(5000 - light_location[sel])/Vb;
    quad(xL, 0, xH, 5000, xH+selgreentime, 5000, xL+selgreentime, 0);
  }
  for (int i=0;i<light_location.length;i++){
    fill(250, 50, 50);
    rectMode(CENTER);
    rect(width/2, light_location[i], width, 40);
  }
  
  for (int i=0;i<light_location.length;i++){
    for (int j=-1;j<width/T+2;j++){
      float greentime = T*GRP[i]/(GRP[i]+1);
      fill(50, 250, 50);
      rectMode(CENTER);
      rect(SP[i]+T*j+greentime/2, light_location[i], greentime, 40);
    }
  }
}

int T = 180;
float Va = 45.00;  //km/hr
float Vb = 45.00;  //km/hr

float GRP_M = 2.4615;  float GRP_N = 1.3636;  float GRP_O = 2.8298;
float GRP_P = 1.5000;  float GRP_Q = 1.4167;  float GRP_R = 1.8571;

float SP_M = 10.0;  float SP_N = 10.0;  float SP_O = 10.0;
float SP_P = 10.0;  float SP_Q = 10.0;  float SP_R = 10.0;

int sel = 0;

float[] light_location = {15, 507, 621.5, 1011.5, 1361, 1753};
//float[] GRP = {GRP_M, GRP_N, GRP_O, GRP_P, GRP_Q, GRP_R};
//float[] SP = {SP_M, SP_N, SP_O, SP_P, SP_Q, SP_R};
float[] GRP = {0, 0, 0, 0, 0, 0};
float[] SP = {0, 0, 0, 0, 0, 0};

void setGRM(char s, float n){
  int t = (int)s-77;
  GRP[t] = n;
}

void setSP(char s, float n){
  int t = (int)s-77;
  t = t%T;
  SP[t] = n;
}

void setT(int n){
  T = n;
}

void setV(float a, float b){
  a = abs(a);
  b = abs(b);
  Va = a*5/18;
  Vb = b*5/18;
}

void setintersection(char s){
  sel = (int)s-77;
}
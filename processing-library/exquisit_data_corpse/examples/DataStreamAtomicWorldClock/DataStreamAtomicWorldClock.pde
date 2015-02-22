import ciid2015.exquisitdatacorpse.*;
import oscP5.*;
import netP5.*;

NetworkClient mClient;
void setup() {
    size(15, 15);
    frameRate(1);
    mClient = new NetworkClient(this, "edc.local", "time");
}
void draw() {
    mClient.send("local", hour(), minute(), second());
}

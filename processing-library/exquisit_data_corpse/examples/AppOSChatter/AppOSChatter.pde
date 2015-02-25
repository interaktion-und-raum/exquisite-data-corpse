import ciid2015.exquisitdatacorpse.*;
import oscP5.*;
import netP5.*;
import controlP5.*;

controlP5.ControlP5 cp5;
NetworkClient mClient;
boolean onTop = true;
void setup() {
    size(displayWidth / 2 - 10, 50);
    frameRate(15);
    mClient = new NetworkClient(this, "edc.local", "OSChat");
    cp5 = new controlP5.ControlP5(this);
    cp5.addTextfield("msg")
            .setPosition(10, 10)
            .setAutoClear(false)
            .setSize(displayWidth / 2 - 55, 20);
    // create a toggle
    cp5.addToggle("onTop")
            .setPosition(displayWidth / 2 - 35, 10)
            .setSize(20, 20);
}
void draw() {
    background(0);
    // position chat windows
    frame.setLocation(0, displayHeight - 50);
    frame.setSize(displayWidth / 2 - 5, 50);
    frame.setAlwaysOnTop(onTop);
}
void clear() {
    cp5.get(controlP5.Textfield.class, "msg").clear();
}
void controlEvent(controlP5.ControlEvent theEvent) {
    if (theEvent.isAssignableFrom(controlP5.Textfield.class)) {
        if (theEvent.getName().equals("msg")) {
            sendMsg(theEvent.getStringValue());
        }
        clear();
    }
}
void sendMsg(String theMsg) {
    mClient.send("msg", theMsg);
}
void init() {
    /* this removes window borders of applications */
    frame.removeNotify();
    frame.setUndecorated(true);
    frame.setResizable(true);
    super.init();
}

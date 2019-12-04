/******************************************************
 * DPS-800GB Bench PSU controller Firmware
 * 
 * Designed by: Thomas Flummer <tf@hackmeister.dk>
 * 
 * License: CC-BY-SA
 * 
 ******************************************************/

#include <U8glib.h>

U8GLIB_SSD1306_128X64 u8g(U8G_I2C_OPT_NO_ACK);  

const int buttonPin = 9;
const int powerPin = 8;

const int sense3v3Pin = 0;
const int sense5v0Pin = 1;
const int sense12vPin = 2;

int sense3v3Value = 0;
int sense5v0Value = 0;
int sense12vValue = 0;

int powerState = 0;
int buttonState = 0;

void draw() {
  //
  int usage3v3 = (512 - sense3v3Value) * 80;
  if(usage3v3 < 0)
  {
    usage3v3 = 0;
  }

  int usage5v0 = (510 - sense5v0Value) * 28;
  if(usage5v0 < 0)
  {
    usage5v0 = 0;
  }

  int usage12v = (509 - sense12vValue) * 76;
  if(usage12v < 0)
  {
    usage12v = 0;
  }

  char buf [6];

  u8g.setFont(u8g_font_unifont);
  u8g.drawStr( 0, 15, "Voltage  Current");
  u8g.drawStr( 0, 31, "3.3 V         mA");
  sprintf (buf, "%4i", usage3v3);
  u8g.drawStr( 72, 31, buf);
  u8g.drawStr( 0, 47, "5.0 V         mA");
  sprintf (buf, "%4i", usage5v0);
  u8g.drawStr( 72, 47, buf);
  u8g.drawStr( 0, 63, "12 V          mA");

  if(powerState == 0)
  {
    u8g.drawStr( 40, 63, "[off]  -");  
  }
  else
  {
    sprintf (buf, "%5i", usage12v);
    u8g.drawStr( 64, 63, buf);
  }
  //u8g.drawBox(0,0,128,64);

/*
  u8g.setFont(u8g_font_osb26);
  u8g.drawStr(0, 30, "2.45 A");
*/
}

void setup()
{
  // Button setup as input with pull up
  pinMode(buttonPin, INPUT_PULLUP);

  // power pin setup as output
  pinMode(powerPin, OUTPUT);
  digitalWrite(powerPin, LOW);
}

void loop()
{
  // toggle PSU power if button is pressed
  buttonState = digitalRead(buttonPin);
  if(buttonState == LOW && powerState == 0)
  {
    powerState = 1;
  }
  else if(buttonState == LOW && powerState == 1)
  {
    powerState = 0;
  }

  if(powerState == 1)
  {
    digitalWrite(powerPin, HIGH);    
  }
  else
  {
    digitalWrite(powerPin, LOW);
  }

  // read power usage for all 3 outputs
  sense3v3Value = analogRead(sense3v3Pin);
  sense5v0Value = analogRead(sense5v0Pin);
  sense12vValue = analogRead(sense12vPin);

  u8g.firstPage();  
  do {
    draw();
  }
  while( u8g.nextPage() );

  delay(250);
}

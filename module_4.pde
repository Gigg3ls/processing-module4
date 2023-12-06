int lampOneX= 55;
int lampTwoX= 155;
int lampThreeX= 255;
int blinkDelay = 150;

int lampY = 50;
int lampSize = 90;
int lampRectSize = 50;
int lampRectY = 120;

int buttonX = 25;
int buttonY = 250;
int buttonSizeW = 80;
int buttonSizeH = 40;
int buttonSpacing = 10;
int buttonsInRow = 4;

final color BLACK = #000000;
final color LIGHT_RED = #f7072C;
final color DARK_RED = #760707;
final color GRAY = #A7A7A7;

boolean isOff = true;

Button[] buttons;
LampButtonState lampButtonState = LampButtonState.OFF;

void setup () {
  size(400, 400);
  ellipseMode(CORNER);
  buttons = new Button[5];
  for (int i = 0; i < buttons.length; i++) {
      buttons[i] = new Button(
      (i < buttonsInRow) ? buttonX + i * (buttonSizeW + buttonSpacing) : buttonX, 
      (i < buttonsInRow) ? buttonY : buttonY + buttonSizeH + buttonSpacing, 
      buttonSizeW, buttonSizeH, getButtonLabel(i)
      );
    }
 }

void draw() {
  background(BLACK);
  for (Button button : buttons) {
    button.display();
  }
   lampButtonSwitch();
}
color randomColor() {
  return color(random(255), random(255), random(255));
}
color blinkColor(color color1, color color2) {
  if (isOff) {
    return color1;
  } else {
    return color2;
  }
}

void drawLamp(int lampX, int lampColor) {
  fill(GRAY);
  rect(lampX + 20, lampRectY, lampRectSize, lampRectSize);
  fill(lampColor);
  ellipse(lampX, lampY, lampSize, lampSize);
}

void drawThreeLamps(int leftLampColor, int middleLampColor, int rightLampColor) {
  drawLamp(lampOneX, leftLampColor);
  drawLamp(lampTwoX, middleLampColor);
  drawLamp(lampThreeX, rightLampColor);
}

void mousePressed() {
   for (Button button : buttons) {
    if (button.isMouseOver()) {
      handleButtonPress(button);
    }
  }
}

void lampButtonSwitch(){
  switch (lampButtonState) {
    case ALL_LAMPS:
      drawThreeLamps(blinkColor(LIGHT_RED, DARK_RED),blinkColor(LIGHT_RED, DARK_RED),blinkColor(LIGHT_RED, DARK_RED));
      break;
    case LEFT_LAMP:
      drawThreeLamps(blinkColor(LIGHT_RED, DARK_RED), DARK_RED, DARK_RED);
      break;
    case MIDDLE_LAMP:
      drawThreeLamps(DARK_RED, blinkColor(LIGHT_RED, DARK_RED), DARK_RED);
      break;
    case RIGHT_LAMP:
      drawThreeLamps(DARK_RED, DARK_RED, blinkColor(LIGHT_RED, DARK_RED));
      break;
    case CHRISTMAS_MODE:
      drawThreeLamps(randomColor(), randomColor(), randomColor());
      break;
    default:
      drawThreeLamps(DARK_RED, DARK_RED, DARK_RED);
      break;
  }
  isOff = !isOff;
  delay(blinkDelay);
  
}

void handleButtonPress(Button button) {
  lampButtonState = LampButtonState.OFF;
  if (button.getLabel().equals("Left Lamp")) {
    lampButtonState = LampButtonState.LEFT_LAMP;
  } else if (button.getLabel().equals("Middle Lamp")) {
    lampButtonState = LampButtonState.MIDDLE_LAMP;
  } else if (button.getLabel().equals("Right Lamp")) {
    lampButtonState = LampButtonState.RIGHT_LAMP;
  } else if (button.getLabel().equals("All Lamps")) {
    lampButtonState = LampButtonState.ALL_LAMPS;
  } else if (button.getLabel().equals("Christmas Mode")) {
    lampButtonState = LampButtonState.CHRISTMAS_MODE;
  }
}

String getButtonLabel(int index) {
  switch (index) {
    case 0:
    return "All Lamps";
    case 1:
      return "Left Lamp";
    case 2:
      return "Middle Lamp";
    case 3:
      return "Right Lamp";
    case 4:
      return "Christmas Mode";
    default:
      return "Unknown";
  }
}

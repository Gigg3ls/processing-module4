class Button {
   float x, y, w, h;
   String label;
   boolean isBlinking = false;
   
   final color BLUE = #1603FF;
    
   Button(float x, float y, float w, float h, String label) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.label = label;
   }
   
void display() {
    stroke(BLACK);
    fill(BLUE);
    rect(x, y, w, h);
    fill(BLACK);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2);
  }

  boolean isMouseOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }

  String getLabel() {
    return label;
  } 
}

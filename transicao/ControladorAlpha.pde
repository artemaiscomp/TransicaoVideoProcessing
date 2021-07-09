class ControladorAlpha implements ControladorBlending{
  float sizeControl;
  
  ControladorAlpha(){
    this.sizeControl = width / 255;
  }
  
  void init(){}

  void update(){
    tint(255, 255);
    image(original, 0, 0, width, height);
    tint(255, mouseX / this.sizeControl);
    image(aplicacao, 0, 0, width, height);
  }

  void reset(){
    tint(255, 255);
  }
}

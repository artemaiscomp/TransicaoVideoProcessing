class ControladorEixo implements ControladorBlending{
  int numPixels, prevMousePos;
  boolean vertical;
  
  ControladorEixo(boolean vertical){
    this.vertical = vertical;
    
    this.numPixels = width * height; 
    this.prevMousePos = 0;
  }
  
  void init(){}

  void update(){
    PImage imagem = original.copy();
    
    int imagemPixels[] = imagem.pixels;
    int aplicacaoPixels[] = aplicacao.pixels;
    
    int iniX = mouseX, endX = width;
    int iniY = 0, endY = height;
    
    if (this.vertical){
      iniX = 0;
      endX = width;
      iniY = mouseY;
      endY = height;
      
    }
    
    for(int posX = iniX;posX < endX;posX++)
        for(int posY = iniY;posY < endY;posY++){
          int i = posY * width + posX;
          imagemPixels[i] = aplicacaoPixels[i];
        }

    image(imagem, 0, 0);
  }
  
  void reset(){
  }
  
  String explique(){
    if (this.vertical)
      return "Movimente o mouse verticalmente.";
    return "Movimente o mouse horizontalmente.";
  }
}

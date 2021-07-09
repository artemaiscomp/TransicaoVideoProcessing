class ControladorLupa implements ControladorBlending{
  int raio, maxRaio;
  
  ControladorLupa(int maxRaio){
    this.raio = 0;
    this.maxRaio = maxRaio;
  }
  
  void init(){}

  void update(){
    PImage imagem = original.copy();
    if (!mousePressed){
      image(imagem, 0, 0);
      
      this.raio = 0;
      return;
    }
    
    if (this.raio < this.maxRaio)
      this.raio += 1;
    
    int imagemPixels[] = imagem.pixels;
    int aplicacaoPixels[] = aplicacao.pixels;
    
    int intMouseX = mouseX, intMouseY = mouseY;
    int iniX = max(intMouseX - raio, 0), endX = min(width, intMouseX + raio);
    int iniY = max(intMouseY - raio, 0), endY = min(height, intMouseY + raio);
    
    for(int posX = iniX;posX < endX;posX++)
        for(int posY = iniY;posY < endY;posY++){
          int distX = max(posX - intMouseX, intMouseX - posX);
          int distY = max(posY - intMouseY, intMouseY - posY);
          if (distX * distX + distY * distY <= this.raio * this.raio){
            int i = posY * width + posX;
            imagemPixels[i] = aplicacaoPixels[i];
          }
        }

    image(imagem, 0, 0);
  }
  
  void reset(){
  }
  
  String explique(){
    return "Pressione a o botão esquerdo do mouse.";
  }
}

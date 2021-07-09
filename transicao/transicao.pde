import processing.video.*;

Movie original, aplicacao;

ControladorBlending controladores[], controladorAtual;
int indiceControlador, indiceFrame;

void setup() {
  size(470, 360);

  original = new Movie(this, "../videos/original.mp4");
  aplicacao = new Movie (this, "../videos/aplicacao.mp4");
  
  original.loop();
  aplicacao.loop();
  
  controladores = new ControladorBlending[]{new ControladorAlpha(),
     new ControladorEixo(true), new ControladorEixo(false)};
  
  indiceControlador = 0;
  controladorAtual = controladores[0];
}

void draw() {
  String name = nf(indiceFrame++, 5) + ".jpg";
  controladorAtual.update();
  
  PImage frameAtual = get();
  frameAtual.save(name);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

void keyPressed(){
  if (key == ' ')
    proximoControlador();
}

void proximoControlador(){
  controladorAtual.reset();
  
  indiceControlador = (indiceControlador + 1) % controladores.length;
  controladorAtual = controladores[indiceControlador];
}

interface ControladorBlending{
  /* Inicialização de elementos que deve ser refeitos toda vez que o controlador é novamente selecionado */
  void init();
  
  /* Implemente aqui as ações definidas pelo controlador */
  void update();
  
  /* Resete qualquer estado modificado para o padrão. Exemplo: se você muda o canal alpha, deixe 100% opaco novamente */
  void reset();
}

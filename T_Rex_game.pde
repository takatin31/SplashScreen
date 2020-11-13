T_Rex tRex;
Surface sol;
int cpt2;
boolean start;
boolean jump;
boolean end;
AI AI;
int cpt;
int cptLearn = 0;
ArrayList<Circle> circles;
PImage img;
PFont font;
boolean finished = false;
PFont f;

void setup() {
    fullScreen();
    img = loadImage("devfest20.png");
    img.loadPixels();
  
    circles = new ArrayList<Circle>();
    init();
    AI = new AI();
}

void everythingDraw() {
    background(0);
    sol.draw(tRex);
    tRex.draw();
}


void init() {
    cpt = 0;
    start = true;
    jump = false;
    end = false;
    tRex = new T_Rex(100, height-83);
    sol = new Surface(0, height-50);
    cpt2 = 0;
    cptLearn = 0;
    everythingDraw();
    f = createFont("Arial",16,true);
}

void draw() {

    if (sol.trees.size() > 0) {
        double m1 = sol.trees.get(0).x - tRex.x;
        boolean result = AI.getEvaluation(m1);
        boolean correctAnswer = tRex.verif2(sol);
        if (!jump && result) {
            jump = true;
            tRex.jump();
        }

        
        if (end) {
            init();
        }
    }
    if (start) {

        cpt2++;
        if (cpt2 == 300) {
            cpt2 = 0;

        }

        if (sol.collision)
            end = true;
        sol.move();
        cpt++;
        if (cpt == 7 || jump) {
            jump = tRex.move();
            cpt = 0;
        }
        everythingDraw();
    } else if (end) {
        PImage endImg = loadImage("gameover.png");
        PImage restart = loadImage("restart.png");
        image(endImg, 504, 180, endImg.width, endImg.height);
        image(restart, 583, 195, restart.width, restart.height);
    }
    
    if (!finished){
      
      int total = 10;
      int count = 0;
      int attemps = 0;
      
      while (count < total)
      {
        Circle newC = newCircle();
        if (newC != null)
        {
          circles.add(newC);
          count ++;
        }
        attemps ++;
        
        if (attemps > 20)
        {
          println("FINISHED");
          finished = true;
          break;
        }
      }
      
    }else{
      drawText();
    }
    
    for (Circle c : circles)
      {
        if (c.growing)
        {
          if (c.edges())
          {
            c.growing = false;
          }
          else
          {
            for (Circle other : circles)
            {
              if (c != other)
              {
                float d = dist(c.x ,c.y ,other.x ,other.y);
                if (d - 2 < c.r + other.r)
                {
                  c.growing = false;
                  break;
                }
              }
    
            }
          }
        }
    
        c.show();
        c.grow();
      }
    
    
}

void drawText(){
  PImage devfest = loadImage("devfest.png");
  image(devfest, (width-devfest.width)/2, height/2, devfest.width ,devfest.height );
}
  
Circle newCircle()
{
  int imgWidth = 498;
  int diff = width - imgWidth;
  float x = random(imgWidth);
  float y = random(243);
  


  boolean valid = true;

  for (Circle c : circles)
  {
    float d = dist(x ,y ,c.x ,c.y);
    if (d < c.r + 2)
    {
      valid = false;
      break;
    }
  }

  if (valid)
  {
    int index = int(x) + int(y) * img.width;
    color c = img.pixels[index];
    return (new Circle(x+(diff/2) ,y+30 ,c));
  }
  else
  {
    return null;
  }
  
}

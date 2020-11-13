class Circle
{
  float x;
  float y;
  float r;
  color c;

  boolean growing = true;

  Circle(float x ,float y ,color c)
  {
    this.x = x ;
    this.y = y ; 
    this.c = c ;
    r = 1 ;
  }

  void show()
  {
    fill(c);
    noStroke();
    ellipse(x ,y ,r*2 ,r*2 );
  }

  boolean edges()
  {
    return (x + r > width || x - r < 0 || y + r > height || y - r < 0);
  }

  void grow()
  {
    if (growing)
      r += 0.1;
  }
}

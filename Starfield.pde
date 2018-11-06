NormalParticle [] particle;
OddballParticle oddball;
JumboParticle jumbo;
void setup()
{
  size(500,500);
  particle = new NormalParticle[100];
  oddball = new OddballParticle();
  jumbo = new JumboParticle();
  for (int i = 0; i < particle.length; i++)
  {
    particle[i] = new NormalParticle();
  }
  frameRate(35);

}
void draw()
{
  background(0);
  for(int i = 0; i < particle.length; i++)
  {
    particle[i].move();
    particle[i].show();
  }
  oddball.move();
  oddball.show();
  jumbo.move();
  jumbo.show();
}

class NormalParticle implements Particle
{
  double myX, myY, speed, angle; 
  NormalParticle()
  {
    myX = myY = 250;
    angle = (double)(Math.random()*60*Math.PI);
    speed = (double)(Math.random()*20);
  }  
  
  public void move()
  {
    myX += (Math.cos(angle) * speed); 
    myY += (Math.sin(angle) * speed);
    
  }
  
  public void show()
  {
      fill(255);
      rect((int)myX,(int)myY,9,150);
      fill(240,150,150);
      ellipse((int)myX,(int)myY,50,50);
      fill(240,150,150);
      noStroke();
      ellipse((int)myX,(int)myY,25,35);

  }
}

interface Particle 
{
  public void show();
  public void move();
  
}


class OddballParticle implements Particle
{
  int myX, myY;
  OddballParticle()
  {
    myX = myY = 250;
  }
  public void move() 
  {
     myY += (int)(Math.random()*20);
     myX += (int)(Math.random()*20)-25;
     
  }
  public void show()
  {
    fill(160,20,158);
    rect(myX,myY,80,80);
  }
}


class JumboParticle extends NormalParticle
{
  public void show()
  {
     fill(150);
     ellipse((int)myX, (int)myY, 150,150);
  }
}

void mousePressed(){
  setup();
}

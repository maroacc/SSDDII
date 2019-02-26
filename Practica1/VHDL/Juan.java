public class Juan
{
	public static void main(String args[])
	{


  Cuadrado cuadrado1 = new Cuadrado(); //Creamos un nuevo objeto a través del constructor por defecto
  Dibujo dibujo1 = new Dibujo();
  Util util1 = new Util();

  cuadrado1.setLado(4);
  cuadrado1.setX(4);
  cuadrado1.setY(4);
  dibujo1.pintar(cuadrado1);

  util1.wait(1);
  cuadrado1.setX(3);
  dibujo1.pintar(cuadrado1);

  util1.wait(1);
  cuadrado1.setY(7);
  dibujo1.pintar(cuadrado1);

  util1.wait(1);
  cuadrado1.setLado(45);
  dibujo1.pintar(cuadrado1);



	}
}

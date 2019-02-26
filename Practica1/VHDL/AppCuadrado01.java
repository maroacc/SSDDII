public class AppCuadrado01
{
	public static void main(String args[])
	{


		Cuadrado cuadrado1 = new Cuadrado(); //Creamos un nuevo objeto a través del constructor por defecto
    Cuadrado cuadrado2 = new Cuadrado();
    Cuadrado cuadrado3 = new Cuadrado();
	  Dibujo dibujo1 = new Dibujo();
    Util util1 = new Util();

		Cuadrado.setRELLENO(true);
    cuadrado1.setLado(4);
    cuadrado1.setX(4);
    cuadrado1.setY(4);

    dibujo1.pintar(cuadrado1);

    util1.wait(1);

    cuadrado2.setLado(9);
    cuadrado2.setX(9);
    cuadrado2.setY(9);
    dibujo1.pintar(cuadrado2);

    util1.wait(1);

    cuadrado3.setLado(45);
    cuadrado3.setX(45);
    cuadrado3.setY(45);
    dibujo1.pintar(cuadrado3);



	}
}

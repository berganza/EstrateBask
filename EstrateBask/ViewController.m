//
//  ViewController.m
//  EstrateBask
//
//  Created by LLBER on 18/11/12.
//  Copyright (c) 2012 LLBER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    _red = 0.0/255.0;
    _green = 255.0/255.0;
    _blue = 0.0/255.0;
    
    _grosor = 5.0;
    _opacidad = 1.0;
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//Vamos a usar estos tres métodos para implementar la lógica de dibujo.
//touchesBegan
//touchesMoved
//touchesEnded



- (void)touchesBegan:(NSSet *)toques withEvent:(UIEvent *)evento {
    
    //Un objeto UITouch representa el movimiento de un dedo en la pantalla para un evento en particular.
    UITouch *toque = [toques anyObject];
    //la variable ultimoPunto se inicializa en el punto de contacto actual (donde el dedo toca el canvas)
    _ultimoPunto = [toque locationInView:self.view];
}





//se obtiene el punto de toque actual y luego dibujar una línea con CGContextAddLineToPoint de ultimoPunto al punto actual. Produce una serie de líneas rectas, pero las líneas son lo suficientemente cortas que el resultado se parece a una curva suave.
- (void)touchesMoved:(NSSet *)toques withEvent:(UIEvent *)evento {
    
    
    UITouch *toque = [toques anyObject];
    CGPoint puntoActual = [toque locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.zonaDibujo.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _ultimoPunto.x, _ultimoPunto.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), puntoActual.x, puntoActual.y);
    
    
    //Ajustamos el tamaño de nuestro lapiz: la opacidad y color del trazo
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _grosor );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    
    //Por ultimo, hacemos que se dibujen las lineas
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.zonaDibujo.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.zonaDibujo setAlpha:_opacidad];
    UIGraphicsEndImageContext();
    
    _ultimoPunto = puntoActual;
}



- (void)touchesEnded:(NSSet *)toques withEvent:(UIEvent *)evento {
    
}









- (IBAction)lapizRojo:(id)sender {
    
    UIButton * lapizRojo = (UIButton *) sender;
    
    switch (lapizRojo.tag) {
        case 1:
            
            _red = 255.0/255.0;
            _green = 0.0/255.0;
            _blue = 0.0/255.0;
            
            break;
    }
}






- (IBAction)gomaBorrar:(id)sender {
    
    self.zonaDibujo.image = nil;
    
    
    
}





@end

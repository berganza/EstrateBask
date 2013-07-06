//
//  ViewController.h
//  EstrateBask
//
//  Created by LLBER on 18/11/12.
//  Copyright (c) 2012 LLBER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController



//Definimos las instancias de variables

//almacena el último punto dibujado en el canvas. Esto se usa cuando un trazo de pincel se está dibujado en el canvas.
@property CGPoint ultimoPunto;


//almacena los actuales valores RGB del color seleccionado.
@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;


//Almacena el ancho del trazo del pincel y su opacidad.
@property CGFloat grosor;
@property CGFloat opacidad;




//Enlazamos el storyboard
@property (strong, nonatomic) IBOutlet UIImageView *zonaDibujo;

- (IBAction)lapizRojo:(id)sender;

- (IBAction)gomaBorrar:(id)sender;




















@end

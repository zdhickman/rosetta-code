#lang racket

#| USAGE:

- Load your picture in the constant PICTURE
- Run the program, from command line or Drracket
- Click a pixel in the picture to output the color to the command line
  + Outputs in the format (color -red -green -blue -alpha)
- Color is also constantly saved as the world state
  
|#

(require 2htdp/universe 2htdp/image picturing-programs)

(define PICTURE pic:hacker)
(define HEIGHT (image-height PICTURE))
(define WIDTH  (image-width  PICTURE))

(define (color->string c)
  (format "(color ~a ~a ~a ~a)" (color-red c) (color-green c)
                                (color-blue c) (color-alpha c)))

(define (do-color w x y k)
  (define g (get-pixel-color x y PICTURE))
  (when (mouse=? "button-down" k) (displayln (color->string g)))
  g)

(big-bang (color 255 255 255 0)
          (to-draw (lambda (w) PICTURE))
          (on-mouse do-color))

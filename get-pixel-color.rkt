#lang racket

(require 2htdp/universe 2htdp/image picturing-programs)

(define PICTURE pic:hacker)
(define HEIGHT (image-height PICTURE))
(define WIDTH  (image-width  PICTURE))

(define (color->string c)
  (format "(color ~a ~a ~a ~a)" (color-red c) (color-green c)
                                (color-blue c) (color-alpha c)))

(define (do-color w x y k)
  (define g (get-pixel-color x y PICTURE))
  (cond [(mouse=? "button-down" k) (printf (string-append (color->string g) "\n")) g]
        [else g]))

(big-bang (color 255 255 255 0)
          (to-draw (lambda (w) PICTURE))
          (on-mouse do-color))
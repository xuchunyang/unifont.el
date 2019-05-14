;; -*- lexical-binding: t; -*-

(require 'buttercup)
(require 'unifont)

(describe "unifont-get-bits"
  (it "Exact value"
    (expect (unifont-get-bits ?a)
            :to-equal '(2 0 0 0 0 0 0 60 66 2 62 66 66 70 58 0 0)))
  (it "Right shape"
    (expect (pcase (unifont-get-bits ?b)
              (`(2 . ,(app length 16)) t))
            :to-be t)
    (expect (pcase (unifont-get-bits ?好)
              (`(4 . ,(app length 16)) t))
            :to-be t)))

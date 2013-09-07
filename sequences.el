;;; sequences.el --- Ports of some Clojure sequence functions.

;; This file is not part of GNU Emacs

;;; License:

;; [CC BY](http://creativecommons.org/licenses/by/3.0/)

;;; Contributors:

;; Tim Visher ([@timvisher](https://twitter.com/timvisher))

;;; Code:

(defun sequences-tree-seq (branch? children root)
  (cl-labels ((walk (node)
                    (cons node
                          (if (funcall branch? node)
                              (cl-mapcan #'walk (cddr (funcall children node)))))))
    (walk root)))

(defun sequences-file-seq (root)
  (tree-seq 'file-directory-p
            (lambda (directory)
              (directory-files directory t))
            (expand-file-name root)))

(provide 'sequences)

;;; Local Variables:
;;; tab-width:2
;;; indent-tabs-mode:nil
;;; lexical-binding:t
;;; End:
;;; sequences.el ends here

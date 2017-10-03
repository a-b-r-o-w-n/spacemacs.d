(setq js2-mode-show-strict-warnings nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-include-node-externs t)
(setq js2-strict-trailing-comma-warning nil)
(setq js2-strict-missing-semi-warning nil)
(setq js2-strict-cond-assign-warning nil)
(setq js2-strict-inconsistent-return-warning nil)
(setq js2-strict-var-hides-function-arg-warning nil)
(setq js2-strict-var-redeclaration-warning nil)

(setq-default
 ;; js2-mode
 js-indent-level 2
 js2-basic-offset 2
 js2-highlight-level 3

 ;; web-mode
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)

;; Use rjsx-mode for all js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

(provide 'init-javascript)

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

;; Use js2-jsx-mode for all js files
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

;; Set jsx indentation offset to same as js js
(add-hook 'js2-jsx-mode-hook #'set-jsx-indentation)
(defun set-jsx-indentation ()
  (setq-local sgml-basic-offset js2-basic-offset))

(setq company-backends-js2-mode '((company-tern :with company-dabbrev)
                                  company-files
                                  company-dabbrev))

;; Set up flycheck for javascript
(with-eval-after-load 'flycheck-mode
  (push 'javascript-jshint flycheck-disabled-checkers)
  (push 'json-jsonlint flycheck-disabled-checkers)
  (push 'js2-jsx-mode flycheck-global-modes)
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  )

;; Treat _ as a word character
(with-eval-after-load 'js2-jsx-mode
  (modify-syntax-entry ?_ "w" js2-jsx-mode-syntax-table))

(add-hook 'js-mode-hook 'eslint-set-closest-executable)
(defun eslint-set-closest-executable (&optional dir)
  ;; Find eslint by walking up directory
  (interactive)
  (let* ((dir (or dir default-directory))
         (eslint-executable (concat dir "/node_modules/.bin/eslint")))
    (if (file-exists-p eslint-executable)
        (progn
          (make-variable-buffer-local 'flycheck-javascript-eslint-executable)
          (setq flycheck-javascript-eslint-executable eslint-executable))
      (if (string= dir "/") nil
        (eslint-set-closest-executable (expand-file-name ".." dir))))))

;; Monkey patch to fix indentation for attributes in jsx
(load-file "~/.spacemacs.d/lisp/sgml-mode-patch.el")
(require 'sgml-mode)

(provide 'init-javascript)

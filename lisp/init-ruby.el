(add-hook 'ruby-mode-hook 'rvm-activate-corresponding-ruby)

;; Treat _ as a word character
(with-eval-after-load 'ruby-mode
  (modify-syntax-entry ?_ "w" ruby-mode-syntax-table))

(provide 'init-ruby)

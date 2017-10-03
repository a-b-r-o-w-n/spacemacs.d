;; Treat _ as a word character
(with-eval-after-load 'ruby-mode
  (modify-syntax-entry ?_ "w" ruby-mode-syntax-table))

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(provide 'init-ruby)

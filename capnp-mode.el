;; Capnp (GPL2)
;; Derived from http://cc-mode.sourceforge.net/derived-mode-ex.el.

(require 'cc-mode)

(eval-when-compile
  (require 'cc-langs)
  (require 'cc-fonts))

(eval-and-compile (c-add-language 'capnp-mode 'idl-mode))

(c-lang-defconst c-operators
  capnp `((left-assoc "->")))

(c-lang-defconst c-other-op-syntax-tokens
  capnp nil)

(c-lang-defconst c-opt-cpp-symbol
  capnp nil)

(c-lang-defconst c-opt-cpp-prefix
  capnp nil)

(c-lang-defconst c-primitive-type-kwds
  capnp (append '("Void" "Bool" "Text" "Data" "List"
                   "Int8"  "Int16"  "Int32"  "Int64"
                  "UInt8" "UInt16" "UInt32" "UInt64")))

(c-lang-defconst c-primitive-type-prefix-kwds
  capnp nil)

(c-lang-defconst c-type-prefix-kwds
  capnp nil)

(c-lang-defconst c-type-modifier-kwds
  capnp '("const"))

(c-lang-defconst c-class-decl-kwds
  capnp '("enum" "struct" "interface" "group" "union"))

(c-lang-defconst c-brace-list-decl-kwds
  capnp nil)

(c-lang-defconst c-other-block-decl-kwds
  capnp nil)

(c-lang-defconst c-ref-list-kwds
  capnp nil)

(c-lang-defconst c-nonsymbol-sexp-kwds
  capnp nil)

(c-lang-defconst c-modifier-kwds
  capnp nil)

(c-lang-defconst c-block-decls-with-vars
  capnp nil)

(c-lang-defconst c-block-stmt-1-kwds
  capnp nil)

(c-lang-defconst c-block-stmt-2-kwds
  capnp nil)

(c-lang-defconst c-simple-stmt-kwds
  capnp nil)

(c-lang-defconst c-asm-stmt-kwds
  capnp nil)

(c-lang-defconst c-case-kwds
  capnp nil)

(c-lang-defconst c-label-kwds
  capnp nil)

(c-lang-defconst c-before-label-kwds
  capnp nil)

(c-lang-defconst c-constant-kwds
  capnp '("true" "false" "void"))

(c-lang-defconst c-bitfield-kwds
  capnp nil)

(c-lang-defconst c-opt-bitfield-key
  capnp nil)

(c-lang-defconst c-other-kwds
  capnp '("const" "import"))

(c-lang-defconst c-primary-expr-kwds
  capnp nil)

(c-lang-defconst c-line-comment-starter
  capnp "#")

(defvar capnp-mode-syntax-table
  (let ((st (make-syntax-table)))
       (modify-syntax-entry ?# "<" st)
       (modify-syntax-entry ?\n ">" st)
       st)
  "Syntax table for capnp-mode")

(defgroup capnp nil "Capnproto mode customizations")

(defcustom capnp-mode-hook nil
  "*Hook called by `capnp-mode'."
  :type 'hook
  :group 'capnp)

(defconst capnp-font-lock-keywords-1 (c-lang-const c-matchers-1 capnp)
  "Minimal highlighting for Capnproto mode.")

(defconst capnp-font-lock-keywords-2 (c-lang-const c-matchers-2 capnp)
  "Fast normal highlighting for Capnproto mode.")

(defconst capnp-font-lock-keywords-3 (c-lang-const c-matchers-3 capnp)
  "Accurate normal highlighting for Capnproto mode.")

(defvar capnp-font-lock-keywords capnp-font-lock-keywords-3
  "Default expressions to highlight in Capnproto mode.")

;;;###autoload
(defun capnp-mode ()
  "Major mode for editing Capnproto schemas.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `capnp-mode-hook'."
  (interactive)
  (kill-all-local-variables)
  (c-initialize-cc-mode t)
  (set-syntax-table capnp-mode-syntax-table)
  (setq major-mode 'capnp-mode
        mode-name "Capnproto")
  (c-init-language-vars capnp-mode)
  (c-common-init 'capnp-mode)
  (run-hooks 'c-mode-common-hook)
  (run-hooks 'capnp-mode-hook)
  (c-update-modeline))

(provide 'capnp-mode)

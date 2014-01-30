syn match rubyCustomScope           "::"
syn match rhbyCustomDot             "\(\w\d)}\]\).\(\w\d({\[\)"
syn match rubyCustomDot             "."
syn match rhbyCustomRange           /\v(\w|\d|\)|\}|\])\.\.(\w|\d|\(|\{|\[)/
syn match rjbyCustomRange           /\v\d\zs\.\.\ze\d/
syn match rubyCustomRange           /\v\d\.\.\d/
syn match rubyCustomRocket          "=>"
syn match rubyCustomTernaryIf       "\s?\s"
syn match rubyCustomTernaryElse     "\s:\s"
syn match rubyCustomAssignment      "\s=\s"
syn match rubyCustomEquality        "\s==\s"
syn match rubyCustomPredicateMethod "\w?"
syn match rubyCustomDangerousMethod "\w!"


hi def link rubyCustomScope           Operator
hi def link rubyCustomDot             Operator
hi def link rubyCustomRange           Operator
hi def link rubyCustomRocket          Operator
hi def link rubyCustomTernaryIf       Operator
hi def link rubyCustomTernaryElse     Operator
hi def link rubyCustomAssignment      Operator
hi def link rubyCustomEquality        Operator
hi def link rubyCustomPredicateMethod Operator
hi def link rubyCustomDangerousMethod Operator

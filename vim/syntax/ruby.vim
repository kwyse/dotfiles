syn match rubyCustomScope           "::"
syn match rubyCustomTernaryIf       "\s?\s"
syn match rubyCustomTernaryElse     "\s:\s"
syn match rubyCustomAssignment      "\s=\s"
syn match rubyCustomPredicateMethod "\w?"
syn match rubyCustomDangerousMethod "\w!"


hi def link rubyCustomScope           Identifier
hi def link rubyMethodDeclaration     Identifier
hi def link rubyCustomTernaryIf       Operator
hi def link rubyCustomTernaryElse     Operator
hi def link rubyCustomAssignment      Operator
hi def link rubyCustomPredicateMethod Operator
hi def link rubyCustomDangerousMethod Operator
